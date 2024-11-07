import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class RunningMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        addItem(new CustomLabelMenuItem("1.0," + WatchUi.loadResource(Rez.Strings.Run_Generic), WatchUi.loadResource(Rez.Strings.Run_Generic)));
        addItem(new CustomLabelMenuItem("1.1," + WatchUi.loadResource(Rez.Strings.Run_Treadmill), WatchUi.loadResource(Rez.Strings.Run_Treadmill)));
        addItem(new CustomLabelMenuItem("1.2," + WatchUi.loadResource(Rez.Strings.Run_Street), WatchUi.loadResource(Rez.Strings.Run_Street)));
        addItem(new CustomLabelMenuItem("1.3," + WatchUi.loadResource(Rez.Strings.Run_Trail), WatchUi.loadResource(Rez.Strings.Run_Trail)));
        addItem(new CustomLabelMenuItem("1.4," + WatchUi.loadResource(Rez.Strings.Run_Track), WatchUi.loadResource(Rez.Strings.Run_Track)));
        addItem(new CustomLabelMenuItem("1.67," + WatchUi.loadResource(Rez.Strings.Run_Ultra), WatchUi.loadResource(Rez.Strings.Run_Ultra)));
        addItem(new CustomLabelMenuItem("1.45," + WatchUi.loadResource(Rez.Strings.Run_Indoor), WatchUi.loadResource(Rez.Strings.Run_Indoor)));
        addItem(new CustomLabelMenuItem("1.59," + WatchUi.loadResource(Rez.Strings.Run_Obstacle), WatchUi.loadResource(Rez.Strings.Run_Obstacle)));
        addItem(new CustomLabelMenuItem("1.58," + WatchUi.loadResource(Rez.Strings.Run_Virtual), WatchUi.loadResource(Rez.Strings.Run_Virtual)));
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Running), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}