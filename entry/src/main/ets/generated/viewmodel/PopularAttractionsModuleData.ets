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
import LazyDataSource from '../util/LazyDataSource';

export class Data {
  private static instance: Data;
  lazyDataSource: LazyDataSource<DataSource> = new LazyDataSource();
  static readonly IMAGES: Resource[] =
    [$r(('app.media.realImageGen_travel_8')), $r(('app.media.realImageGen_travel_1'))];
  static readonly TITLES: string[] = ['热门景点', '景点推荐'];
  static readonly CONTENTS: string[] =
    ['动态展示当地热门景点信息卡片，每张卡片包含景点主图、名称、评分和特色标签', '智慧文旅热门景点瀑布流展示'];

  constructor() {
  }

  public static getInstance(): Data {
    if (!Data.instance) {
      Data.instance =
        new Data();
    }
    return Data.instance;
  }

  /**
   * Data loaded on current view converts network data into rendering data
   */
  getResources(): Promise<void> {

    /**
     * use your web request here
     */
    return new Promise((resolve: Function) => {
      const modelList: Array<DataSource> = [];
      for (let index = 0; index < Data.IMAGES.length;
        index++) {
        modelList.push(new DataSource(
          Data.IMAGES[index],
          Data.TITLES[index],
          Data.CONTENTS[index]));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private image: Resource;
  private title: string;
  private content: string;

  constructor(image: Resource, title: string, content: string) {
    this.image = image;
    this.title = title;
    this.content = content;
  }

  getTitle(): string {
    return this.title;
  }

  getContent(): string {
    return this.content;
  }

  getImage(): Resource {
    return this.image
  }
}