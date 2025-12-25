import { ObservedArray } from '../util/ObservedArray'
import LazyDataSource from '../util/LazyDataSource'

export class DataSource {
  private icon: Resource;
  private name: string;
  private rating: number;
  private monthSales: number;
  private distance: string;
  private time: string;
  private startPrice: number;
  private deliveryFee: number;
  private isFreeDelivery: boolean;
  private tagTop: string;

  constructor(
    icon: Resource,
    name: string,
    rating: number,
    monthSales: number,
    distance: string,
    time: string,
    startPrice: number,
    deliveryFee: number,
    isFreeDelivery: boolean,
    tagTop: string
  ) {
    this.icon = icon;
    this.name = name;
    this.rating = rating;
    this.monthSales = monthSales;
    this.distance = distance;
    this.time = time;
    this.startPrice = startPrice;
    this.deliveryFee = deliveryFee;
    this.isFreeDelivery = isFreeDelivery;
    this.tagTop = tagTop;
  }

  getIcon(): Resource {
    return this.icon;
  }

  getName(): string {
    return this.name;
  }

  getRating(): number {
    return this.rating;
  }

  getMonthSales(): number {
    return this.monthSales;
  }

  getDistance(): string {
    return this.distance;
  }

  getTime(): string {
    return this.time;
  }

  getStartPrice(): number {
    return this.startPrice;
  }

  getDeliveryFee(): number {
    return this.deliveryFee;
  }

  getIsFreeDelivery(): boolean {
    return this.isFreeDelivery;
  }

  getTagTop(): string {
    return this.tagTop;
  }
}

@Observed
export class Data {
  private lazyDataSource: LazyDataSource<DataSource> = new LazyDataSource<DataSource>();
  static readonly STORE_IMAGES: Resource[] = [$r('app.media.background'), $r('app.media.background')];
  static readonly TITLES: string[] = ['商家名称', '商家列表'];
  static readonly SCORES: number[] =
    [4.5, 4.9, 3.0];
  static readonly SALES: number[] =
    [4000, 3000, 1000];
  static readonly DISTANCES: string[] = ['1.2km', '2.5km'];
  static readonly TIMES: string[] = ['30分钟', '45分钟'];
  static readonly CONSUMPTIONS: number[] =
    [20, 20, 50];
  static readonly FEES: number[] =
    [2.5, 1.9, 6];
  static readonly FREE: boolean[] =
    [true, false, false];
  static readonly TAGS: string[] = ['必吃榜', '可订座'];

  async getResources(): Promise<void> {
    return new Promise<void>((resolve) => {
      const restaurantArray: ObservedArray<DataSource> = [];
      for (let index = 0; index < Data.TITLES.length;
        index++) {
        restaurantArray.push(new DataSource(
          Data.STORE_IMAGES[index],
          Data.TITLES[index],
          Data.SCORES[index],
          Data.SALES[index],
          Data.DISTANCES[index],
          Data.TIMES[index],
          Data.CONSUMPTIONS[index],
          Data.FEES[index],
          Data.FREE[index],
          Data.TAGS[index]
        ))
      }
      this.lazyDataSource.pushArrayData(restaurantArray);
      resolve();
    });
  }

  getLazyDataSource(): LazyDataSource<DataSource> {
    return this.lazyDataSource;
  }

  getRestaurants(): ObservedArray<DataSource> {
    return this.lazyDataSource.getDataList();
  }

  addRestaurant(restaurant: DataSource): void {
    this.lazyDataSource.pushData(restaurant);
  }

  addRestaurantAt(index: number, restaurant: DataSource): void {
    this.lazyDataSource.addData(index, restaurant);
  }

  deleteRestaurant(index: number): void {
    this.lazyDataSource.deleteData(index);
  }

  clearAll(): void {
    this.lazyDataSource.clear();
  }

  isEmpty(): boolean {
    return this.lazyDataSource.isEmpty();
  }

  getTotalCount(): number {
    return this.lazyDataSource.totalCount();
  }
}