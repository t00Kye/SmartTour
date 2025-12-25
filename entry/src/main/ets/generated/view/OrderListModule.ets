/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';
import { BreakpointConstants } from '../common/BreakpointConstants';
import { CommonConstants } from '../common/CommonConstants';
import LazyDataSource from '../util/LazyDataSource';
import {
  DataSource, Data
} from '../viewmodel/OrderListModuleData';

@Component
export struct OrderListModule {
  @State itemModel: Data =
    Data.getInstance();
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  @State moduleTitle: string = "订单列表";
  @State moduleRedirectContent: string = "查看更多";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @Consume('appPathStack') appPathStack: NavPathStack;
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);

  }

  aboutToAppear() {
    this.loadResources();

  }

  loadResources(): void {
    this.loadingStatus = LoadingStatus.LOADING;
    this.itemModel.getResources().then(() => {
      this.loadingStatus = LoadingStatus.SUCCESS;
    }).catch(() => {
      this.loadingStatus = LoadingStatus.FAILED;
    });
  }

  build() {
    Column() {
      Column() {
        ModuleTitleComponent({ title: this.moduleTitle, moduleRedirectContent: this.moduleRedirectContent })

        if (this.loadingStatus === LoadingStatus.FAILED) {
          LoadingFailedView(() => this.loadResources())
        } else if (this.loadingStatus === LoadingStatus.SUCCESS) {
          WaterFlow() {
            LazyForEach(this.lazyDataSource, (item: DataSource) => {
              FlowItem() {
                VerticalGraphicOrderItem2({
                  icon: item.getIcon(),
                  shop_name: item.getShopName(),
                  situation: item.getSituation(),
                  good_img: item.getGoodImg(),
                  good_name: item.getGoodName(),
                  good_detail: item.getGoodDetail(),
                  price: item.getPrice(),
                  tags: item.getTags(),
                  nums: item.getNums(),
                  real_price: item.getRealPrice(),
                  buttons: item.getButtons()
                })
              }
              .onClick(() => {
                this.jump()
              })
              .height(200)
              .width(CommonConstants.FULL_PERCENT)
            }, (item: DataSource, index: number) => index + JSON.stringify(item))
          }
          .nestedScroll({ scrollForward: NestedScrollMode.PARENT_FIRST, scrollBackward: NestedScrollMode.SELF_FIRST })
          .cachedCount(4)
          .columnsTemplate("1fr")
          .columnsGap("6vp")
          .rowsGap("12vp")
          .width(CommonConstants.FULL_PERCENT)
        }
      }
      .width('92%')
    }
    .width('100%')
    .margin({ bottom: "10vp" })
  }
}

@Component
export struct VerticalGraphicOrderItem2 {
  @State icon: Resource = $r('app.media.icon')
  @State shop_name: string = '江篱旧书店'
  @State situation: string = '交易关闭'
  @State good_img: Resource = $r('app.media.goodsImg')
  @State good_name: string = '[正版书籍]计算机辅助设计与制造'
  @State good_detail: string = ''
  @State price: string = '￥13.00'
  @State tags: string[] = ['7天无理由退货', '极速退款', '假一赔十']
  @State nums: string = 'x1'
  @State real_price: string = '￥12.74'
  @State buttons: string[] = ['追加评价', '删除订单', '加入购物车']
  @State index: number[] = []

  @Builder
  TagsStyle(tag: string) {
    Text(tag)
      .fontColor(Color.Gray)
      .fontSize(10)
      .borderWidth(1)
      .borderColor(Color.Gray)
      .padding({ left: 2, right: 2 })
      .margin({ left: 2 })
  }

  @Builder
  ButtonStyle(button: string, index: number) {
    Button(button, { type: ButtonType.Capsule })
      .fontSize($r('sys.float.Body_M'))
      .fontColor(index === this.buttons.length - 1 ? "#ff0a59f7" : $r('app.color.content_main_title_font_color'))
      .borderColor(index === this.buttons.length - 1 ? "#ff0a59f7" : Color.Gray)
      .borderWidth(1)
      .padding(6)
      .backgroundColor(Color.White)
      .margin({ left: 4 })
  }

  build() {
    Column() {
      Row() {
        Row() {
          Image(this.icon)
            .height(CommonConstants.FULL_PERCENT)
          Text(this.shop_name)
            .fontSize($r('app.integer.subtitle_text_M'))
            .fontWeight(FontWeight.Medium)
            .padding({ left: 4 })
        }

        Text(this.situation)
          .fontSize(14)
          .fontColor("#ff0a59f7")
      }
      .width(CommonConstants.FULL_PERCENT)
      .height('12%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Row() {
          Image(this.good_img)
            .height(CommonConstants.FULL_PERCENT)
            .borderRadius($r('sys.float.corner_radius_level4'))
        }
        .width('25%')
        .height(CommonConstants.FULL_PERCENT)
        .borderRadius($r('sys.float.corner_radius_level6'))
        .backgroundColor('#e5e3e1')

        Column() {
          Text(this.good_name)
            .fontSize(14)
            .fontWeight(700)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .padding({ left: 2 })
          if (this.good_detail) {
            Text(this.good_detail)
              .fontSize(12)
              .fontColor(Color.Gray)
              .padding({ left: 2, top: 4 })
          }
          Row() {
            ForEach(this.tags, (tag: string) => {
              this.TagsStyle(tag)
            })
          }
          .padding({ top: 6 })
        }
        .width('55%')
        .height(CommonConstants.FULL_PERCENT)
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 6 })

        Column() {
          Text(this.price)
            .fontSize(14)
            .fontWeight(500)
          Text(this.nums)
            .fontSize(10)
            .fontColor(Color.Gray)
            .padding({ top: 4 })
        }
        .width('20%')
        .height(CommonConstants.FULL_PERCENT)
        .alignItems(HorizontalAlign.End)
      }
      .width(CommonConstants.FULL_PERCENT)
      .height('50%')
      .padding({ top: 10 })

      Row() {
        Text("实付款")
          .fontSize(12)
          .fontWeight(500)
        Text(this.real_price)
          .fontSize(16)
          .fontWeight(500)
      }
      .width(CommonConstants.FULL_PERCENT)
      .height('20%')
      .justifyContent(FlexAlign.End)
      .alignItems(VerticalAlign.Bottom)
      .padding({ top: 6 })

      Row() {
        Text("更多")
          .fontSize(12)
          .fontColor(Color.Gray)
        Row() {
          ForEach(this.index, (index: number) => {
            this.ButtonStyle(this.buttons[index], index)
          })
        }
      }
      .width(CommonConstants.FULL_PERCENT)
      .height('20%')
      .padding({ top: 10 })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor($r('app.color.background_primary'))
    .borderRadius($r('sys.float.corner_radius_level8'))
    .onAppear(() => {
      for (let index = 0; index < this.buttons.length; index++) {
        this.index.push(index)
      }
    })
  }
}