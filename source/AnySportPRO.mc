import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Position;

class AnySportPRO extends Application.AppBase {
    
    var sportData;

    private var timer;
    private var refresh;
    const REFRESH_LOW = 250;
    const REFRESH_HIGH = 50;
    const MAX_PAGES = 6;
    
    // Show animation variables
    var bannerAnimation = false;
    var ringAnimation = false;

    function initialize() {
        AppBase.initialize();

        if(Properties.getValue("FirstBoot")) {
            Properties.setValue("Sport", 1);
            Properties.setValue("SubSport", 0);
            Properties.setValue("Name", WatchUi.loadResource(Rez.Strings.Run_Generic));
            
            Properties.setValue("FirstBoot", false);
        }



        sportData = new SportData();
        
        bannerAnimation = false;
        ringAnimation = false;

        refresh = REFRESH_LOW;
        timer = new Timer.Timer();
        timer.start(method(:timerCallback), refresh, true);



        // gps
        var positioning = Properties.getValue("Satellites");
        if(positioning == 0) {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_DISABLE}, null);
        }
        else {
            Position.enableLocationEvents({:acquisitionType => Position.LOCATION_CONTINUOUS, :configuration => positioning as Position.Configuration}, null);
        }
    }

    function setRefreshRate(param_refreshRate) {
        refresh = param_refreshRate;
        timer.stop();
        timer.start(method(:timerCallback), refresh, true);
    }

    function getRefresh() as Number {
        return refresh;
    }

    function timerCallback() as Void {
        WatchUi.requestUpdate();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var loop = new WatchUi.ViewLoop(new MainLoopFactory(), {:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        return [ loop, new ViewLoopDelegate(loop) ];
    }


}

function getApp() as AnySportPRO {
    return Application.getApp() as AnySportPRO;
}