import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class FieldMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        addItem(new CustomLabelMenuItem("64.85," + WatchUi.loadResource(Rez.Strings.Field_Padel), WatchUi.loadResource(Rez.Strings.Field_Padel)));
        addItem(new CustomLabelMenuItem("8.0," + WatchUi.loadResource(Rez.Strings.Field_Tennis), WatchUi.loadResource(Rez.Strings.Field_Tennis)));
        addItem(new CustomLabelMenuItem("7.0," + WatchUi.loadResource(Rez.Strings.Field_Soccer), WatchUi.loadResource(Rez.Strings.Field_Soccer)));
        addItem(new CustomLabelMenuItem("75.0," + WatchUi.loadResource(Rez.Strings.Field_Volleyball), WatchUi.loadResource(Rez.Strings.Field_Volleyball)));
        addItem(new CustomLabelMenuItem("6.0," + WatchUi.loadResource(Rez.Strings.Field_Basketball), WatchUi.loadResource(Rez.Strings.Field_Basketball)));
        addItem(new CustomLabelMenuItem("9.0," + WatchUi.loadResource(Rez.Strings.Field_AmericanFootball), WatchUi.loadResource(Rez.Strings.Field_AmericanFootball)));
        addItem(new CustomLabelMenuItem("49.0," + WatchUi.loadResource(Rez.Strings.Field_Baseball), WatchUi.loadResource(Rez.Strings.Field_Baseball)));
        addItem(new CustomLabelMenuItem("72.0," + WatchUi.loadResource(Rez.Strings.Field_Rugby), WatchUi.loadResource(Rez.Strings.Field_Rugby)));
        addItem(new CustomLabelMenuItem("73.0," + WatchUi.loadResource(Rez.Strings.Field_Hockey), WatchUi.loadResource(Rez.Strings.Field_Hockey)));
        addItem(new CustomLabelMenuItem("64.94," + WatchUi.loadResource(Rez.Strings.Field_Squash), WatchUi.loadResource(Rez.Strings.Field_Squash)));
        addItem(new CustomLabelMenuItem("64.84," + WatchUi.loadResource(Rez.Strings.Field_Pickleball), WatchUi.loadResource(Rez.Strings.Field_Pickleball)));
        addItem(new CustomLabelMenuItem("64.95," + WatchUi.loadResource(Rez.Strings.Field_Badminton), WatchUi.loadResource(Rez.Strings.Field_Badminton)));
        addItem(new CustomLabelMenuItem("64.96," + WatchUi.loadResource(Rez.Strings.Field_Racquetball), WatchUi.loadResource(Rez.Strings.Field_Racquetball)));
        addItem(new CustomLabelMenuItem("64.97," + WatchUi.loadResource(Rez.Strings.Field_TableTennis), WatchUi.loadResource(Rez.Strings.Field_TableTennis)));
        addItem(new CustomLabelMenuItem("71.0," + WatchUi.loadResource(Rez.Strings.Field_Cricket), WatchUi.loadResource(Rez.Strings.Field_Cricket)));
        addItem(new CustomLabelMenuItem("74.0," + WatchUi.loadResource(Rez.Strings.Field_Lacrosse), WatchUi.loadResource(Rez.Strings.Field_Lacrosse)));
        addItem(new CustomLabelMenuItem("50.0," + WatchUi.loadResource(Rez.Strings.Field_Softball), WatchUi.loadResource(Rez.Strings.Field_Softball)));
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