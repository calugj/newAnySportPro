import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;

class SimpleDatafield extends Datafield {

    function initialize(param_x, param_y, param_width, param_height, param_value) {
        Datafield.initialize(param_x, param_y, param_width, param_height, param_value);
    }
    
    function draw(dc as Dc) as Void {
        Datafield.draw(dc);

        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);

        var font = Graphics.FONT_LARGE;
        if(width == dc.getWidth()) {
            font = Graphics.FONT_NUMBER_MILD;
        }
        else if(height == dc.getHeight()/2) {
            font = Graphics.FONT_NUMBER_MEDIUM;
        }
        else if(height == dc.getHeight()) {
            font = Graphics.FONT_NUMBER_HOT;
        }

        dc.drawText(x + width/2, y + height*0.6, font, value[0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}
