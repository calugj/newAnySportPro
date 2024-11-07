import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

class AboutView extends WatchUi.View {

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


        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();


        var bitmap = WatchUi.loadResource(Rez.Drawables.AS);
        dc.drawBitmap(dc.getWidth()/2 - bitmap.getWidth()/2, dc.getHeight()*0.18 - bitmap.getHeight()/2, bitmap);


        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        var text = WatchUi.loadResource(Rez.Strings.AppName) + "  " + WatchUi.loadResource(Rez.Strings.Version);
        dc.drawText(width/2, height*0.38, Graphics.FONT_TINY, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

        text = "Built with ❤️ by\nLuca Boscolo Meneguolo";
        dc.drawText(width/2, height*0.75, Graphics.FONT_XTINY, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
