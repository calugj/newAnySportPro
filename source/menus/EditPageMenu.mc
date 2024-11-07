import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

class EditPageMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;
    private var pageNumber;

    function initialize(param_pageNumber) {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        pageNumber = param_pageNumber;

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        var fieldsNumber = Properties.getValue("FieldsPage" + pageNumber.toString());
        var editNumber_substring;
        if(fieldsNumber <= 1) {
            editNumber_substring = fieldsNumber.toString() + " " + WatchUi.loadResource(Rez.Strings.Field);
        } else {
            editNumber_substring = fieldsNumber.toString() + " " + WatchUi.loadResource(Rez.Strings.Fields);
        }

        addItem(new CustomIconMenuItem(:editNumber, WatchUi.loadResource(Rez.Strings.EditFieldsNumber), editNumber_substring, WatchUi.loadResource($.Rez.Drawables.Custom)));
        addItem(new CustomIconMenuItem(:editFields, WatchUi.loadResource(Rez.Strings.EditFields), null, WatchUi.loadResource($.Rez.Drawables.Custom)));
        if(Properties.getValue("Pages") > 1) {
            addItem(new CustomIconMenuItem(:delete, WatchUi.loadResource(Rez.Strings.DeletePage), null, WatchUi.loadResource($.Rez.Drawables.Delete))); 
        }



        

    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.EditPage) + " " + pageNumber.toString(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class EditPageMenuDelegate extends Menu2InputDelegate {
    
    private var pageNumber;

    function initialize(param_pageNumber as Number) {
        Menu2InputDelegate.initialize();

        pageNumber = param_pageNumber;
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        switch(id) {
           case :editNumber:
                var view = new CustomNumberPicker();
                WatchUi.pushView(view, new EditFieldsNumberPickerDelegate(view, Properties.getValue("FieldsPage" + pageNumber.toString()), 1, 6, pageNumber), WatchUi.SLIDE_LEFT);
                break;
            case :editFields:
                var view1 = new PageSettingView(pageNumber, true);
                WatchUi.pushView(view1, new FieldSettingViewDelegate(view1, pageNumber, 0), WatchUi.SLIDE_LEFT);
                break;
            case :delete:
                deletePage();
                WatchUi.popView(WatchUi.SLIDE_RIGHT);
                var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:page => pageNumber - 1,:wrap => true, :color => Properties.getValue("AccentColor") as Number});
                WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_RIGHT);
                WatchUi.requestUpdate();
                break;
        }

        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:page => pageNumber - 1,:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }





    private function deletePage()   {
        var pages = Properties.getValue("Pages");
        if(pages == 1) {
            return;
        }

        for(var index_page = pageNumber ; index_page < pages ; index_page++) {
            var value = 4;
            try {
                value = Properties.getValue("FieldsPage" + (index_page+1).toString());
            } catch(e) {}
            Properties.setValue("FieldsPage" + index_page.toString(), value);

            for(var index_field = 1 ; index_field <= 6 ; index_field++) {
                value = 0;
                try {
                    value = Properties.getValue("Field" + index_field.toString() + "Page" + (index_page+1).toString());
                } catch(e) {}
                Properties.setValue("Field" + index_field.toString() + "Page" + index_page.toString(), value);
            }
        }

        Properties.setValue("Pages", pages-1);
        

    }


}




class EditFieldsNumberPickerDelegate extends CustomNumberPickerDelegate {

    private var pageNumber;
    
    function initialize(mView , mInitialValue as Number, mMIN_VAL as Number, mMAX_VAL as Number, param_pageNumber) {
        CustomNumberPickerDelegate.initialize(mView , mInitialValue, mMIN_VAL, mMAX_VAL);
        pageNumber = param_pageNumber;
    }

    function onConfirm() {
        Properties.setValue("FieldsPage" + pageNumber.toString(), getValue());
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new EditPageMenu(pageNumber);
        menu.setFocus(menu.findItemById(:editNumber));
        WatchUi.switchToView(menu, new EditPageMenuDelegate(pageNumber), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }
}