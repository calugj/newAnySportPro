import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;
import Toybox.Lang;

class PageSettingView extends WatchUi.View {

    private var layout;
    var pageNumber;
    private var datafields as Array<Datafield> = new Array<Datafield> [6] ;
    private var fieldsNumber;

    private var sportData;

    private var counter;
    private var position;
    private var editFieldsMode as Boolean;
    private var layoutFlag;
    
    function initialize(param_pageNumber, param_editFieldsMode as Boolean) {
        View.initialize();
        
        sportData = getApp().sportData;
        pageNumber = param_pageNumber;
        editFieldsMode = param_editFieldsMode;

        position = 0;
        counter = 0;

        layout = new Layout(1);
        
    }

    function setPosition(param_position) {
        counter = 0;
        position = param_position;
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
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);


        dc.setAntiAlias(true);
        


        layout.draw(dc);
        
        for(var i = 0 ; i < fieldsNumber ; i += 1) {
            if(editFieldsMode && counter%5 <= 1 && i == position) {
                continue;
            }
            var request = "Field" + (i+1).toString() + "Page" + pageNumber.toString();
            var index = Properties.getValue(request);
            datafields[i].updateValue(sportData.getMetric(index));
            datafields[i].draw(dc);
        }
        counter += 1;

        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
