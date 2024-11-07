import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class TrainingMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        
        addItem(new CustomLabelMenuItem("10.0," + WatchUi.loadResource(Rez.Strings.Training_Generic), WatchUi.loadResource(Rez.Strings.Training_Generic)));
        addItem(new CustomLabelMenuItem("10.19," + WatchUi.loadResource(Rez.Strings.Training_Flexibility), WatchUi.loadResource(Rez.Strings.Training_Flexibility)));
        addItem(new CustomLabelMenuItem("10.20," + WatchUi.loadResource(Rez.Strings.Training_Strength), WatchUi.loadResource(Rez.Strings.Training_Strength)));
        addItem(new CustomLabelMenuItem("10.26," + WatchUi.loadResource(Rez.Strings.Training_Cardio), WatchUi.loadResource(Rez.Strings.Training_Cardio)));
        addItem(new CustomLabelMenuItem("10.43," + WatchUi.loadResource(Rez.Strings.Training_Yoga), WatchUi.loadResource(Rez.Strings.Training_Yoga)));
        addItem(new CustomLabelMenuItem("4.44," + WatchUi.loadResource(Rez.Strings.Training_Pilates), WatchUi.loadResource(Rez.Strings.Training_Pilates)));
        addItem(new CustomLabelMenuItem("62.70," + WatchUi.loadResource(Rez.Strings.Training_HIIT), WatchUi.loadResource(Rez.Strings.Training_HIIT)));
        addItem(new CustomLabelMenuItem("62.73," + WatchUi.loadResource(Rez.Strings.Training_AMRAP), WatchUi.loadResource(Rez.Strings.Training_AMRAP)));
        addItem(new CustomLabelMenuItem("62.74," + WatchUi.loadResource(Rez.Strings.Training_EMOM), WatchUi.loadResource(Rez.Strings.Training_EMOM)));
        addItem(new CustomLabelMenuItem("62.75," + WatchUi.loadResource(Rez.Strings.Training_TABATA), WatchUi.loadResource(Rez.Strings.Training_TABATA)));
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Training), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}