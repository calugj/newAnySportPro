import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

class AccentColorMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        

        addItem(new CustomColorMenuItem(Graphics.COLOR_WHITE, WatchUi.loadResource(Rez.Strings.COLOR_WHITE), "HEX " + Graphics.COLOR_WHITE.format("%06X"), Graphics.COLOR_WHITE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_LT_GRAY, WatchUi.loadResource(Rez.Strings.COLOR_LT_GRAY), "HEX " + Graphics.COLOR_LT_GRAY.format("%06X"), Graphics.COLOR_LT_GRAY));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_GRAY, WatchUi.loadResource(Rez.Strings.COLOR_DK_GRAY), "HEX " + Graphics.COLOR_DK_GRAY.format("%06X"), Graphics.COLOR_DK_GRAY));
        addItem(new CustomColorMenuItem(Graphics.COLOR_BLACK, WatchUi.loadResource(Rez.Strings.COLOR_BLACK), "HEX " + Graphics.COLOR_BLACK.format("%06X"), Graphics.COLOR_BLACK));
        addItem(new CustomColorMenuItem(Graphics.COLOR_RED, WatchUi.loadResource(Rez.Strings.COLOR_RED), "HEX " + Graphics.COLOR_RED.format("%06X"), Graphics.COLOR_RED));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_RED, WatchUi.loadResource(Rez.Strings.COLOR_DK_RED), "HEX " + Graphics.COLOR_DK_RED.format("%06X"), Graphics.COLOR_DK_RED));
        addItem(new CustomColorMenuItem(Graphics.COLOR_ORANGE, WatchUi.loadResource(Rez.Strings.COLOR_ORANGE), "HEX " + Graphics.COLOR_ORANGE.format("%06X"), Graphics.COLOR_ORANGE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_YELLOW, WatchUi.loadResource(Rez.Strings.COLOR_YELLOW), "HEX " + Graphics.COLOR_YELLOW.format("%06X"), Graphics.COLOR_YELLOW));
        addItem(new CustomColorMenuItem(Graphics.COLOR_GREEN, WatchUi.loadResource(Rez.Strings.COLOR_GREEN), "HEX " + Graphics.COLOR_GREEN.format("%06X"), Graphics.COLOR_GREEN));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_GREEN, WatchUi.loadResource(Rez.Strings.COLOR_DK_GREEN), "HEX " + Graphics.COLOR_DK_GREEN.format("%06X"), Graphics.COLOR_DK_GREEN));
        addItem(new CustomColorMenuItem(Graphics.COLOR_BLUE, WatchUi.loadResource(Rez.Strings.COLOR_BLUE), "HEX " + Graphics.COLOR_BLUE.format("%06X"), Graphics.COLOR_BLUE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_DK_BLUE, WatchUi.loadResource(Rez.Strings.COLOR_DK_BLUE), "HEX " + Graphics.COLOR_DK_BLUE.format("%06X"), Graphics.COLOR_DK_BLUE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_PURPLE, WatchUi.loadResource(Rez.Strings.COLOR_PURPLE), "HEX " + Graphics.COLOR_PURPLE.format("%06X"), Graphics.COLOR_PURPLE));
        addItem(new CustomColorMenuItem(Graphics.COLOR_PINK, WatchUi.loadResource(Rez.Strings.COLOR_PINK), "HEX " + Graphics.COLOR_PINK.format("%06X"), Graphics.COLOR_PINK));
        addItem(new CustomColorMenuItem(Graphics.COLOR_TRANSPARENT, WatchUi.loadResource(Rez.Strings.COLOR_TRANSPARENT), "HEX " + Graphics.COLOR_TRANSPARENT.format("%06X"), Graphics.COLOR_TRANSPARENT));



        
        setFocus(findItemById(Properties.getValue("AccentColor")));

    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.AccentColor), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class AccentColorMenuDelegate extends Menu2InputDelegate {
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        var color = item.getId();
        Properties.setValue("AccentColor", color);

        
        onBack();

        var menu = new MainMenu();
        menu.setFocus(menu.findItemById(:accentColor));

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






