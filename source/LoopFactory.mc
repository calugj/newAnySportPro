import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Application;
import Toybox.Lang;

class MainLoopFactory extends ViewLoopFactory {

    function initialize() {
        ViewLoopFactory.initialize();
    }
    
    function getSize() as Number {
        return Properties.getValue("Pages");
    }

    function getView(page as Number) /*as Array<WatchUi.View> or Array<WatchUi.View, WatchUi.BehaviorDelegate> */{
        var view = new MainView(getApp().sportData, page + 1);
        return [ view, new MainViewDelegate(view, page + 1) ];
    }
}



class PageSettingLoopFactory extends ViewLoopFactory {

    function initialize() {
        ViewLoopFactory.initialize();
    }
    
    function getSize() as Number {
        var pages = Properties.getValue("Pages");
        if(pages == getApp().MAX_PAGES) {
            return getApp().MAX_PAGES;
        }
        return pages + 1;
    }

    function getView(page as Number) /*as Array<WatchUi.View> or Array<WatchUi.View, WatchUi.BehaviorDelegate> */{
        
        if(page + 1 <= Properties.getValue("Pages")) {
            var view = new PageSettingView(page + 1, false);
            return [ view, new PageSettingViewDelegate(view, page + 1) ];
        }
        return[new AddPageView(), new AddPageViewDelegate()];
        
    }
}