import { PersonalizedWelcomeModule } from '../view/PersonalizedWelcomeModule';
import { ScenicSpotRecommendationModuleStyleA } from '../view/ScenicSpotRecommendationModuleStyleA';
import { RecentActivitiesModule } from '../view/RecentActivitiesModule';
import { QuickNavigationModule } from '../view/QuickNavigationModule';
import { SmartRecommendationModule } from '../view/SmartRecommendationModule';

@Component
export default struct HomePage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        PersonalizedWelcomeModule()
        ScenicSpotRecommendationModuleStyleA()
        RecentActivitiesModule()
        QuickNavigationModule()
        SmartRecommendationModule()
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .width('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_bg_color'))
  }
}
