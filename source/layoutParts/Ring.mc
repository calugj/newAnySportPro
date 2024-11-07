import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Application;

class Ring {
    
    // 0 = hidden, 1 = red, 2 = green, 3 = yellow
    private var status =  0;
    private var counter = 0;
    private const FRAMES = 20;
    private var anim = 0;
    private var lapValue as Array<Array<String>> = new Array<Array<String>> [2];

    function initialize() {
        status = 0;

    }



    function setStatus(param_status as Number) {
        status = param_status;
        counter = 0;
        if(status == 3 && Properties.getValue("LapScreen")) {
            counter = -20;
            var field = Properties.getValue("LapScreenField");
            lapValue[0] = getApp().sportData.getMetric(2);
            lapValue[1] = getApp().sportData.getMetric(field);
        }
        anim = 0;

        var app = getApp();
        
        if(status != 0) {
            app.ringAnimation = true;
        }
        else {
            app.ringAnimation = false;
        }
    }




    function draw(dc as Dc) as Void {
        if(status == 0) {
            return;
        }
        
        var width = dc.getWidth();
        var height = dc.getHeight();

        
        var backgroundColor = Graphics.COLOR_LT_GRAY;
        var foregroundColor = Graphics.COLOR_BLACK;
        
        
        
        
        
        // Draw ring  -----
        if(status != 3) {
            dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
            dc.fillRoundedRectangle(width/2 - width*0.2, height/2 - height*0.2, width*0.4, height*0.4, height*0.05);
            dc.setPenWidth(width*0.01);
            dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
            dc.drawRoundedRectangle(width/2 - width*0.2, height/2 - height*0.2, width*0.4, height*0.4, height*0.05);
        }
        

        if(status == 1) {
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
            dc.fillRectangle(width/2 - width*0.1, height/2 - height*0.1, width*0.2, height*0.2);
            dc.setPenWidth(width*0.01);
            dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
            dc.drawRectangle(width/2 - width*0.1, height/2 - height*0.1, width*0.2, height*0.2);
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        } else if(status == 2) {
            dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
            dc.fillPolygon([ [width*0.395, height*0.615], [ width*0.395, height*0.39], [width*0.615, height/2] ]);
            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
            dc.fillPolygon([ [width*0.4, height*0.6], [ width*0.4, height*0.4], [width*0.6, height/2] ]);
            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);

        } else {
            // draw lap data
            var lapScreen = Properties.getValue("LapScreen");
            if(lapScreen) {
                dc.setColor(backgroundColor, Graphics.COLOR_TRANSPARENT);
                dc.fillRoundedRectangle(width/2 - width*0.3, height/2 - height*0.3, width*0.6, height*0.6, height*0.05);
                dc.setPenWidth(width*0.01);
                dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
                dc.drawRoundedRectangle(width/2 - width*0.3, height/2 - height*0.3, width*0.6, height*0.6, height*0.05);


                dc.drawText(width/2, height*0.3, Graphics.FONT_XTINY, lapValue[0][1], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
                dc.drawText(width/2, height*0.4, Graphics.FONT_LARGE, lapValue[0][0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

                dc.drawText(width/2, height*0.55, Graphics.FONT_XTINY, lapValue[1][1], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
                dc.drawText(width/2, height*0.65, Graphics.FONT_LARGE, lapValue[1][0], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);





            }
            dc.setColor(Graphics.COLOR_ORANGE, Graphics.COLOR_TRANSPARENT);
        }

        
        dc.setPenWidth(width*0.1);
        dc.drawCircle(width/2, height/2, width/2 + (anim*width*0.05/5));
        dc.setPenWidth(width*0.01);
        dc.setColor(foregroundColor, Graphics.COLOR_TRANSPARENT);
        dc.drawCircle(width/2, height/2, width/2 - width*0.05 + (anim*width*0.05/5));

        // ------------------




        if(status != 0) {
            counter += 1;
            if(counter >= 15) {
                anim += 1;
            }
        }

        if(counter == FRAMES + 1) {
            setStatus(0);
        }

    }
}