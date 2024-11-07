import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Attention;
import Toybox.Application;

class AddPageViewDelegate extends WatchUi.BehaviorDelegate {
    

    function initialize() {
        BehaviorDelegate.initialize();

    }

    function onMenu() as Boolean {
        return true;
    }

    function onSelect() {
        var pages = Properties.getValue("Pages");
        if(pages < getApp().MAX_PAGES) {
            Properties.setValue("Pages", pages + 1);
        }
        
        var loop = new WatchUi.ViewLoop(new PageSettingLoopFactory(), {:page => pages,:wrap => true, :color => Properties.getValue("AccentColor") as Number});
        WatchUi.switchToView(loop, new ViewLoopDelegate(loop), WatchUi.SLIDE_IMMEDIATE);
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