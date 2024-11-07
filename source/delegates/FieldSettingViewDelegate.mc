import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

class FieldSettingViewDelegate extends WatchUi.BehaviorDelegate {
    
    private var view;
    private var pageNumber;
    private var position;

    function initialize(param_view, param_pageNumber, param_position) {
        BehaviorDelegate.initialize();

        view = param_view;
        pageNumber = param_pageNumber;
        position = param_position;
    }

    function onMenu() as Boolean {
        //WatchUi.pushView(new MainMenu(), new MainMenuDelegate(), WatchUi.SLIDE_BLINK);
        return true;
    }

    function onSelect() {
        WatchUi.pushView(new FieldSettingMenu(), new FieldSettingMenuDelegate(pageNumber, position + 1), WatchUi.SLIDE_LEFT);
        return true;
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);

        return true;
    }


    function onNextPage() as Boolean {
        if(position < Properties.getValue("FieldsPage" + pageNumber.toString()) - 1) {
            position += 1;
            view.setPosition(position);
            WatchUi.requestUpdate();
        }
        

        return true;
    }

    function onPreviousPage() as Boolean {
        if(position > 0) {
            position -= 1;
            view.setPosition(position);
            WatchUi.requestUpdate();
        }
        

        return true;
    }






}