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
} from '../viewmodel/PersonalizedWelcomeModuleData';

import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';

import { BreakpointConstants } from '../common/BreakpointConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import { ModuleTitleComponent } from '../common/ModuleTitleComponent';

@Component
export struct PersonalizedWelcomeModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Vertical
  @State moduleTitle: string = "智慧文旅欢迎横幅";
  @State moduleRedirectContent: string = "查看更多";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['8vp', '6vp', '10vp'];
  private lanesArray: number[] = [1, 2, 3];
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
                HorizontalGraphicTextDisplayItem({
                  image: item.getImage(),
                  mainText: item.getMainText(),
                  subText: item.getSubText(),
                  descriptionText: item.getDescriptionText(),
                  tagTextList: item.getTagTextList(),
                  tagTextColorList: item.getTagTextColorList()
                })
              }
              .width('100%')
              .height("130vp")
              .borderRadius($r('sys.float.corner_radius_level8'))
              .backgroundColor($r('app.color.module_item_bg_color'))
              .onClick(() => {
                this.appPathStack.pushPathByName('DetailedPagePathStack', null)
              })
            }, (item: DataSource, index: number) => index + JSON.stringify(item))
          }
          .width('auto')
          .height('auto')
          .listDirection(this.listDirection)
          // .divider({ "strokeWidth": 1 })
          .lanes(new BreakpointType(this.lanesArray[0], this.lanesArray[1],
            this.lanesArray[2]).getValue(this.currentWidthBreakpoint), "12vp")
        }
      }
      .borderRadius($r('sys.float.corner_radius_level8'))
      .margin({ bottom: "10vp" })
      .align(Alignment.Center)
      .width('92%')
    }
    .width("100%")
  }
}

@Component
export struct HorizontalGraphicTextDisplayItem {
  @State image: Resource = $r('app.media.noImage');
  @State mainText: string = '主标题文本';
  @State subText: string = '子标题文本';
  @State descriptionText: string = '这是一个描述文本，用于展示一些详细信息。';
  @State tagTextList: string[] = ['标签1', '标签2', '标签3', "标签4"];
  @State tagTextColorList: Color[] = [Color.Brown, Color.Green, Color.Gray, Color.Blue];
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  build() {
    Column() {
      Row() {
        /**
         * TODO:
         * please modify it according to the actual situation.
         * directly modify {@link Data#IMAGES}
         * or refactor method {@code getResources()} to implement your custom code logic.
         * @see Data#getResources()
         */
        Image(this.image)
          .margin({ left: 15, right: 15 })
          .borderRadius($r('sys.float.corner_radius_level8'))
          .height('80%')
          .width('33%')
        Column() {
          /**
           * TODO:
           * please modify it according to the actual situation.
           * directly modify {@link Data#MAIN_TEXT}
           * or refactor method {@code getResources()} to implement your custom code logic.
           * @see Data#getResources()
           */
          Text(this.mainText)
            .fontSize($r('app.integer.subtitle_text_M'))
            .fontColor($r('app.color.content_font_color'))
            .fontWeight(FontWeight.Bold)
            .padding({ bottom: 2 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .height('20%')
            .width(CommonConstants.FULL_PERCENT)
          /**
           * TODO:
           * please modify it according to the actual situation.
           * directly modify {@link Data#SUB_TEXT}
           * or refactor method {@code getResources()} to implement your custom code logic.
           * @see Data#getResources()
           */
          Text(this.subText)
            .fontSize($r('app.integer.body_text_S'))
            .fontColor($r('app.color.content_sub_title_font_color'))
            .fontWeight(FontWeight.Regular)
            .padding({ bottom: 4 })
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .height('20%')
            .width(CommonConstants.FULL_PERCENT)
          /**
           * TODO:
           * please modify it according to the actual situation.
           * directly modify {@link Data#DESCRIPTION_TEXT}
           * or refactor method {@code getResources()} to implement your custom code logic.
           * @see Data#getResources()
           */
          Text(this.descriptionText)
            .fontSize($r('app.integer.caption_text_L'))
            .fontColor('#191919')
            .padding({ bottom: 4 })
            .maxLines(3)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .height('40%')
            .width(CommonConstants.FULL_PERCENT)
          List() {
            ForEach(this.tagTextList, (item: string, index: number) => {
              ListItem() {
                Text(item)
                  .width(52)
                  .height(18)
                  .textAlign(TextAlign.Center)
                  .fontSize($r('app.integer.caption_text_M'))
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.tagTextColorList[index])
                  .borderColor(this.tagTextColorList[index])
                  .borderWidth(1)
                  .borderRadius($r('sys.float.corner_radius_level2'))
                  .margin({ right: 2 })
              }
            })
          }
          .height('20%')
          .scrollBar(BarState.Off)
          .listDirection(Axis.Horizontal)
        }
        .padding({ right: 15 })
        .width('60%')
        .height('80%')
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .borderRadius($r('sys.float.corner_radius_level8'))
      .backgroundColor($r('app.color.comp_background_primary_trans'))
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
    }
    .margin({ bottom: "8px" })
  }
}