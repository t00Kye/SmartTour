import HomePage from '../generated/pages/HomePage'
import AttractionsPage from '../generated/pages/AttractionsPage'
import ItineraryPage from '../generated/pages/ItineraryPage'
import BusinessPage from '../generated/pages/BusinessPage'
import OrdersPage from '../generated/pages/OrdersPage'
import MyPage from '../generated/pages/MyPage'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0

  build() {
    Column() {
      // ===== 页面区域 =====
      Stack() {
        if (this.currentIndex === 0) {
          HomePage()
        } else if (this.currentIndex === 1) {
          AttractionsPage()
        } else if (this.currentIndex === 2) {
          ItineraryPage()
        } else if (this.currentIndex === 3) {
          BusinessPage()
        } else if (this.currentIndex === 4) {
          OrdersPage()
        } else if (this.currentIndex === 5) {
          MyPage()
        }
      }
      .layoutWeight(1)

      // ===== 底部导航 =====
      Row() {
        this.TabItem('首页', 0)
        this.TabItem('景点', 1)
        this.TabItem('行程', 2)
        this.TabItem('商圈', 3)
        this.TabItem('订单', 4)
        this.TabItem('我的', 5)
      }
      .height(56)
      .width('100%')
      .backgroundColor('#ffffff')
      .border({ width: { top: 1 }, color: '#eeeeee' })
    }
    .width('100%')
    .height('100%')
  }

  // ===== TabItem 组件 =====
  @Builder
  TabItem(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === index ? '#007DFF' : '#666666')
    }
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index
    })
  }
}
