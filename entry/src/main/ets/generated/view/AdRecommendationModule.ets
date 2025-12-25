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

import {
  Data, DataSource
} from '../viewmodel/AdRecommendationModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';
import { BreakpointConstants } from '../common/BreakpointConstants';

import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';

@Component
export struct AdRecommendationModule {
  @State itemModel: Data =
    Data.getInstance();
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  @State moduleTitle: string = "智慧文旅推荐";
  @State moduleRedirectContent: string = "查看更多";
  @State rowHeight: number = 200;
  @State rowGap: number = 6;
  private columnGapArray: number[] = [6, 10, 12];
  private columnNumberArray: number[] = [2, 6, 6];
  private rowNumberArray: number[] = [1, 1, 1];
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
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
          Grid() {
            LazyForEach(this.lazyDataSource,
              (item: DataSource) => {
                GridItem() {
                  VerticalGraphicTextItem({
                    image: item.getImage(),
                    content: item.getContent(),
                    title: item.getTitle()
                  })
                }
                .onClick(() => {
                  this.appPathStack.pushPathByName('DetailedPagePathStack', null);
                })
                .borderRadius($r('sys.float.corner_radius_level6'))
                .backgroundColor($r('app.color.module_item_bg_color'))
              }, (item: DataSource, index: number) => index + JSON.stringify(item))
          }
          .columnsTemplate(("1fr ").repeat(new BreakpointType(this.columnNumberArray[0], this.columnNumberArray[1],
            this.columnNumberArray[2]).getValue(this.currentWidthBreakpoint)).trim())
          .rowsTemplate(("1fr ").repeat(new BreakpointType(this.rowNumberArray[0], this.rowNumberArray[1],
            this.rowNumberArray[2]).getValue(this.currentWidthBreakpoint)).trim())
          .height(this.currentWidthBreakpoint !== BreakpointConstants.BREAKPOINT_LG ?
            (this.rowGap + this.rowHeight) * new BreakpointType(this.rowNumberArray[0], this.rowNumberArray[1],
              this.rowNumberArray[2]).getValue(this.currentWidthBreakpoint) :
            (this.rowGap + this.rowHeight + 30) * new BreakpointType(this.rowNumberArray[0], this.rowNumberArray[1],
              this.rowNumberArray[2]).getValue(this.currentWidthBreakpoint))
          .columnsGap(new BreakpointType(this.columnGapArray[0], this.columnGapArray[1],
            this.columnGapArray[2]).getValue(this.currentWidthBreakpoint))
          .rowsGap(this.rowGap)
        }
      }
      .width('92%')
      .align(Alignment.Center)
      .borderRadius($r('sys.float.corner_radius_level8'))
      .margin({ bottom: "10vp" })
    }
    .width('100%')
  }
}

@Component
export struct VerticalGraphicTextItem {
  @State image: Resource = $r('app.media.noImage')
  @State title: string = '模块名';
  @State content: string = '跳转';

  build() {
    Column() {
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link Data#IMAGES}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see Data#getResources()
       */
      Image(this.image)
        .borderRadius($r('sys.float.corner_radius_level6'))
        .width(CommonConstants.FULL_PERCENT)
        .height("70%")
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link Data#TITLES}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see Data#getResources()
       */
      Text(this.title)
        .fontSize($r('app.integer.subtitle_text_M'))
        .fontWeight(FontWeight.Medium)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(1)
        .width(CommonConstants.FULL_PERCENT)
        .fontColor($r('app.color.font_primary'))
        .padding({ top: 4 })
      /**
       * TODO:
       * please modify it according to the actual situation.
       * directly modify {@link Data#CONTENTS}
       * or refactor method {@code getResources()} to implement your custom code logic.
       * @see Data#getResources()
       */
      Text(this.content)
        .fontSize($r('app.integer.body_text_S'))
        .opacity(0.4)
        .fontWeight(FontWeight.Regular)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width(CommonConstants.FULL_PERCENT)
        .fontColor($r('app.color.font_secondary'))
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .alignItems(HorizontalAlign.Start)

  }
}