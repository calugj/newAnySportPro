import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class FlyingMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        
        addItem(new CustomLabelMenuItem("20.0," + WatchUi.loadResource(Rez.Strings.Flying_Generic), WatchUi.loadResource(Rez.Strings.Flying_Generic)));
        addItem(new CustomLabelMenuItem("26.0," + WatchUi.loadResource(Rez.Strings.Flying_HangGlide), WatchUi.loadResource(Rez.Strings.Flying_HangGlide)));
        addItem(new CustomLabelMenuItem("20.40," + WatchUi.loadResource(Rez.Strings.Flying_Wingsuit), WatchUi.loadResource(Rez.Strings.Flying_Wingsuit)));
        addItem(new CustomLabelMenuItem("34.0," + WatchUi.loadResource(Rez.Strings.Flying_Skydive), WatchUi.loadResource(Rez.Strings.Flying_Skydive)));
        addItem(new CustomLabelMenuItem("46.0," + WatchUi.loadResource(Rez.Strings.Flying_Jumpmaster), WatchUi.loadResource(Rez.Strings.Flying_Jumpmaster)));
        addItem(new CustomLabelMenuItem("20.39," + WatchUi.loadResource(Rez.Strings.Flying_Drone), WatchUi.loadResource(Rez.Strings.Flying_Drone)));
        addItem(new CustomLabelMenuItem("20.110," + WatchUi.loadResource(Rez.Strings.Flying_Canopy), WatchUi.loadResource(Rez.Strings.Flying_Canopy)));
        addItem(new CustomLabelMenuItem("20.111," + WatchUi.loadResource(Rez.Strings.Flying_Paraglide), WatchUi.loadResource(Rez.Strings.Flying_Paraglide)));
        addItem(new CustomLabelMenuItem("20.112," + WatchUi.loadResource(Rez.Strings.Flying_Paramotor), WatchUi.loadResource(Rez.Strings.Flying_Paramotor)));
        addItem(new CustomLabelMenuItem("20.113," + WatchUi.loadResource(Rez.Strings.Flying_Pressurized), WatchUi.loadResource(Rez.Strings.Flying_Pressurized)));
        
        
        



        
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.Flying), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}