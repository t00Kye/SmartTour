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

import { CommonConstants } from '../common/CommonConstants';

@Component
export struct MerchantFilterModule {
  @State titles: string[] = ['吃', '住', '购', '娱'];
  @State currentIndex: number = 0;

  @Builder
  TabBuilder(index: number, title: string) {
    Column() {
      Text(title)
        .width(CommonConstants.FULL_PERCENT)
        .height('95%')
        .fontSize($r('app.integer.subtitle_text_S'))
        .fontColor(this.currentIndex === index ? $r('app.color.font_primary') : $r('app.color.font_secondary'))
        .fontWeight(this.currentIndex === index ? FontWeight.Bold : FontWeight.Medium)
        .backgroundColor(this.currentIndex === index ? $r('app.color.comp_background_primary_trans') :
          $r('app.color.comp_background_primary_trans'))
        .textAlign(TextAlign.Center)
      if (this.currentIndex === index) {
        Line()
          .width('20%')
          .height(2)
          .backgroundColor($r('app.color.font_primary'))
      }
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .backgroundColor($r('app.color.comp_background_primary_trans'))
  }

  build() {
    Column() {
      Tabs() {
        ForEach(this.titles, (item: string, index: number) => {
          TabContent() {
          }
          .tabBar(this.TabBuilder(index, item))
        })
      }
      .width('auto')
      .height('auto')
      .scrollable(true)
      .barPosition(BarPosition.Start)
      .vertical(false)
      .barWidth(CommonConstants.FULL_PERCENT)
      .barHeight(40)
      .barBackgroundColor(Color.White)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
  }
}