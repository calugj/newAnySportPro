import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

class MainViewDelegate extends BehaviorDelegate {
    
    private var view;
    private var pageNumber;

    function initialize(param_view, param_pageNumber) {
        BehaviorDelegate.initialize();

        view = param_view;
        pageNumber = param_pageNumber;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new MainMenu(), new MainMenuDelegate(), WatchUi.SLIDE_BLINK);
        return true;
    }

    function onSimulatedSelect() {
        var sportData = getApp().sportData;

        if(sportData.isRecording()) {
            Attention.playTone(Attention.TONE_STOP);
            sportData.stop();
            view.ring.setStatus(1);
        }
        else {
            Attention.playTone(Attention.TONE_START);
            sportData.start();
            view.ring.setStatus(2);
            view.topBanner.setStatus(3);
        }
        
        WatchUi.requestUpdate();
        return true;
    }

    function onSimulatedBack() {
        var sportData = getApp().sportData;

        if(sportData.isRecording() && Properties.getValue("LapActivated")) {
            Attention.playTone(Attention.TONE_LAP);
            sportData.lap();
            view.ring.setStatus(3);
        } else if(!sportData.isRecording() && sportData.isRecordingStarted()) {
            WatchUi.pushView(new SaveMenu(), new SaveMenuDelegate(view), WatchUi.SLIDE_BLINK);
        } else if(!sportData.isRecording()) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        }

        WatchUi.requestUpdate();

        return false;
    }


    function onNextPage() as Boolean {
        view.topBanner.setStatus(0);
        WatchUi.requestUpdate();
        return false;
    }

    function onPreviousPage() as Boolean {
        view.topBanner.setStatus(0);
        WatchUi.requestUpdate();
        return false;
    }



    function onSwipe(swipeEvent) as Boolean {
        var sportData = getApp().sportData;

        if(swipeEvent.getDirection() == WatchUi.SWIPE_RIGHT) {
            if(!sportData.isRecordingStarted()) {
                onSimulatedBack();
            }
            return true;
        }

        return false;
    }



    function onKey(keyEvent) {

        switch(keyEvent.getKey()) {
            case WatchUi.KEY_ESC:
                onSimulatedBack();
                return true;
            case WatchUi.KEY_ENTER:
                onSimulatedSelect();
                return true;
        }
        return false;
    }







    function onTap(clickEvent) as Boolean {
        return false;
    }




    function onBack() as Boolean {
        return false;
    }





}