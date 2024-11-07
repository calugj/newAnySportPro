import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

class MainMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {:theme => null});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }

        var pages = Properties.getValue("Pages");
        var datafields_substring = pages.toString();
        if(pages == 1) {
            datafields_substring = datafields_substring + " " + WatchUi.loadResource(Rez.Strings.Page);
        } else {
            datafields_substring = datafields_substring + " " + WatchUi.loadResource(Rez.Strings.Pages);
        }
            

        var positioning_substring = "";
        switch(Properties.getValue("Satellites")) {
            case 0:
                positioning_substring = WatchUi.loadResource(Rez.Strings.SatellitesOff);
                break;
            case 1:
                positioning_substring = "GPS";
                break;
            case 2:
                positioning_substring = "GLONASS";
                break;
            case 3:
                positioning_substring = "GALILEO";
                break;
            case 4:
                positioning_substring = "BEIDOU";
                break;
            case 5:
                positioning_substring = "All Systems";
                break;
            case 6:
                positioning_substring = "All Systems L1 + L5 (dual-band)";
                break;
            case 255:
                positioning_substring = "SatIQ";
                break;
        }



        var lap_substring = "";
        if(Properties.getValue("LapActivated")) {
            lap_substring = WatchUi.loadResource(Rez.Strings.Active);
        } else {
            lap_substring = WatchUi.loadResource(Rez.Strings.Inactive);
        }





        addItem(new CustomIconMenuItem(:class, WatchUi.loadResource(Rez.Strings.ActivityType), Properties.getValue("Name"), WatchUi.loadResource($.Rez.Drawables.Running)));
        addItem(new CustomIconMenuItem(:datafields, WatchUi.loadResource(Rez.Strings.Datafields), datafields_substring, WatchUi.loadResource($.Rez.Drawables.Datafields)));
        addItem(new CustomIconMenuItem(:positioning, WatchUi.loadResource(Rez.Strings.Positioning), positioning_substring, WatchUi.loadResource($.Rez.Drawables.GPS)));
        addItem(new CustomIconMenuItem(:accentColor, WatchUi.loadResource(Rez.Strings.AccentColor), "HEX " + Properties.getValue("AccentColor").format("%06X"), WatchUi.loadResource($.Rez.Drawables.Color)));
        addItem(new CustomIconMenuItem(:backgroundColor, WatchUi.loadResource(Rez.Strings.BackgroundColor), "HEX " + Properties.getValue("BackgroundColor").format("%06X"), WatchUi.loadResource($.Rez.Drawables.Fill)));
        addItem(new CustomIconMenuItem(:lap, WatchUi.loadResource(Rez.Strings.Lap), lap_substring, WatchUi.loadResource($.Rez.Drawables.Lap)));
        addItem(new CustomIconMenuItem(:unit, WatchUi.loadResource(Rez.Strings.Unit), null, WatchUi.loadResource($.Rez.Drawables.Unit)));
        addItem(new CustomIconMenuItem(:about, WatchUi.loadResource(Rez.Strings.About), WatchUi.loadResource(Rez.Strings.About_substring), WatchUi.loadResource($.Rez.Drawables.About)));
        addItem(new CustomIconMenuItem(:dev, WatchUi.loadResource(Rez.Strings.Dev), WatchUi.loadResource(Rez.Strings.Dev_substring), WatchUi.loadResource($.Rez.Drawables.Dev)));

    }

    function onShow() {
        getApp().setRefreshRate(getApp().REFRESH_LOW);
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.AppName), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}







class MainMenuDelegate extends Menu2InputDelegate {
    
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {

        switch(item.getId()) {
            case :class:
                if( getApp().sportData.isRecordingStarted() ) {
                    break;
                }
                WatchUi.pushView(new ActivityClassMenu(), new ActivityClassMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :datafields:
                var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
                WatchUi.pushView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_LEFT);
                break;
            case :positioning:
                WatchUi.pushView(new GPSMenu(), new GPSMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :accentColor:
                WatchUi.pushView(new AccentColorMenu(), new AccentColorMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :backgroundColor:
                WatchUi.pushView(new BackgroundColorMenu(), new BackgroundColorMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :lap:
                WatchUi.pushView(new LapMenu(), new LapMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :unit:
                WatchUi.pushView(new UnitMenu(), new UnitMenuDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :about:
                WatchUi.pushView(new AboutView(), new BehaviorDelegate(), WatchUi.SLIDE_LEFT);
                break;
            case :dev:
                WatchUi.pushView(new DevView(), new BehaviorDelegate(), WatchUi.SLIDE_LEFT);
                break;
        }
        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_BLINK);
        var loop = new WatchUi.ViewLoop(new MainLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_BLINK);
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }


}