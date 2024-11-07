import Toybox.Graphics;
import Toybox.WatchUi;

class HeartRateDatafield extends Datafield {

    function initialize(param_x, param_y, param_width, param_height, param_value) {
        Datafield.initialize(param_x, param_y, param_width, param_height, param_value);
    }
    
    function draw(dc as Dc) as Void {
        Datafield.draw(dc);

        var hr = value[0].toNumber();
        var color = 0;
        if(hr < 80) {color = Graphics.COLOR_WHITE;}
        else if(hr < 100) {color = Graphics.COLOR_DK_GRAY;}
        else if(hr < 120) {color = Graphics.COLOR_BLUE;}
        else if(hr < 140) {color = Graphics.COLOR_GREEN;}
        else if(hr < 160) {color = Graphics.COLOR_ORANGE;}
        else {color = Graphics.COLOR_RED;}

        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(x, y, width, height);
        
        dc.setColor(Graphics.COLOR_WHITE, color);
        dc.drawText(x + width/2, y + height/2, Graphics.FONT_SMALL, value[0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}
