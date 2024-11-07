import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

class BackgroundColorMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        

        addItem(new CustomColorMenuItem(Graphics.COLOR_WHITE, WatchUi.loadResource(Rez.Strings.COLOR_WHITE), "HEX " + Graphics.COLOR_WHITE.format("%06X"), Graphics.COLOR_WHITE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_BLACK, WatchUi.loadResource(Rez.Strings.COLOR_BLACK), "HEX " + Graphics.COLOR_BLACK.format("%06X"), Graphics.COLOR_BLACK));



        
        setFocus(findItemById(Properties.getValue("BackgroundColor")));

    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.BackgroundColor), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class BackgroundColorMenuDelegate extends Menu2InputDelegate {
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        var color = item.getId();
        Properties.setValue("BackgroundColor", color);

        
        onBack();

        var menu = new MainMenu();
        menu.setFocus(menu.findItemById(:backgroundColor));

        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }


}






