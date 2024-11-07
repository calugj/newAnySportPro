import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class CustomIconMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String;
    private var icon as BitmapResource;

    function initialize(param_id, param_label as String, param_sublabel as String or Null, param_icon as BitmapResource) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
        icon = param_icon;
    }


    function draw(dc as Dc) as Void {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        

        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

        if (isSelected()) {
            //dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        }
        dc.clear();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawBitmap(dc.getWidth()*0.16 - icon.getWidth()/2, dc.getHeight()/2 - icon.getHeight()/2, icon);
        if(sublabel != null) {
            dc.drawText(dc.getWidth()*0.25, dc.getHeight()*0.35, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(dc.getWidth()*0.25, dc.getHeight()*0.75, Graphics.FONT_XTINY, sublabel, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        } else {
            dc.drawText(dc.getWidth()*0.25, dc.getHeight()*0.5, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }
}






class CustomLabelSublabelMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String;

    function initialize(param_id, param_label as String, param_sublabel as String or Null) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
    }


    function draw(dc as Dc) as Void {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        

        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

        if (isSelected()) {
            //dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        }
        dc.clear();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        if(sublabel != null) {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.35, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.75, Graphics.FONT_XTINY, sublabel, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        } else {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.5, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }
}






class CustomLabelMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;

    function initialize(param_id, param_label as String) {
        CustomMenuItem.initialize(param_id, {});
        label = param_label;
    }


    function draw(dc as Dc) as Void {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        

        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

        if (isSelected()) {
            //dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        }
        dc.clear();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth()*0.1, dc.getHeight() / 2, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}







class CustomColorMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String;
    private var color as Number;

    function initialize(param_id, param_label as String, param_sublabel as String or Null, param_color as Number) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
        color = param_color;
    }


    function draw(dc as Dc) as Void {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        

        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

        if (isSelected()) {
            //dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        }
        dc.clear();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        if(sublabel != null) {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.35, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.75, Graphics.FONT_XTINY, sublabel, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        } else {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.5, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }

        dc.setColor(color, color);
        dc.fillRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.4, dc.getWidth()*0.2, dc.getHeight()*0.8);
        dc.setPenWidth(dc.getWidth()*0.01);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.4, dc.getWidth()*0.2, dc.getHeight()*0.8);
        


    }
}












class CustomSwitchMenuItem extends WatchUi.CustomMenuItem {

    private var label as String;
    private var sublabel as String;
    private var flag as Boolean;

    function initialize(param_id, param_label as String, param_sublabel as String or Null, param_flag as Boolean) {
        CustomMenuItem.initialize(param_id, {});
        sublabel = param_sublabel;
        label = param_label;
        flag = param_flag;
    }


    function isActivated() {
        return flag;
    }


    function draw(dc as Dc) as Void {
        dc.setAntiAlias(true);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);

        

        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

        if (isSelected()) {
            //dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLUE);
        }
        dc.clear();

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        if(sublabel != null) {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.35, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.75, Graphics.FONT_XTINY, sublabel, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        } else {
            dc.drawText(dc.getWidth()*0.1, dc.getHeight()*0.5, font, label, Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
        }

        
        dc.setPenWidth(dc.getWidth()*0.01);

        if(flag) {
            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
            dc.fillRoundedRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.11, dc.getWidth()*0.2, dc.getHeight()*0.25, dc.getWidth()*0.05);
            
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
            dc.drawRoundedRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.105, dc.getWidth()*0.2, dc.getHeight()*0.25, dc.getWidth()*0.05);
            
            dc.fillCircle(dc.getWidth()*0.91, dc.getHeight()/2, dc.getWidth()*0.04);

            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
            dc.fillCircle(dc.getWidth()*0.91, dc.getHeight()/2, dc.getWidth()*0.03);

        } else {
            dc.drawRoundedRectangle(dc.getWidth()*0.85 - dc.getWidth()*0.1, dc.getHeight()/2 - dc.getHeight()*0.11, dc.getWidth()*0.2, dc.getHeight()*0.25, dc.getWidth()*0.05);
            dc.fillCircle(dc.getWidth()*0.79, dc.getHeight()/2, dc.getWidth()*0.04);
        }

        
        


    }
}