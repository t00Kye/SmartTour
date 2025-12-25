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

import { curves } from '@kit.ArkUI';
import { CommonConstants } from '../common/CommonConstants';

@Builder
export function SearchModuleWithButtonPageBuilder() {
  SearchModuleWithButtonPage()
}

@Component
export default struct SearchModuleWithButtonPage {
  private pageInfos: NavPathStack = new NavPathStack();

  private onArrowClicked(): void {
    this.pageInfos.pop(false);
  }

  build() {
    NavDestination() {
      Row() {
        Image($r('app.media.icon'))
          .width(40)
          .height(40)
          .onClick(() => {
            this.onArrowClicked();
          })
        Search({ placeholder: '搜索交通/酒店/景点等' })
          .searchButton('搜索')
          .enableKeyboardOnFocus(false)
          .placeholderColor(Color.Black)
          .placeholderFont({
            family: "HarmonyHeiTi",
            size: 16,
            weight: 400
          })
          .borderColor($r('sys.color.font_primary'))
          .searchIcon({ color: Color.Black })
          .backgroundColor(Color.White)
          .defaultFocus(true)
          .focusOnTouch(true)
          .fontColor(Color.Black)
          .width('85%')
          .padding({
            left: "24vp",
            right: "24vp"
          })
      }
      .width(CommonConstants.FULL_PERCENT)
      .height(50)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: '10vp' })
    }
    .transition(TransitionEffect.OPACITY)
    .hideTitleBar(true)
    .backgroundColor('#F1F3F5')
    .onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack;
    })
    .onBackPressed(() => {
      animateTo({
        curve: curves.interpolatingSpring(0, 1, 342, 38),
      }, () => {
        this.pageInfos.pop(false);
      })
      return true;
    })
  }
}