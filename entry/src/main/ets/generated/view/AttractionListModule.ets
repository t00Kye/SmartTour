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
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import {
  Data, DataSource
} from '../viewmodel/AttractionListModuleData';

@Component
export struct AttractionListModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Horizontal
  @State moduleTitle: string = "景点列表";
  @State moduleRedirectContent: string = "查看更多";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['12vp', '16vp', '20vp'];
  @Consume('appPathStack') appPathStack: NavPathStack;
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

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
        }
        if (this.loadingStatus === LoadingStatus.SUCCESS) {
          List({
            space: new BreakpointType(this.spaceArray[0], this.spaceArray[1],
              this.spaceArray[2]).getValue(this.currentWidthBreakpoint)
          }) {
            LazyForEach(this.lazyDataSource, (item: DataSource) => {
              ListItem() {
                VerticalDoubleGraphicTextItem({
                  title1: item.getTitle1(),
                  image1: item.getImage1(),
                  imageDetail1: item.getImageDetail1(),
                  detail1: item.getDetail1(),
                  title2: item.getTitle2(),
                  image2: item.getImage2(),
                  imageDetail2: item.getImageDetail2(),
                  detail2: item.getDetail2(),
                })
              }
              .width('180vp')
              .height('110.00vp')
              .onClick(() => {
                this.appPathStack.pushPathByName('DetailedPagePathStack', null);
              })
            }, (item: DataSource, index: number) => index + JSON.stringify(item))
          }
          .width('auto')
          .height('auto')
          .listDirection(this.listDirection)
          .scrollBar(BarState.Off)
        }
      }
      .width('92%')
      .height("auto")
      .align(Alignment.Center)
      .borderRadius($r('sys.float.corner_radius_level8'))
      .margin({ bottom: "10vp" })
    }
    .width('100%')
  }
}

@Component
export struct VerticalDoubleGraphicTextItem {
  @State title1: string = '口碑榜'
  @State image1: Resource = $r('app.media.icon')
  @State imageDetail1: string = '杭州'
  @State detail1: string = '特色体验榜'
  @State title2: string = '旅行热点'
  @State image2: Resource = $r('app.media.icon')
  @State imageDetail2: string = '飙升217%'
  @State detail2: string = '大明山景区'

  build() {
    Row() {
      // 模块1
      Column() {
        Text(this.title1)
          .width(CommonConstants.FULL_PERCENT)
          .height('18%')
          .fontSize($r('app.integer.subtitle_text_S'))
          .fontColor($r('app.color.font_primary'))
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
        Column() {
          Text(this.imageDetail1)
            .width(CommonConstants.FULL_PERCENT)
            .height(20)
            .fontSize($r('app.integer.caption_text_M'))
            .fontColor($r('app.color.font_on_primary'))
            .fontWeight(FontWeight.Bold)
            .linearGradient({ colors: [[Color.Transparent, 0], [Color.Black, 100]] })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .padding(4)
            .borderRadius({
              bottomLeft: $r('sys.float.corner_radius_level4'),
              bottomRight: $r('sys.float.corner_radius_level4')
            })
            .maxLines(1)
        }
        .width(CommonConstants.FULL_PERCENT)
        .height('70%')
        .backgroundImage(this.image1)
        .backgroundImageSize(ImageSize.Cover)
        .borderRadius($r('sys.float.corner_radius_level4'))
        .justifyContent(FlexAlign.End)
        .alignItems(HorizontalAlign.Start)

        Text(this.detail1)
          .width(CommonConstants.FULL_PERCENT)
          .height('12%')
          .fontSize($r('app.integer.caption_text_M'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.font_secondary'))
          .padding({ top: 2 })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
      }
      .width('49%')
      .height(CommonConstants.FULL_PERCENT)

      // 模块2
      Column() {
        Text(this.title2)
          .width(CommonConstants.FULL_PERCENT)
          .height('18%')
          .fontSize($r('app.integer.subtitle_text_S'))
          .fontColor($r('app.color.font_primary'))
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
        Column() {
          Text(this.imageDetail2)
            .width(CommonConstants.FULL_PERCENT)
            .height(20)
            .fontSize($r('app.integer.caption_text_M'))
            .fontColor($r('app.color.font_on_primary'))
            .fontWeight(FontWeight.Bold)
            .linearGradient({ colors: [[Color.Transparent, 0], [Color.Black, 100]] })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .padding(4)
            .borderRadius({
              bottomLeft: $r('sys.float.corner_radius_level4'),
              bottomRight: $r('sys.float.corner_radius_level4')
            })
            .maxLines(1)
        }
        .width(CommonConstants.FULL_PERCENT)
        .height('70%')
        .backgroundImage(this.image1)
        .backgroundImageSize(ImageSize.Cover)
        .borderRadius($r('sys.float.corner_radius_level4'))
        .justifyContent(FlexAlign.End)
        .alignItems(HorizontalAlign.Start)

        Text(this.detail2)
          .width(CommonConstants.FULL_PERCENT)
          .height('12%')
          .fontSize($r('app.integer.caption_text_M'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.font_secondary'))
          .padding({ top: 2 })
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
      }
      .width('49%')
      .height(CommonConstants.FULL_PERCENT)
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .borderRadius($r('sys.float.corner_radius_level5'))
    .justifyContent(FlexAlign.SpaceBetween)
  }
}