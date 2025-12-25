import { router } from '@kit.ArkUI';

@Entry
@Component
struct EmptyPage {
  @State content: string = (router.getParams() as Record<string, string>)['text'];

  build() {
    Column() {
      Row() {
        Text('empty page for ')
          .fontSize('25vp')
          .fontColor(Color.Gray)
        Text(this.content)
          .fontSize('25vp')
          .fontColor(Color.Blue)
      }
      .onClick(() => {
        router.back();
      })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }
}
