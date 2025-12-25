import { Data, DataSource } from '../viewmodel/MerchantListModuleData'

@Component
struct RestaurantItem {
  @Consume('appPathStack') appPathStack: NavPathStack;
  restaurant: DataSource = new DataSource(
    $r('app.media.noImage'),
    '默认餐厅',
    0,
    0,
    '0km',
    '0分钟',
    0,
    0,
    false,
    ''
  );

  build() {
    Row() {
      Stack({ alignContent: Alignment.TopStart }) {
        Image(this.restaurant.getIcon())
          .borderRadius(8)
          .objectFit(ImageFit.Cover)

        Text(this.restaurant.getTagTop())
          .fontSize(6)
          .fontColor(Color.White)
          .backgroundColor('#4CB4E7')
          .padding({
            left: 4,
            right: 4,
            top: 2,
            bottom: 2
          })
          .borderRadius($r('sys.float.ohos_id_corner_radius_default_s'))
          .margin(2)
      }
      .padding({ left: 8, right: 4 })
      .width('35%')

      Column() {
        Row() {
          Text(this.restaurant.getName())
            .width('100%')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
        .margin({ top: 8 })

        Flex({ alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
          Flex({ alignItems: ItemAlign.Center }) {
            Text(`${this.restaurant.getRating()}分`)
              .fontSize(12)
              .fontColor('#FF6B23')
            Text(`月售${this.restaurant.getMonthSales()}+`)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ left: 4 })
          }

          Flex({ alignItems: ItemAlign.End }) {
            Text(`${this.restaurant.getTime()}`)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ right: 2 })
            Text(`${this.restaurant.getDistance()}`)
              .fontSize(12)
              .fontColor('#999999')
          }
        }
        .margin({ top: 4, bottom: 2 })
        .width('100%')


        Flex({ alignItems: ItemAlign.Center }) {
          Text(`起送¥${this.restaurant.getStartPrice()}`)
            .fontSize(12)
            .fontColor('#999999')

          if (this.restaurant.getIsFreeDelivery()) {
            Row({ space: 4 }) {
              Text('免配送费')
                .fontSize(12)
                .fontColor('#FF6B23')
                .margin({ left: 4 })
              Text(`¥${this.restaurant.getDeliveryFee()}`)
                .fontSize(12)
                .fontColor('#999999')
                .decoration({ type: TextDecorationType.LineThrough })
            }
          } else {
            Text(`配送费¥${this.restaurant.getDeliveryFee()}`)
              .fontSize(12)
              .fontColor('#999999')
              .margin({ left: 4 })
          }
        }
        .margin({ bottom: 4 })
        .width('100%')

        Flex({ wrap: FlexWrap.Wrap }) {
          Text('万物皆可炸')
            .fontSize(12)
            .fontColor('#FF6B23')
            .backgroundColor('#FFF5E6')
            .padding({
              left: 8,
              right: 8,
              top: 2,
              bottom: 2
            })
            .borderRadius(4)
            .margin({ right: 8, top: 4 })

          Text('最高28')
            .fontSize(12)
            .fontColor('#FF6B23')
            .backgroundColor('#FFF5E6')
            .padding({
              left: 8,
              right: 8,
              top: 2,
              bottom: 2
            })
            .borderRadius(4)
            .margin({ right: 8, top: 4 })

          Text('本店再补1.5')
            .fontSize(12)
            .fontColor('#FF6B23')
            .backgroundColor('#FFF5E6')
            .padding({
              left: 8,
              right: 8,
              top: 2,
              bottom: 2
            })
            .borderRadius(4)
            .margin({ right: 8, top: 4 })
        }

        Flex({ wrap: FlexWrap.Wrap }) {
          Text('爆 7元')
            .fontSize(12)
            .fontColor('#FF4B4B')
            .backgroundColor('#FFE4E4')
            .padding({
              left: 8,
              right: 8,
              top: 2,
              bottom: 2
            })
            .borderRadius(4)
            .margin({ right: 8, top: 4 })

          Text('新客再补5')
            .fontSize(12)
            .fontColor('#FF6B23')
            .backgroundColor('#FFF5E6')
            .padding({
              left: 8,
              right: 8,
              top: 2,
              bottom: 2
            })
            .borderRadius(4)
            .margin({ right: 8, top: 4 })
        }
      }
      .padding(2)
      .width('65%')
    }
    .borderRadius(4)
    .width('100%')
    .constraintSize({ maxWidth: '100%' })
    .backdropBlur(12)
    .backgroundColor('rgba(255, 255, 255, 0.7)')
    .shadow({
      radius: 8,
      color: 'rgba(0, 0, 0, 0.1)',
      offsetX: 0,
      offsetY: 2
    })

    .layoutWeight(1)
    .onClick(() => {
      this.appPathStack.pushPathByName('DetailedPagePathStack', null)
    })
  }
}

@Component
export struct MerchantListModule {
  @State restaurantListModel: Data = new Data();

  aboutToAppear() {
    this.restaurantListModel.getResources();
  }

  build() {
    List({ space: 8 }) {
      LazyForEach(this.restaurantListModel.getLazyDataSource(),
        (item: DataSource, index: number) => {
          ListItem() {
            RestaurantItem({ restaurant: item })
          }
        }, (item: DataSource, index: number) => index + JSON.stringify(item))
    }
    .width('100%')
    .padding(12)
    .backgroundColor('#F5F5F5')
  }
}