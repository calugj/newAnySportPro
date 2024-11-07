import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

class DevView extends WatchUi.View {

    function initialize() {
        View.initialize();

    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {

    }

    // Update the view
    public function onUpdate(dc) {
        View.onUpdate(dc);

        if(Toybox.Graphics.Dc has :setAntiAlias) {
            dc.setAntiAlias(true);
        }

        var width = dc.getWidth();
        var height = dc.getHeight();
        var dev = System.getDeviceSettings();
        var stat = System.getSystemStats();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var y = height * 0.3;
        var x = width*0.15;

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Firmware) + Lang.format("$1$.$2$", dev.firmwareVersion) , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Monkey) + Lang.format("$1$.$2$.$3$", dev.monkeyVersion) , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 2*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.App) + WatchUi.loadResource(Rez.Strings.Version) , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 3*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, dev.screenWidth.toString() + "×" + dev.screenHeight.toString(), Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 4*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Part) + dev.partNumber, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(x, y + 5*Graphics.getFontHeight(Graphics.FONT_XTINY), Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.UID) + dev.uniqueIdentifier, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        



        var barWidth = width*0.6;
        var barHeight = height*0.04;
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(width/2 - barWidth/2, height*0.82 - barHeight/2, barWidth, barHeight);
        dc.setColor(Graphics.COLOR_DK_GREEN, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(width/2 - barWidth/2, height*0.82 - barHeight/2, barWidth*stat.usedMemory/stat.totalMemory, barHeight);
        

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width/2, height*0.88, Graphics.FONT_XTINY, WatchUi.loadResource(Rez.Strings.Memory) + Lang.format("$1$/$2$", [stat.usedMemory/1024, stat.totalMemory/1024]), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
