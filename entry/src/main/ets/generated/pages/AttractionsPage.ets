import { SearchFilterModule } from '../view/SearchFilterModule';
import { AttractionCategoryModule } from '../view/AttractionCategoryModule';
import { AttractionListModule } from '../view/AttractionListModule';
import { ScenicSpotRecommendationModule } from '../view/ScenicSpotRecommendationModule';

@Component
export default struct AttractionsPage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        SearchFilterModule()
        AttractionCategoryModule()
        AttractionListModule()
        ScenicSpotRecommendationModule()
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
