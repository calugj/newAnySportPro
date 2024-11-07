import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class WalkingMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        
        addItem(new CustomLabelMenuItem("11.0," + WatchUi.loadResource(Rez.Strings.Walking_Generic), WatchUi.loadResource(Rez.Strings.Walking_Generic)));
        addItem(new CustomLabelMenuItem("17.0," + WatchUi.loadResource(Rez.Strings.Walking_Hiking), WatchUi.loadResource(Rez.Strings.Walking_Hiking)));
        addItem(new CustomLabelMenuItem("16.0," + WatchUi.loadResource(Rez.Strings.Walking_Mountaineering), WatchUi.loadResource(Rez.Strings.Walking_Mountaineering)));
        addItem(new CustomLabelMenuItem("11.30," + WatchUi.loadResource(Rez.Strings.Walking_Casual), WatchUi.loadResource(Rez.Strings.Walking_Casual)));
        addItem(new CustomLabelMenuItem("11.31," + WatchUi.loadResource(Rez.Strings.Walking_Speed), WatchUi.loadResource(Rez.Strings.Walking_Speed)));
        addItem(new CustomLabelMenuItem("11.27," + WatchUi.loadResource(Rez.Strings.Walking_Indoor), WatchUi.loadResource(Rez.Strings.Walking_Indoor)));
        
        
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Walking), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}