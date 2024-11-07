import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class ClimbingMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        
        addItem(new CustomLabelMenuItem("31.0," + WatchUi.loadResource(Rez.Strings.Climbing_Generic), WatchUi.loadResource(Rez.Strings.Climbing_Generic)));
        addItem(new CustomLabelMenuItem("48.0," + WatchUi.loadResource(Rez.Strings.Climbing_Floor), WatchUi.loadResource(Rez.Strings.Climbing_Floor)));
        addItem(new CustomLabelMenuItem("31.68," + WatchUi.loadResource(Rez.Strings.Climbing_Indoor), WatchUi.loadResource(Rez.Strings.Climbing_Indoor)));
        addItem(new CustomLabelMenuItem("31.69," + WatchUi.loadResource(Rez.Strings.Climbing_Bouldering), WatchUi.loadResource(Rez.Strings.Climbing_Bouldering)));
        
        



        
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Climbing), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}