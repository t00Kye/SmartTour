import { DestinationSearchModule } from '../view/DestinationSearchModule';
import { PersonalizedItineraryRecommendationModule } from '../view/PersonalizedItineraryRecommendationModule';
import { ResourceCategoryNavigationModule } from '../view/ResourceCategoryNavigationModule';
import { PopularAttractionsModule } from '../view/PopularAttractionsModule';
import { SmartItineraryGeneratorModule } from '../view/SmartItineraryGeneratorModule';

@Component
export default struct ItineraryPage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        DestinationSearchModule()
        PersonalizedItineraryRecommendationModule()
        ResourceCategoryNavigationModule()
        PopularAttractionsModule()
        SmartItineraryGeneratorModule()
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
