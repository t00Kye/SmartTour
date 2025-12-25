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
  static readonly ICONS: Resource[] =
    [$r('app.media.lib_icon_53'), $r('app.media.lib_icon_178'), $r('app.media.lib_icon_173'),
      $r('app.media.lib_icon_18'), $r('app.media.lib_icon_216'), $r('app.media.lib_icon_176')];
  static readonly TITLES: string[] = ['我的收藏', '我的评论', '我的订单', '我的足迹', '我的优惠券', '设置'];

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
          Data.TITLES[index]));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private icon: Resource;
  private title: string;

  constructor(icon: Resource, title: string) {
    this.icon = icon;
    this.title = title;
  }

  getIcon(): Resource {
    return this.icon;
  }

  getTitle(): string {
    return this.title;
  }
}