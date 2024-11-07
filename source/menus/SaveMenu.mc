import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Application;

class SaveMenu extends CustomMenu {
    
    private var ITEM_HEIGHT = 50;
    private const BACKGROUND_COLOR = Graphics.COLOR_WHITE;
    private var counter;
    private var offset;

    function initialize() {

        counter = 0;
        offset = 0;
        ITEM_HEIGHT = (System.getDeviceSettings().screenHeight)*0.25;

        CustomMenu.initialize(ITEM_HEIGHT.toNumber(), BACKGROUND_COLOR, {});

        if(CustomMenu has :setDividerType) {
            setDividerType(null);
        }
        
        addItem(new CustomIconMenuItem(:save, WatchUi.loadResource(Rez.Strings.Save), null, WatchUi.loadResource($.Rez.Drawables.Save)));
        addItem(new CustomIconMenuItem(:continue, WatchUi.loadResource(Rez.Strings.Continue), null, WatchUi.loadResource($.Rez.Drawables.Play)));
        addItem(new CustomIconMenuItem(:delete, WatchUi.loadResource(Rez.Strings.Delete), null, WatchUi.loadResource($.Rez.Drawables.Delete)));

        
    }

    function drawTitle(dc as Dc) {
        dc.setAntiAlias(true);

        var sportData = getApp().sportData;
        var timer = sportData.getMetric(0)[0];
        var distance = "1.23 km";


        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(offset + dc.getWidth()/2, dc.getHeight()*0.6, Graphics.FONT_LARGE, timer, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(offset + dc.getWidth()*1.5, dc.getHeight()*0.6, Graphics.FONT_LARGE, distance, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        counter += 1;
        if(counter >= 40 && counter < 45) {
            offset -= dc.getWidth()/5;
        } else if(counter >= 85) {
            offset += dc.getWidth()/5;
        }
        if(counter == 90) {
            counter = 0;
            offset = 0;
        }
    }

    function drawForeground(dc as Dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(width*0.015);
        dc.drawLine(width*0.05, height/2 - ITEM_HEIGHT*0.35, width*0.05, height/2 + ITEM_HEIGHT*0.4);
    }


}






class SaveMenuDelegate extends Menu2InputDelegate {

    private var view;
    
    function initialize(param_view as WatchUi.View) {
        Menu2InputDelegate.initialize();
        view = param_view;
    }

    function onSelect(item as MenuItem) as Void {
        var sportData = getApp().sportData;

        switch(item.getId()) {
            case :save:
                sportData.save();
                break;
            case :continue:
                onBack();
                Attention.playTone(Attention.TONE_START);
                sportData.start();
                view.showGreenRing = true;
                WatchUi.requestUpdate();
                return;
            case :delete:
                Attention.playTone(Attention.TONE_RESET);
                sportData.discard();
                
                var loop = new WatchUi.ViewLoop(new MainLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
                onBack();
                WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_BLINK);
                WatchUi.requestUpdate();
                return;
        }
        onBack();
        WatchUi.requestUpdate();
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_BLINK);
    }

    function onWrap(key as WatchUi.Key) as Boolean {
        return false;
    }


}