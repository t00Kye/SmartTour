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
  static readonly TITLES1: string[] = ['故宫博物院', '颐和园'];
  static readonly DETAILS1: string[] = ['评分4.8 特色文化古迹 距离1.2km', '评分4.6 特色皇家园林 距离2.5km'];
  static readonly IMAGES1: Resource[] =
    [$r(('app.media.realImageGen_travel_18')), $r(('app.media.realImageGen_travel_18'))];
  static readonly IMAGE_DETAILS1: string[] = ['评分4.8 特色文化古迹 距离1.2km', '评分4.6 特色皇家园林 距离2.5km'];
  static readonly TITLES2: string[] = ['长城', '天坛公园'];
  static readonly DETAILS2: string[] = ['评分4.9 特色世界遗产 距离15km', '评分4.5 特色古代祭坛 距离3.8km'];
  static readonly IMAGES2: Resource[] =
    [$r(('app.media.realImageGen_travel_16')), $r(('app.media.realImageGen_travel_10'))];
  static readonly IMAGE_DETAILS2: string[] = ['评分4.9 特色世界遗产 距离15km', '评分4.5 特色古代祭坛 距离3.8km'];

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
      for (let index = 0; index < Data.TITLES1.length;
        index++) {
        modelList.push(new DataSource(
          Data.TITLES1[index],
          Data.IMAGES1[index],
          Data.IMAGE_DETAILS1[index],
          Data.DETAILS1[index],
          Data.TITLES2[index],
          Data.IMAGES2[index],
          Data.IMAGE_DETAILS2[index],
          Data.DETAILS2[index]))
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private title1: string;
  private image1: Resource;
  private imageDetail1: string;
  private detail1: string;
  private title2: string;
  private image2: Resource;
  private imageDetail2: string;
  private detail2: string;

  constructor(title1: string, image1: Resource, imageDetail1: string, detail1: string, title2: string, image2: Resource,
    imageDetail2: string, detail2: string) {
    this.title1 = title1;
    this.image1 = image1;
    this.imageDetail1 = imageDetail1;
    this.detail1 = detail1;
    this.title2 = title2;
    this.image2 = image2;
    this.imageDetail2 = imageDetail2;
    this.detail2 = detail2;
  }

  getTitle1(): string {
    return this.title1;
  }

  getImage1(): Resource {
    return this.image1;
  }

  getImageDetail1(): string {
    return this.imageDetail1;
  }

  getDetail1(): string {
    return this.detail1;
  }

  getTitle2(): string {
    return this.title2;
  }

  getImage2(): Resource {
    return this.image2;
  }

  getImageDetail2(): string {
    return this.imageDetail2;
  }

  getDetail2(): string {
    return this.detail2;
  }
}