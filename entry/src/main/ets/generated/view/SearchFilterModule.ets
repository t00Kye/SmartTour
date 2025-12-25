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
import { CommonConstants } from "../common/CommonConstants"

@Component
export struct SearchFilterModule {
  @State search_placeholder: string = "搜索景点"
  @State default_select_text: string = "选择分类"
  @State searchImage: Resource = $r("app.media.ic_public_search")
  private index: number = 2
  private space: number = 8
  private arrowPosition: ArrowPosition = ArrowPosition.END
  private searchInput: string = ""
  @Consume('appPathStack') appPathStack: NavPathStack;

  build() {
    Row() {
      Row() {
        Select([])
        // .borderRadius({ topLeft: 20, bottomLeft: 20 })
          .selected(this.index)/**
           * TODO:
           * please modify it according to the actual situation.
           * modify {@link SelectSearchModule#default_select_text}
           */
          .value(this.default_select_text)
          .font({ size: $r('sys.float.Body_L'), weight: 500 })
          .fontColor($r('sys.color.font_primary'))
          .selectedOptionFont({ size: $r('sys.float.Body_L'), weight: 400 })
          .optionFont({ size: $r('sys.float.Body_L'), weight: 400 })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(MenuAlignType.START, { dx: 0, dy: 0 })
          .optionWidth(200)
          .optionHeight(300)
          .onClick(() => {
            this.appPathStack.pushPathByName('Page_ScreenList', null)
          })
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index)
            this.index = index;
            if (text) {
              this.default_select_text = text;
            }
          })
          .backgroundColor(Color.White)
        Divider().vertical(true).height(22).color($r('sys.color.font_primary')).opacity(0.6)
        Stack({ alignContent: Alignment.Start }) {
          /**
           * TODO:
           * please modify it according to the actual situation.
           * modify {@link SelectSearchModule#search_placeholder}
           */
          TextInput({ placeholder: this.search_placeholder, text: this.searchInput })
            .borderRadius({ topRight: 20, bottomRight: 20 })
            .placeholderFont({
              size: $r('sys.float.Body_L'),
              weight: FontWeight.Normal
            })
            .height("40vp")
            .fontSize("16fp")
            .padding({
              left: "36vp",
              right: "12vp"
            })
            .width(CommonConstants.FULL_PERCENT)
            .enableKeyboardOnFocus(false)
            .onChange((value: string) => {
              this.searchInput = value;
            })
            .backgroundColor(Color.White)

          Image(this.searchImage)
            .width("16vp")
            .height("16vp")
            .margin({ left: "12vp" })
        }
        .alignSelf(ItemAlign.Center)
        .layoutWeight(1)
      }
      .backgroundColor(Color.White)
      .borderRadius($r('sys.float.corner_radius_level10'))
      .width('92%')
    }
    .width('100%')
    .margin({ bottom: '10vp' })
    .justifyContent(FlexAlign.Center)
  }
}
