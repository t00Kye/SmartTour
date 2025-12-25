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
    [$r(('app.media.realImageGen_travel_3')), $r(('app.media.realImageGen_travel_15')),
      $r(('app.media.realImageGen_travel_16')), $r(('app.media.realImageGen_travel_16')),
      $r(('app.media.realImageGen_travel_6')), $r(('app.media.realImageGen_travel_4'))];
  static readonly DESCRIPTION_TEXT: string[] = ['热门活动', '智慧文旅近期活动', '活动海报', '标题', '日期', '参与人数'];
  static readonly TIMES: string[] =
    ['2023-10-01', '2023-10-15', '2023-11-01', '2023-11-20', '2023-12-05', '2023-12-25'];

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
          Data.DESCRIPTION_TEXT[index],
          Data.TIMES[index],
        ));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private image: Resource;
  private descriptionText: string;
  private time: string;

  constructor(image: Resource, descriptionText: string, time: string) {
    this.image = image;
    this.descriptionText = descriptionText;
    this.time = time;
  }

  getImage(): Resource {
    return this.image;
  }

  getDescriptionText(): string {
    return this.descriptionText;
  }

  getTime(): string {
    return this.time;
  }
}