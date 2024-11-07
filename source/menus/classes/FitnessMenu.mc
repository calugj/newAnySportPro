import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class FitnessMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        
        addItem(new CustomLabelMenuItem("4.0," + WatchUi.loadResource(Rez.Strings.Fitness_Generic), WatchUi.loadResource(Rez.Strings.Fitness_Generic)));
        addItem(new CustomLabelMenuItem("4.14," + WatchUi.loadResource(Rez.Strings.Fitness_Rowing), WatchUi.loadResource(Rez.Strings.Fitness_Rowing)));
        addItem(new CustomLabelMenuItem("4.15," + WatchUi.loadResource(Rez.Strings.Fitness_Elliptical), WatchUi.loadResource(Rez.Strings.Fitness_Elliptical)));
        addItem(new CustomLabelMenuItem("4.16," + WatchUi.loadResource(Rez.Strings.Fitness_Stair), WatchUi.loadResource(Rez.Strings.Fitness_Stair)));
        addItem(new CustomLabelMenuItem("4.25," + WatchUi.loadResource(Rez.Strings.Fitness_Ski), WatchUi.loadResource(Rez.Strings.Fitness_Ski)));
        addItem(new CustomLabelMenuItem("84.0," + WatchUi.loadResource(Rez.Strings.Fitness_JumpRope), WatchUi.loadResource(Rez.Strings.Fitness_JumpRope)));
        addItem(new CustomLabelMenuItem("59.1," + WatchUi.loadResource(Rez.Strings.Fitness_Onshore), WatchUi.loadResource(Rez.Strings.Fitness_Onshore)));
    }
    

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Fitness), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}