import { UserProfileModule } from '../view/UserProfileModule';
import { FunctionEntryModule } from '../view/FunctionEntryModule';
import { AdRecommendationModule } from '../view/AdRecommendationModule';
import { ServiceLinksModule } from '../view/ServiceLinksModule';

@Component
export default struct MyPage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        UserProfileModule()
        FunctionEntryModule()
        AdRecommendationModule()
        ServiceLinksModule()
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
