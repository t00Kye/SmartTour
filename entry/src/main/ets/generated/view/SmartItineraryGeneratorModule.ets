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
} from '../viewmodel/SmartItineraryGeneratorModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';

import { BreakpointConstants } from '../common/BreakpointConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent'

@Component
export struct SmartItineraryGeneratorModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Vertical
  @State moduleTitle: string = "智能行程生成器";
  @State moduleRedirectContent: string = "查看更多";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['8vp', '16vp', '20vp'];
  private lanesArray: number[] = [1, 3, 4];
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
        }
        if (this.loadingStatus === LoadingStatus.SUCCESS) {
          List({
            space: new BreakpointType(this.spaceArray[0], this.spaceArray[1],
              this.spaceArray[2]).getValue(this.currentWidthBreakpoint)
          }) {
            LazyForEach(this.lazyDataSource, (item: DataSource) => {
              ListItem() {
                HorizontalGraphicTextFunctionItem1({
                  icon: item.getIcon(),
                  title: item.getTitle(),
                  description: item.getDescription(),
                  routeText: item.getRouteText(),
                  routeIcon: item.getRouteIcon()
                })
              }
              .height("50vp")
              .borderRadius($r('sys.float.corner_radius_level4'))
              .backgroundColor($r('app.color.comp_background_primary_trans'))
              .onClick(() => {
                this.jump()
              })
            }, (item: DataSource, index: number) => index + JSON.stringify(item))
          }
          .width('auto')
          .height('auto')
          .listDirection(this.listDirection)
          .lanes(new BreakpointType(this.lanesArray[0], this.lanesArray[1],
            this.lanesArray[2]).getValue(this.currentWidthBreakpoint), "12vp")
        }
      }
      .width('92%')
      .margin({ bottom: "10vp" })
      .backgroundColor(Color.Transparent)
    }
    .width(CommonConstants.FULL_PERCENT)
  }
}

@Component
export struct HorizontalGraphicTextFunctionItem1 {
  @State title: string = '模块名';
  @State description: string = '跳转';
  @State icon: Resource = $r("app.media.ic_public_app");
  @State routeText: string = '跳转';
  @State routeIcon: Resource = $r('app.media.ic_public_arrow_right');

  build() {
    Row() {
      Row() {

        Image(this.icon)
          .height("60%")
          .borderRadius($r('sys.float.corner_radius_level8'))
          .padding({ right: 4 })
        Column() {

          Text(this.title)
            .fontColor($r('app.color.font_primary'))
            .fontSize($r('app.integer.subtitle_text_S'))
            .fontWeight(FontWeight.Medium)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .padding({ bottom: 2 })

          Text(this.description)
            .fontColor($r('app.color.font_secondary'))
            .fontSize($r('app.integer.body_text_S'))
            .fontWeight(FontWeight.Regular)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
        }
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Center)
        .height(CommonConstants.FULL_PERCENT)
        .width("60%")
      }
      .height(CommonConstants.FULL_PERCENT)
      .width("80%")

      Row() {

        Text(this.routeText)
          .fontColor($r('app.color.font_tertiary'))
          .fontSize($r('app.integer.body_text_S'))
          .fontWeight(FontWeight.Regular)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .opacity(0.8)

        Image(this.routeIcon)
          .width("12vp")
          .height("12vp")
          .fillColor($r('app.color.comp_background_neutral'))
          .opacity(0.6)
          .margin({ right: "4vp" })
      }
      .height(CommonConstants.FULL_PERCENT)
      .width("20%")
      .justifyContent(FlexAlign.End)
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius($r('sys.float.corner_radius_level4'))
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
    .padding({ left: 6, right: 6 })
  }
}
