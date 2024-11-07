import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class WaterMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        addItem(new CustomLabelMenuItem("32.0," + WatchUi.loadResource(Rez.Strings.Water_Sail), WatchUi.loadResource(Rez.Strings.Water_Sail)));
        addItem(new CustomLabelMenuItem("41.0," + WatchUi.loadResource(Rez.Strings.Water_Kayak), WatchUi.loadResource(Rez.Strings.Water_Kayak)));
        addItem(new CustomLabelMenuItem("19.0," + WatchUi.loadResource(Rez.Strings.Water_Paddle), WatchUi.loadResource(Rez.Strings.Water_Paddle)));
        addItem(new CustomLabelMenuItem("37.0," + WatchUi.loadResource(Rez.Strings.Water_SUP), WatchUi.loadResource(Rez.Strings.Water_SUP)));
        addItem(new CustomLabelMenuItem("42.0," + WatchUi.loadResource(Rez.Strings.Water_Raft), WatchUi.loadResource(Rez.Strings.Water_Raft)));
        addItem(new CustomLabelMenuItem("42.41," + WatchUi.loadResource(Rez.Strings.Water_Whitewater), WatchUi.loadResource(Rez.Strings.Water_Whitewater)));
        addItem(new CustomLabelMenuItem("15.0," + WatchUi.loadResource(Rez.Strings.Water_Row), WatchUi.loadResource(Rez.Strings.Water_Row)));
        addItem(new CustomLabelMenuItem("43.0," + WatchUi.loadResource(Rez.Strings.Water_Windsurf), WatchUi.loadResource(Rez.Strings.Water_Windsurf)));
        addItem(new CustomLabelMenuItem("44.0," + WatchUi.loadResource(Rez.Strings.Water_Kitesurf), WatchUi.loadResource(Rez.Strings.Water_Kitesurf)));
        addItem(new CustomLabelMenuItem("39.0," + WatchUi.loadResource(Rez.Strings.Water_Wakeboard), WatchUi.loadResource(Rez.Strings.Water_Wakeboard)));
        addItem(new CustomLabelMenuItem("77.0," + WatchUi.loadResource(Rez.Strings.Water_Wakesurf), WatchUi.loadResource(Rez.Strings.Water_Wakesurf)));
        addItem(new CustomLabelMenuItem("40.0," + WatchUi.loadResource(Rez.Strings.Water_Ski), WatchUi.loadResource(Rez.Strings.Water_Ski)));
        addItem(new CustomLabelMenuItem("38.0," + WatchUi.loadResource(Rez.Strings.Water_Surf), WatchUi.loadResource(Rez.Strings.Water_Surf)));
        addItem(new CustomLabelMenuItem("82.0," + WatchUi.loadResource(Rez.Strings.Water_Snorkel), WatchUi.loadResource(Rez.Strings.Water_Snorkel)));
        addItem(new CustomLabelMenuItem("76.0," + WatchUi.loadResource(Rez.Strings.Water_Tube), WatchUi.loadResource(Rez.Strings.Water_Tube)));
        
        



        
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.WaterSports), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}