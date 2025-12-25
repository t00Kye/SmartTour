/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { BreakpointConstants } from './BreakpointConstants';
import { CommonConstants } from './CommonConstants';

@Component
export struct ModuleTitleComponentWithIcon {
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  public moduleIcon: Resource = $r("app.media.icon");
  public title: string = '';
  public moduleRedirectContent: string = '';
  @Consume('appPathStack') appPathStack: NavPathStack;

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);
  }

  build() {
    Row() {
      Row() {
        Image(this.moduleIcon)
          .height('20vp')
          .width('20vp')
          .margin({
            right: "4vp"
          })
        Text(this.title)
          .fontSize("16fp")
          .fontWeight(CommonConstants.FONT_WEIGHT_500)
          .fontColor($r('sys.color.font_primary'))
      }

      Text(this.moduleRedirectContent)
        .fontColor(Color.Gray)
        .fontSize('12fp')
        .fontWeight(CommonConstants.FONT_WEIGHT_500)
        .onClick(() => {
          this.jump()
        })
        .margin({
          right: "4vp"
        })
    }
    .width(CommonConstants.FULL_PERCENT)
    .padding({ left: 6, right: 6 })
    .height("30vp")
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius($r('sys.float.corner_radius_level6'))
  }
}
