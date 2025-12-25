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
  static readonly ICONS: Resource[] = [$r('app.media.icon'), $r('app.media.icon')];
  static readonly SHOP_NAMES: string[] = ['故宫博物院', '长城景区官方店'];
  static readonly SITUATIONS: string[] = ['待评价', '已完成'];
  static readonly GOOD_IMAGES: Resource[] = [$r('app.media.goodsImg'), $r('app.media.goodsImg')];
  static readonly GOOD_NAMES: string[] = ['故宫电子门票', '长城一日游套票'];
  static readonly GOOD_DETAILS: string[] = ['成人票1张，有效期至2024-12-31', '包含门票+导游服务，有效期至2024-10-31'];
  static readonly PRICES: string[] = ['¥60', '¥180'];
  static readonly TAGS: string[][] = [['随时退', '过期退'], ['快速入园', '官方直营']];
  static readonly NUMS: string[] = ['1', '2'];
  static readonly REAL_PRICES: string[] = ['¥60', '¥360'];
  static readonly BUTTONS: string[][] = [['查看详情', '再次购买'], ['查看详情', '申请退款']];

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
      for (let index = 0; index < Data.ICONS.length;
        index++) {
        modelList.push(new DataSource(
          Data.ICONS[index],
          Data.SHOP_NAMES[index],
          Data.SITUATIONS[index],
          Data.GOOD_IMAGES[index],
          Data.GOOD_NAMES[index],
          Data.GOOD_DETAILS[index],
          Data.PRICES[index],
          Data.TAGS[index],
          Data.NUMS[index],
          Data.REAL_PRICES[index],
          Data.BUTTONS[index]

        ));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private icon: Resource;
  private shop_name: string;
  private situation: string;
  private good_img: Resource;
  private good_name: string;
  private good_detail: string;
  private price: string;
  private tags: string[];
  private nums: string;
  private real_price: string;
  private buttons: string[];

  constructor(icon: Resource, shop_name: string, situation: string, good_img: Resource, good_name: string,
    good_detail: string, price: string, tags: string[], nums: string, real_price: string, buttons: string[]) {
    this.icon = icon;
    this.shop_name = shop_name;
    this.situation = situation;
    this.good_img = good_img;
    this.good_name = good_name;
    this.good_detail = good_detail;
    this.price = price;
    this.tags = tags;
    this.nums = nums;
    this.real_price = real_price;
    this.buttons = buttons;
  }

  getIcon(): Resource {
    return this.icon;
  }

  getShopName(): string {
    return this.shop_name;
  }

  getSituation(): string {
    return this.situation;
  }

  getGoodImg(): Resource {
    return this.good_img;
  }

  getGoodName(): string {
    return this.good_name;
  }

  getGoodDetail(): string {
    return this.good_detail;
  }

  getPrice(): string {
    return this.price;
  }

  getTags(): string[] {
    return this.tags;
  }

  getNums(): string {
    return this.nums;
  }

  getRealPrice(): string {
    return this.real_price;
  }

  getButtons(): string[] {
    return this.buttons;
  }
}