import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

class PageSettingViewDelegate extends WatchUi.BehaviorDelegate {
    
    private var view;
    private var pageNumber;

    function initialize(param_view, param_pageNumber) {
        BehaviorDelegate.initialize();

        view = param_view;
        pageNumber = param_pageNumber;
    }

    function onMenu() as Boolean {
        //WatchUi.pushView(new MainMenu(), new MainMenuDelegate(), WatchUi.SLIDE_BLINK);
        return true;
    }

    function onSelect() {
        WatchUi.pushView(new EditPageMenu(pageNumber), new EditPageMenuDelegate(pageNumber), WatchUi.SLIDE_LEFT);
        WatchUi.requestUpdate();
        return true;
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        var menu = new MainMenu();
        menu.setFocus(menu.findItemById(:datafields));

        WatchUi.switchToView(menu, new MainMenuDelegate(), WatchUi.SLIDE_RIGHT);
        WatchUi.requestUpdate();

        return true;
    }


    function onNextPage() as Boolean {
        return false;
    }

    function onPreviousPage() as Boolean {
        return false;
    }






}