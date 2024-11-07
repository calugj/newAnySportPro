import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

class MainView extends WatchUi.View {

    private var sportData;

    private var layout;
    var pageNumber;
    private var datafields as Array<Datafield> = new Array<Datafield> [6] ;
    private var fieldsNumber;
    var ring;
    var showGreenRing;
    var topBanner;


    
    function initialize(param_sportData, param_pageNumber) {
        View.initialize();

        sportData = param_sportData;
        pageNumber = param_pageNumber;

        
        layout = new Layout(1);
        
        ring = new Ring();
        showGreenRing = false;
        topBanner = new TopBanner();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();

        var ONE_FIELD   = [[0, 0, width, height]];
        var TWO_FIELD   = [[0, 0, width, height/2], [0, height/2, width, height/2]];
        var THREE_FIELD = [[0, 0, width, height/3], [0, height/3, width, height/3], [0, 2*height/3, width, height/3]];
        var FOUR_FIELD  = [[0, 0, width, height/3], [0, height/3, width/2, height/3], [width/2, height/3, width/2, height/3], [0, 2*height/3, width, height/3]];
        var FIVE_FIELD  = [[0, 0, width, height/4], [0, height/4, width, height/4], [0, height/2, width/2, height/4], [width/2, height/2, width/2, height/4], [0, 3*height/4, width, height/4]];
        var SIX_FIELD   = [[0, 0, width, height/4], [0, height/4, width/2, height/4], [width/2, height/4, width/2, height/4], [0, height/2, width/2, height/4], [width/2, height/2, width/2, height/4], [0, 3*height/4, width, height/4]];


        var FIELDS = [ONE_FIELD, TWO_FIELD, THREE_FIELD, FOUR_FIELD, FIVE_FIELD, SIX_FIELD];

        fieldsNumber = Properties.getValue("FieldsPage" + pageNumber.toString());
        layout.initialize(fieldsNumber);

        var choice = FIELDS[fieldsNumber - 1];


        for (var i = 0 ; i < fieldsNumber ; i += 1) {
            var request = "Field" + (i+1).toString() + "Page" + pageNumber.toString();
            var index = Properties.getValue(request);
            datafields[i] = new SimpleDatafield(choice[i][0], choice[i][1], choice[i][2], choice[i][3], sportData.getMetric(index));
        }

        
        

        
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        if(showGreenRing) {
            ring.setStatus(2);
            showGreenRing = false;
        } else {
            ring.setStatus(0);
        }

        if(!sportData.isRecordingStarted()) {
            topBanner.setStatus(1); // if activity is yet to start, start showing
        } else {
            topBanner.setStatus(0);
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        if(sportData.autoLapDetected) {
            sportData.autoLapDetected = false;
            Attention.playTone(Attention.TONE_LAP);
            ring.setStatus(3);
        }
        







        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        //System.print("update");

        dc.setAntiAlias(true);
        

        var app = getApp();
        if(app.getRefresh() == app.REFRESH_LOW && (app.bannerAnimation || app.ringAnimation)) {
            app.setRefreshRate(app.REFRESH_HIGH);
        }
        else if(app.getRefresh() == app.REFRESH_HIGH && !(app.bannerAnimation || app.ringAnimation)){
            app.setRefreshRate(app.REFRESH_LOW);
        }

        layout.draw(dc);

        for(var i = 0 ; i < fieldsNumber ; i += 1) {
            var request = "Field" + (i+1).toString() + "Page" + pageNumber.toString();
            var index = Properties.getValue(request);
            datafields[i].updateValue(sportData.getMetric(index));
            datafields[i].draw(dc);
        }
        

        

        
        
        

        
        topBanner.draw(dc);
        ring.draw(dc);
        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
