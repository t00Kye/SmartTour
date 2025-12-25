import { OrderStatusFilterModule } from '../view/OrderStatusFilterModule';
import { OrderListModule } from '../view/OrderListModule';
import { ProductRecommendationModule } from '../view/ProductRecommendationModule';

@Component
export default struct OrdersPage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        OrderStatusFilterModule()
        OrderListModule()
        ProductRecommendationModule()
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
