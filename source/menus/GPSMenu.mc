import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Position;
import Toybox.Application;

class GPSMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        addItem(new CustomLabelSublabelMenuItem(0, WatchUi.loadResource(Rez.Strings.SatellitesOff), null));

        if(Toybox.Position has :CONFIGURATION_GPS && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS, "GPS", "L1 (single-band)"));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GLONASS && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GLONASS, "GLONASS", "L1 (single-band)"));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GALILEO && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GALILEO)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GALILEO, "GALILEO", "L1 (single-band)"));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_BEIDOU && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_BEIDOU)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_BEIDOU, "BEIDOU", "L1 (single-band)"));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1 && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1, "All Systems", "L1 (single-band)"));
        }
        if(Toybox.Position has :CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5 && Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5, "All Systems", "L1 + L5 (dual-band)"));
        }
        if(Toybox.Position has :CONFIGURATION_SAT_IQ && Position.hasConfigurationSupport(Position.CONFIGURATION_SAT_IQ)) {
            addItem(new CustomLabelSublabelMenuItem(Position.CONFIGURATION_SAT_IQ, "SatIQ", null));
        }


        
        setFocus(findItemById(Properties.getValue("Satellites")));

    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Positioning), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class GPSMenuDelegate extends Menu2InputDelegate {
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        var mode = item.getId();
        Properties.setValue("Satellites", mode);

        if(mode == 0) {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_DISABLE}, null);
        }
        else {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_CONTINUOUS, :configuration => mode as Position.Configuration}, null);
        }
        onBack();

        var menu = new MainMenu();
        menu.setFocus(menu.findItemById(:positioning));

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