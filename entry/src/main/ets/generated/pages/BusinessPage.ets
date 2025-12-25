import { MerchantFilterModule } from '../view/MerchantFilterModule';
import { MerchantListModule } from '../view/MerchantListModule';
import { NearbyMerchantRecommendationModule } from '../view/NearbyMerchantRecommendationModule';

@Component
export default struct BusinessPage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        MerchantFilterModule()
        MerchantListModule()
        NearbyMerchantRecommendationModule()
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
