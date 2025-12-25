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
export struct ModuleTitleComponent {
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  public title: string = '';
  public moduleRedirectContent: string = '';
  @Consume('appPathStack') appPathStack: NavPathStack;

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);
  }

  build() {
    if (this.title.length) {
      Row() {
        Text(this.title)
          .fontSize($r('app.integer.subtitle_text_L'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.font_primary'))

        Text(this.moduleRedirectContent)
          .fontColor($r('app.color.font_secondary'))
          .fontSize($r('app.integer.body_text_S'))
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.jump()
          })

      }
      .width(CommonConstants.FULL_PERCENT)
      .height("44vp")
      .justifyContent(FlexAlign.SpaceBetween)
      .borderRadius($r('sys.float.corner_radius_level8'))
    }
  }
}
