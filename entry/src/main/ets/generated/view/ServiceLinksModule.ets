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
} from '../viewmodel/ServiceLinksModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';

import { BreakpointConstants } from '../common/BreakpointConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';

@Component
export struct ServiceLinksModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Vertical
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['4vp', '16vp', '20vp'];
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
                HorizontalGraphicTextFunctionItem4({
                  icon: item.getIcon(),
                  title: item.getTitle(),
                  routeText: item.getRouteText(),
                  routeIcon: item.getRouteIcon()
                })
              }
              .height("42vp")
              .borderRadius($r('sys.float.corner_radius_level8'))
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
      .margin({ bottom: "8vp" })
      .padding({ top: 8, bottom: 8 })
      .backgroundColor(Color.White)
      .borderRadius($r('sys.float.corner_radius_level8'))
    }
    .width(CommonConstants.FULL_PERCENT)
  }
}

@Component
export struct HorizontalGraphicTextFunctionItem4 {
  @State title: string = "智慧文旅";
  @State icon: Resource = $r("app.media.ic_public_app");
  @State routeText: string = "查看更多";
  @State routeIcon: Resource = $r('app.media.ic_public_arrow_right');

  build() {
    Row() {
      Row() {

        Image(this.icon)
          .height("50%")
          .borderRadius($r('sys.float.corner_radius_level8'))
          .padding({ right: 8 })
        Column() {

          Text(this.title)
            .fontColor($r('app.color.font_secondary'))
            .fontSize($r('app.integer.subtitle_text_S'))
            .fontWeight(FontWeight.Medium)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .padding({ bottom: 2 })

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
          .width("8vp")
          .height("8vp")
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
    .borderRadius($r('sys.float.corner_radius_level8'))
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
    .padding({ left: 12, right: 12 })
  }
}
