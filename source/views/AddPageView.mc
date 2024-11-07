import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

class AddPageView extends WatchUi.View {

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


        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.clear();




        var length = width*0.25;
        var depth = width*0.03;

        var color = Properties.getValue("AccentColor");
        if(color == Graphics.COLOR_WHITE || color == Graphics.COLOR_TRANSPARENT) {
            color = Graphics.COLOR_BLACK;
        }

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(width/2 - length/2, height*0.45 - depth/2, length, depth);
        dc.fillRectangle(width/2 - depth/2, height*0.45 - length/2, depth, length);
        
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width/2, height*0.65, Graphics.FONT_TINY, WatchUi.loadResource(Rez.Strings.AddPage), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);


    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
