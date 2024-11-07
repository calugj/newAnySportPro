import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

class FieldSettingMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        
        
        addItem(new CustomLabelMenuItem(0 , "timer"));
        addItem(new CustomLabelMenuItem(1 , "timer lap"));
        addItem(new CustomLabelMenuItem(2 , "last lap"));
        addItem(new CustomLabelMenuItem(3 , "avg lap"));
        addItem(new CustomLabelMenuItem(4 , "elapsed time"));
        addItem(new CustomLabelMenuItem(5 , "dist"));
        addItem(new CustomLabelMenuItem(6 , "lap dist"));
        addItem(new CustomLabelMenuItem(7 , "last lap dist"));
        addItem(new CustomLabelMenuItem(8 , "pace"));
        addItem(new CustomLabelMenuItem(9 , "avg pace"));
        addItem(new CustomLabelMenuItem(10 , "avg lap pace"));
        addItem(new CustomLabelMenuItem(11 , "last lap pace"));
        addItem(new CustomLabelMenuItem(12 , "max pace"));
        addItem(new CustomLabelMenuItem(13 , "speed"));
        addItem(new CustomLabelMenuItem(14 , "avg speed"));
        addItem(new CustomLabelMenuItem(15 , "avg lap speed"));
        addItem(new CustomLabelMenuItem(16 , "last lap speed"));
        addItem(new CustomLabelMenuItem(17 , "max speed"));
        addItem(new CustomLabelMenuItem(18 , "heart rate"));
        addItem(new CustomLabelMenuItem(19 , "avg heart rate"));


        

    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Field), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class FieldSettingMenuDelegate extends Menu2InputDelegate {
    
    var page;
    var field;
    
    function initialize(param_page as Number, param_field as Number) {
        Menu2InputDelegate.initialize();
        page = param_page;
        field = param_field;    
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        Properties.setValue("Field" + field.toString() + "Page" + page.toString(), id);
        onBack();

        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var view = new PageSettingView(page, true);
        view.setPosition(field - 1);
        WatchUi.switchToView(view, new FieldSettingViewDelegate(view, page, field - 1), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }


}






