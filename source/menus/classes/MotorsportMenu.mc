import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class MotorsportMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        addItem(new CustomLabelMenuItem("24.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Driving), WatchUi.loadResource(Rez.Strings.Motorsport_Driving)));
        addItem(new CustomLabelMenuItem("22.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Motorcycling), WatchUi.loadResource(Rez.Strings.Motorsport_Motorcycling)));
        addItem(new CustomLabelMenuItem("22.36," + WatchUi.loadResource(Rez.Strings.Motorsport_Motocross), WatchUi.loadResource(Rez.Strings.Motorsport_Motocross)));
        addItem(new CustomLabelMenuItem("23.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Boating), WatchUi.loadResource(Rez.Strings.Motorsport_Boating)));
        addItem(new CustomLabelMenuItem("36.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Snowmobiling), WatchUi.loadResource(Rez.Strings.Motorsport_Snowmobiling)));
        addItem(new CustomLabelMenuItem("22.35," + WatchUi.loadResource(Rez.Strings.Motorsport_ATV), WatchUi.loadResource(Rez.Strings.Motorsport_ATV)));
        addItem(new CustomLabelMenuItem("57.0," + WatchUi.loadResource(Rez.Strings.Motorsport_Race), WatchUi.loadResource(Rez.Strings.Motorsport_Race)));
        



    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Motorsports), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}