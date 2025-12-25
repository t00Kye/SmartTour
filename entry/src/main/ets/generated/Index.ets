import { EmptyPagePathStack } from './view/EmptyPagePathStack';
import { SecondPageSearch } from './view/SecondPageSearch';
import { BreakpointConstants } from './common/BreakpointConstants';
import { CommonConstants } from './common/CommonConstants';
import HomePage from './pages/HomePage';
import AttractionsPage from './pages/AttractionsPage';
import BusinessPage from './pages/BusinessPage';
import ItineraryPage from './pages/ItineraryPage';
import OrdersPage from './pages/OrdersPage';
import MyPage from './pages/MyPage';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();
  @Provide('appPathStack') appPathStack: NavPathStack = new NavPathStack();
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  @Builder
  PageMap(name: string) {
    if (name === 'SearchPage') {
      SecondPageSearch()
    } else {
      EmptyPagePathStack()
    }
  }

  @Builder
  tabBuilder(title: string, targetIndex: number, icon: Resource) {
    Column() {
      Image(icon)
        .width("24vp")
        .height("24vp")
        .objectFit(ImageFit.Contain)
        .fillColor(this.currentIndex === targetIndex ? ($r('app.color.app_icon_pressed_color')) :
          ($r('app.color.app_icon_color')))
      Text(title)
        .fontSize("10vp")
        .fontColor(this.currentIndex === targetIndex ? ($r('app.color.app_icon_pressed_color')) :
          ($r('app.color.app_icon_color')))
        .textAlign(TextAlign.Center)
        .lineHeight("14vp")
        .fontWeight(500)
    }
    .height(this.currentWidthBreakpoint === BreakpointConstants.BREAKPOINT_LG ? "100vp" : CommonConstants.FULL_PERCENT)
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
  }

  build() {
    Navigation(this.appPathStack) {
      Tabs({
        barPosition: this.currentWidthBreakpoint === BreakpointConstants.BREAKPOINT_LG ? BarPosition.Start :
          BarPosition.End,
        controller: this.tabsController
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.tabBuilder('首页', 0, $r("app.media.lib_icon_8")))

        TabContent() {
          AttractionsPage()
        }.tabBar(this.tabBuilder('景点', 1, $r("app.media.lib_icon_114")))

        TabContent() {
          BusinessPage()
        }.tabBar(this.tabBuilder('商家', 2, $r("app.media.lib_icon_131")))

        TabContent() {
          ItineraryPage()
        }.tabBar(this.tabBuilder('行程规划', 3, $r("app.media.lib_icon_167")))

        TabContent() {
          OrdersPage()
        }.tabBar(this.tabBuilder('订单', 4, $r("app.media.lib_icon_173")))

        TabContent() {
          MyPage()
        }.tabBar(this.tabBuilder('我的', 5, $r("app.media.lib_icon_9")))
      }
      .barWidth(this.currentWidthBreakpoint === BreakpointConstants.BREAKPOINT_LG ? "96vp" :
        CommonConstants.FULL_PERCENT)
      .barHeight(this.currentWidthBreakpoint === BreakpointConstants.BREAKPOINT_LG ? CommonConstants.FULL_PERCENT :
        "76vp")
      .barMode(this.currentWidthBreakpoint === BreakpointConstants.BREAKPOINT_LG ? BarMode.Scrollable : BarMode.Fixed,
        { nonScrollableLayoutStyle: LayoutStyle.ALWAYS_CENTER })
      .vertical(this.currentWidthBreakpoint === BreakpointConstants.BREAKPOINT_LG)
      .scrollable(false)
      .width('100%')
      .height('100%')
    }
    .backgroundColor($r('app.color.page_bg_color'))
    .navDestination(this.PageMap)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}