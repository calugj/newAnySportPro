import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;
import Toybox.System;

class UnitMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        
        var speed_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("SpeedUnits") == System.UNIT_STATUTE) {
            speed_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }
        
        var pace_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("PaceUnits") == System.UNIT_STATUTE) {
            pace_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }
        
        var distance_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("DistanceUnits") == System.UNIT_STATUTE) {
            distance_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }

        var nautical_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("NauticalSpeed") == System.UNIT_STATUTE) {
            nautical_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        } else if(Properties.getValue("NauticalSpeed") == /*UNIT_NAUTICAL*/ 2) {
            nautical_substring = WatchUi.loadResource(Rez.Strings.Nautical);
        }

        var temperature_substring = WatchUi.loadResource(Rez.Strings.Metric);
        if(Properties.getValue("TemperatureUnits") == System.UNIT_STATUTE) {
            temperature_substring = WatchUi.loadResource(Rez.Strings.Imperial);
        }


        addItem(new CustomLabelSublabelMenuItem("SpeedUnits", WatchUi.loadResource(Rez.Strings.SpeedUnits), speed_substring));
        addItem(new CustomLabelSublabelMenuItem("PaceUnits", WatchUi.loadResource(Rez.Strings.PaceUnits), pace_substring));
        addItem(new CustomLabelSublabelMenuItem("DistanceUnits", WatchUi.loadResource(Rez.Strings.DistanceUnits), distance_substring));
        addItem(new CustomLabelSublabelMenuItem("NauticalSpeed", WatchUi.loadResource(Rez.Strings.NauticalSpeed), nautical_substring));
        addItem(new CustomLabelSublabelMenuItem("TemperatureUnits", WatchUi.loadResource(Rez.Strings.TemperatureUnits), temperature_substring));

        



        

    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Unit), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class UnitMenuDelegate extends Menu2InputDelegate {
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        
        var max = 1;
        if(id.equals("NauticalSpeed")) {
            max = 2;
        }

        var value = Properties.getValue(id as String) + 1;
        if(value > max) {
            value = 0;
        }

        Properties.setValue(id as String, value);


        var menu = new UnitMenu();
        menu.setFocus(menu.findItemById(id));
        WatchUi.switchToView(menu, self, WatchUi.SLIDE_IMMEDIATE);


        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        /*
        var menu = new MainMenu();
        menu.setFocus(menu.findItemById(:unit));

        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        */
        WatchUi.requestUpdate();
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }


}






