import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class CyclingMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        addItem(new CustomLabelMenuItem("2.0," + WatchUi.loadResource(Rez.Strings.Cycling_Generic), WatchUi.loadResource(Rez.Strings.Cycling_Generic)));
        addItem(new CustomLabelMenuItem("2.7," + WatchUi.loadResource(Rez.Strings.Cycling_Road), WatchUi.loadResource(Rez.Strings.Cycling_Road)));
        addItem(new CustomLabelMenuItem("2.8," + WatchUi.loadResource(Rez.Strings.Cycling_Mountain), WatchUi.loadResource(Rez.Strings.Cycling_Mountain)));
        addItem(new CustomLabelMenuItem("2.46," + WatchUi.loadResource(Rez.Strings.Cycling_Gravel), WatchUi.loadResource(Rez.Strings.Cycling_Gravel)));
        addItem(new CustomLabelMenuItem("2.6," + WatchUi.loadResource(Rez.Strings.Cycling_Indoor), WatchUi.loadResource(Rez.Strings.Cycling_Indoor)));
        addItem(new CustomLabelMenuItem("21.28," + WatchUi.loadResource(Rez.Strings.Cycling_eBiking), WatchUi.loadResource(Rez.Strings.Cycling_eBiking)));
        addItem(new CustomLabelMenuItem("2.47," + WatchUi.loadResource(Rez.Strings.Cycling_eMTB), WatchUi.loadResource(Rez.Strings.Cycling_eMTB)));
        addItem(new CustomLabelMenuItem("2.13," + WatchUi.loadResource(Rez.Strings.Cycling_Track), WatchUi.loadResource(Rez.Strings.Cycling_Track)));
        addItem(new CustomLabelMenuItem("2.12," + WatchUi.loadResource(Rez.Strings.Cycling_Hand), WatchUi.loadResource(Rez.Strings.Cycling_Hand)));
        addItem(new CustomLabelMenuItem("2.5," + WatchUi.loadResource(Rez.Strings.Cycling_Spin), WatchUi.loadResource(Rez.Strings.Cycling_Spin)));
        addItem(new CustomLabelMenuItem("2.9," + WatchUi.loadResource(Rez.Strings.Cycling_Downhill), WatchUi.loadResource(Rez.Strings.Cycling_Downhill)));
        addItem(new CustomLabelMenuItem("2.11," + WatchUi.loadResource(Rez.Strings.Cycling_Cyclocross), WatchUi.loadResource(Rez.Strings.Cycling_Cyclocross)));
        addItem(new CustomLabelMenuItem("2.29," + WatchUi.loadResource(Rez.Strings.Cycling_BMX), WatchUi.loadResource(Rez.Strings.Cycling_BMX)));
        addItem(new CustomLabelMenuItem("2.48," + WatchUi.loadResource(Rez.Strings.Cycling_Commuting), WatchUi.loadResource(Rez.Strings.Cycling_Commuting)));
        addItem(new CustomLabelMenuItem("2.49," + WatchUi.loadResource(Rez.Strings.Cycling_Mixed), WatchUi.loadResource(Rez.Strings.Cycling_Mixed)));
        addItem(new CustomLabelMenuItem("2.10," + WatchUi.loadResource(Rez.Strings.Cycling_Recumbent), WatchUi.loadResource(Rez.Strings.Cycling_Recumbent)));
        addItem(new CustomLabelMenuItem("2.58," + WatchUi.loadResource(Rez.Strings.Cycling_Virtual), WatchUi.loadResource(Rez.Strings.Cycling_Virtual)));




    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Cycling), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}