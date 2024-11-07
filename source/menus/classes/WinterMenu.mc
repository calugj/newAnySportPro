import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class WinterMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 70;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;

    function initialize() {
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.15;
        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }


        addItem(new CustomLabelMenuItem("58.0," + WatchUi.loadResource(Rez.Strings.Winter_Generic), WatchUi.loadResource(Rez.Strings.Winter_Generic)));
        addItem(new CustomLabelMenuItem("12.0," + WatchUi.loadResource(Rez.Strings.Winter_CrossCountryClassic), WatchUi.loadResource(Rez.Strings.Winter_CrossCountryClassic)));
        addItem(new CustomLabelMenuItem("12.42," + WatchUi.loadResource(Rez.Strings.Winter_CrossCountrySkate), WatchUi.loadResource(Rez.Strings.Winter_CrossCountrySkate)));
        addItem(new CustomLabelMenuItem("13.0," + WatchUi.loadResource(Rez.Strings.Winter_AlpineSki), WatchUi.loadResource(Rez.Strings.Winter_AlpineSki)));
        addItem(new CustomLabelMenuItem("14.0," + WatchUi.loadResource(Rez.Strings.Winter_Snowboard), WatchUi.loadResource(Rez.Strings.Winter_Snowboard)));
        addItem(new CustomLabelMenuItem("13.37," + WatchUi.loadResource(Rez.Strings.Winter_BackCountrySki), WatchUi.loadResource(Rez.Strings.Winter_BackCountrySki)));
        addItem(new CustomLabelMenuItem("14.37," + WatchUi.loadResource(Rez.Strings.Winter_BackCountrySnowboard), WatchUi.loadResource(Rez.Strings.Winter_BackCountrySnowboard)));
        addItem(new CustomLabelMenuItem("33.0," + WatchUi.loadResource(Rez.Strings.Winter_IceSkate), WatchUi.loadResource(Rez.Strings.Winter_IceSkate)));
        addItem(new CustomLabelMenuItem("35.0," + WatchUi.loadResource(Rez.Strings.Winter_Snowshoe), WatchUi.loadResource(Rez.Strings.Winter_Snowshoe)));
        



        
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Graphics.FONT_SMALL, WatchUi.loadResource(Rez.Strings.WinterSports), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
        
    }




}