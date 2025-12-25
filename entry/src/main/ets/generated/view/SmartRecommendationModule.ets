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
  DataSource, Data
} from '../viewmodel/SmartRecommendationModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';

import { BreakpointConstants } from '../common/BreakpointConstants';
import { CommonConstants } from '../common/CommonConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';

@Component
export struct SmartRecommendationModule {
  @State itemModel: Data =
    Data.getInstance();
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  @State moduleTitle: string = "智慧文旅推荐";
  @State moduleRedirectContent: string = "查看更多";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @Consume('appPathStack') appPathStack: NavPathStack;
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;
  private columnNumberArray: number[] = [3, 4, 4];

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
      ModuleTitleComponent({ title: this.moduleTitle, moduleRedirectContent: this.moduleRedirectContent })

      if (this.loadingStatus === LoadingStatus.FAILED) {
        LoadingFailedView(() => this.loadResources())
      } else if (this.loadingStatus === LoadingStatus.SUCCESS) {
        WaterFlow() {
          LazyForEach(this.lazyDataSource, (item: DataSource) => {
            FlowItem() {
              VerticalGraphicTextItem({
                image: item.getImage(),
                content: item.getContent(),
                title: item.getTitle()
              })
            }
            .onClick(() => {
              this.appPathStack.pushPathByName('DetailedPagePathStack', null)
            })
            .height("120vp")
            .width(CommonConstants.FULL_PERCENT)
          }, (item: DataSource, index: number) => index + JSON.stringify(item))
        }
        .nestedScroll({ scrollForward: NestedScrollMode.PARENT_FIRST, scrollBackward: NestedScrollMode.SELF_FIRST })
        .cachedCount(4)
        .columnsTemplate(("1fr ").repeat(new BreakpointType(this.columnNumberArray[0], this.columnNumberArray[1],
          this.columnNumberArray[2]).getValue(this.currentWidthBreakpoint)).trim())
        .columnsGap("8vp")
        .rowsGap("8vp")
        .width(CommonConstants.FULL_PERCENT)
      }
    }
    .width('92%')
    .borderRadius($r('sys.float.corner_radius_level8'))
    .margin({ bottom: "10vp" })
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
        .borderRadius($r('sys.float.corner_radius_level4'))
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