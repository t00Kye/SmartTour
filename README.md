# SmartTour 智能旅游应用

## 项目简介

SmartTour 是一款基于 HarmonyOS 开发的智能旅游应用，为用户提供个性化的旅游推荐、景点浏览、行程规划、商圈探索和订单管理等一站式旅游服务。

## 技术栈

- **开发框架**: HarmonyOS
- **开发语言**: ArkTS
- **开发工具**: DevEco Studio
- **API 版本**: HarmonyOS API 9+

## 主要功能

### 1. 首页
- 个性化欢迎横幅
- 景点推荐（样式A）
- 最近活动
- 快速导航
- 智能推荐模块

### 2. 景点页面
- 搜索筛选功能
- 景点分类浏览
- 景点列表展示
- 景点推荐

### 3. 行程页面
- 目的地搜索
- 个性化行程推荐
- 资源分类导航
- 热门景点推荐
- 智能行程生成器

### 4. 商圈页面
- 商圈浏览
- 商家推荐
- 附近商家推荐

### 5. 订单页面
- 订单列表
- 订单状态筛选
- 订单详情

### 6. 我的页面
- 用户个人中心
- 用户信息管理

## 项目结构

```
SmartTour/
├── AppScope/                    # 应用级配置
│   ├── app.json5              # 应用配置
│   └── resources/             # 应用级资源
├── entry/                      # 主模块
│   ├── src/
│   │   ├── main/
│   │   │   ├── ets/
│   │   │   │   ├── entryability/    # 应用入口
│   │   │   │   ├── pages/           # 页面
│   │   │   │   └── generated/       # 生成的代码
│   │   │   │       ├── pages/       # 页面组件
│   │   │   │       ├── view/        # 视图组件
│   │   │   │       ├── viewmodel/   # 视图模型
│   │   │   │       └── util/        # 工具类
│   │   │   └── resources/           # 资源文件
│   │   └── ohosTest/               # 测试代码
│   └── build-profile.json5
├── hvigor/                      # 构建工具配置
├── oh-package.json5             # 依赖配置
└── README.md                    # 项目说明文档
```

## 环境要求

### 开发环境
- **操作系统**: Windows 10/11, macOS 10.14+, Ubuntu 18.04+
- **开发工具**: DevEco Studio 4.0+
- **JDK**: JDK 1.8 或更高版本
- **Node.js**: 14.0.0 或更高版本

### 运行环境
- **设备**: HarmonyOS 手机（API 9+）
- **最低系统版本**: HarmonyOS 3.0

## 安装与运行

### 1. 环境准备

1. 下载并安装 [DevEco Studio](https://developer.harmonyos.com/cn/develop/deveco-studio)
2. 配置 HarmonyOS SDK
3. 配置 Node.js 环境

### 2. 项目导入

1. 打开 DevEco Studio
2. 选择 `File` -> `Open`
3. 选择项目根目录
4. 等待依赖下载完成

### 3. 运行项目

1. 连接 HarmonyOS 设备或启动模拟器
2. 点击运行按钮或使用快捷键 `Shift + F10`
3. 等待应用安装并启动

> 注意：当前版本为演示版本，部分功能可能需要后端服务支持。

## 开发说明

### 代码规范
- 遵循 ArkTS 编码规范
- 使用 ESLint 进行代码检查
- 组件命名采用 PascalCase
- 变量命名采用 camelCase

### 主要技术点
- **响应式布局**: 使用 BreakpointType 实现多设备适配
- **数据管理**: 使用 ViewModel 模式管理数据
- **组件化开发**: 模块化设计，便于维护和扩展
- **懒加载**: 使用 LazyDataSource 优化列表性能


## 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 许可证

本项目采用 Apache License 2.0 许可证。

## 联系方式

如有问题或建议，请联系开发团队。

---

**开发团队**: SmartTour 开发组  
**版本**: 1.0.0  
**更新日期**: 2025年



# SmartTour 项目目录结构详细说明

本文档详细说明了 SmartTour 智能旅游应用的项目目录结构，包括所有模块和文件的组织方式。

## 📁 项目根目录

```
SmartTour/
├── AppScope/                    # 应用级配置和资源
├── entry/                       # 主应用模块
├── docs/                        # 项目文档
├── hvigor/                      # 构建工具配置
├── oh_modules/                  # 第三方依赖模块
└── 配置文件                     # 各种配置文件
```

---

## 📂 AppScope/ - 应用级配置

应用级别的配置和资源，对整个应用生效。

```
AppScope/
├── app.json5                    # 应用配置文件
└── resources/                   # 应用级资源
    └── base/
        ├── element/
        │   └── string.json      # 应用级字符串资源
        └── media/               # 应用级媒体资源
            ├── background.png
            ├── foreground.png
            └── layered_image.json
```

---

## 📂 entry/ - 主应用模块

主应用模块，包含所有业务代码和资源。

### entry/src/main/ets/ - 源代码目录

```
entry/src/main/ets/
├── entryability/                # 应用入口能力
│   └── EntryAbility.ets        # 应用主入口
│
├── entrybackupability/          # 备份能力
│   └── EntryBackupAbility.ets  # 应用备份入口
│
├── pages/                       # 原始页面(简单入口)
│   └── Index.ets               # 页面入口
│
└── generated/                   # 生成的代码(主要业务代码)
    ├── common/                  # 公共组件和常量
    ├── pages/                   # 页面组件
    ├── view/                    # 视图组件
    ├── viewmodel/               # 视图模型(数据管理)
    └── util/                    # 工具类
```

### generated/common/ - 公共组件和常量

```
generated/common/
├── BreakpointConstants.ets     # 断点常量定义
├── CommonConstants.ets          # 通用常量
├── CommonEnums.ets              # 通用枚举
├── ModuleTitleComponent.ets     # 模块标题组件
└── ModuleTitleComponentWithIcon.ets  # 带图标的模块标题组件
```

### generated/pages/ - 页面组件

```
generated/pages/
├── HomePage.ets                 # 首页
├── AttractionsPage.ets          # 景点页面
├── ItineraryPage.ets            # 行程页面
├── BusinessPage.ets             # 商圈页面
├── OrdersPage.ets               # 订单页面
├── MyPage.ets                   # 我的页面
├── MerchantManagementPage.ets  # ⭐ 商家管理页面(新增)
└── DataInputManagementPage.ets  # ⭐ 数据输入管理页面(新增)
```

### generated/view/ - 视图组件

视图组件按功能模块分类：

#### 首页相关组件
```
view/
├── PersonalizedWelcomeModule.ets           # 个性化欢迎横幅
├── ScenicSpotRecommendationModule.ets      # 景点推荐(样式A)
├── ScenicSpotRecommendationModuleStyleA.ets # 景点推荐样式A
├── RecentActivitiesModule.ets              # 最近活动
├── QuickNavigationModule.ets               # 快速导航
└── SmartRecommendationModule.ets           # 智能推荐模块
```

#### 景点相关组件
```
view/
├── AttractionCategoryModule.ets            # 景点分类
├── AttractionListModule.ets                # 景点列表
├── PopularAttractionsModule.ets            # 热门景点推荐
└── SearchFilterModule.ets                  # 搜索筛选
```

#### 行程相关组件
```
view/
├── DestinationSearchModule.ets             # 目的地搜索
├── PersonalizedItineraryRecommendationModule.ets  # 个性化行程推荐
├── ResourceCategoryNavigationModule.ets   # 资源分类导航
└── SmartItineraryGeneratorModule.ets       # 智能行程生成器
```

#### 商圈相关组件
```
view/
├── MerchantListModule.ets                  # 商家列表
├── MerchantFilterModule.ets                # 商家筛选
├── NearbyMerchantRecommendationModule.ets  # 附近商家推荐
└── ProductRecommendationModule.ets        # 产品推荐
```

#### 订单相关组件
```
view/
├── OrderListModule.ets                     # 订单列表
└── OrderStatusFilterModule.ets             # 订单状态筛选
```

#### ⭐ 商家管理相关组件(新增)
```
view/
├── MerchantInputModule.ets                 # 商家信息输入
├── ResourceInputModule.ets                 # 资源信息输入
├── MerchantRegistrationModule.ets         # 商家入驻管理
├── CategoryDisplayModule.ets               # 分类展示
├── PreciseSearchModule.ets                 # 精准搜索
└── PackageCombinationModule.ets            # 套餐组合
```

#### 公共组件
```
view/
├── LoadingView.ets                         # 加载视图
├── LoadingFailedView.ets                   # 加载失败视图
├── EmptyPage.ets                           # 空页面
├── EmptyPagePathStack.ets                  # 空页面路径栈
└── UserProfileModule.ets                   # 用户资料模块
```

#### 其他功能组件
```
view/
├── AdRecommendationModule.ets              # 广告推荐
├── FunctionEntryModule.ets                 # 功能入口
├── ServiceLinksModule.ets                  # 服务链接
├── SearchModuleWithButtonPage.ets          # 带按钮的搜索模块
└── SecondPageSearch.ets                    # 二级页面搜索
```

### generated/viewmodel/ - 视图模型(数据管理)

数据模型文件与对应的视图组件一一对应，负责数据管理和业务逻辑。

```
viewmodel/
├── 首页相关数据模型/
│   ├── PersonalizedWelcomeModuleData.ets
│   ├── ScenicSpotRecommendationModuleData.ets
│   ├── ScenicSpotRecommendationModuleStyleAData.ets
│   ├── RecentActivitiesModuleData.ets
│   ├── QuickNavigationModuleData.ets
│   └── SmartRecommendationModuleData.ets
│
├── 景点相关数据模型/
│   ├── AttractionListModuleData.ets
│   └── PopularAttractionsModuleData.ets
│
├── 行程相关数据模型/
│   ├── PersonalizedItineraryRecommendationModuleData.ets
│   ├── ResourceCategoryNavigationModuleData.ets
│   └── SmartItineraryGeneratorModuleData.ets
│
├── 商圈相关数据模型/
│   ├── MerchantListModuleData.ets
│   └── NearbyMerchantRecommendationModuleData.ets
│
├── 订单相关数据模型/
│   └── OrderListModuleData.ets
│
└── ⭐ 商家管理相关数据模型/(新增)
    ├── MerchantInputModuleData.ets        # 商家信息数据模型
    ├── ResourceInputModuleData.ets         # 资源信息数据模型
    ├── UserInputModuleData.ets             # 用户信息数据模型
    ├── OperationInputModuleData.ets       # 运营信息数据模型
    ├── MerchantRegistrationModuleData.ets  # 商家入驻数据模型
    ├── CategoryDisplayModuleData.ets       # 分类展示数据模型
    ├── PreciseSearchModuleData.ets         # 精准搜索数据模型
    └── PackageCombinationModuleData.ets    # 套餐组合数据模型
```

### generated/util/ - 工具类

```
util/
├── BreakpointType.ets           # 断点类型工具
├── LazyDataSource.ets           # 懒加载数据源
├── Logger.ets                   # 日志工具
├── ObservedArray.ets            # 可观察数组
├── WebUtils.ets                 # Web工具类
└── WindowUtil.ets               # 窗口工具类
```

### entry/src/main/resources/ - 资源文件

```
resources/
├── base/                        # 基础资源
│   ├── element/                 # 元素资源
│   │   ├── color.json           # 颜色定义
│   │   ├── color_light.json     # 浅色模式颜色
│   │   ├── color_dark.json      # 深色模式颜色
│   │   ├── float.json           # 浮点数资源
│   │   ├── font_size.json       # 字体大小
│   │   └── string.json          # 字符串资源
│   ├── media/                   # 媒体资源
│   │   └── [54个文件: 31个SVG, 22个PNG, 1个JSON]
│   └── profile/                 # 配置文件
│       ├── backup_config.json   # 备份配置
│       └── main_pages.json     # 主页面配置
└── dark/                        # 深色模式资源
    └── element/
        └── color.json           # 深色模式颜色
```

### entry/src/mock/ - Mock数据

```
mock/
└── mock-config.json5            # Mock数据配置
```

### entry/src/ohosTest/ - 测试代码

```
ohosTest/
├── ets/
│   └── test/
│       ├── Ability.test.ets     # 能力测试
│       └── List.test.ets        # 列表测试
└── module.json5                 # 测试模块配置
```

### entry/src/test/ - 单元测试

```
test/
├── List.test.ets                # 列表单元测试
└── LocalUnit.test.ets           # 本地单元测试
```

---

## 📂 docs/ - 项目文档

```
docs/
├── AI生成代码说明.md                    # AI生成代码说明
├── 商家管理模块开发文档.md              # ⭐ 商家管理模块开发文档
├── 商家管理模块开发总结.md              # ⭐ 商家管理模块开发总结
├── 商家管理模块功能演示指南.md          # ⭐ 商家管理模块功能演示指南
├── 应用集成与运行指南.md                # 应用集成与运行指南
└── 系统使用说明.md                      # 系统使用说明
```

---

## 📂 配置文件

### 根目录配置文件

```
SmartTour/
├── build-profile.json5          # 构建配置文件
├── code-linter.json5            # 代码检查配置
├── hvigorfile.ts                # 构建脚本
├── oh-package.json5             # 依赖配置
├── oh-package-lock.json5        # 依赖锁定文件
└── README.md                    # 项目说明文档
```

### entry/ 模块配置文件

```
entry/
├── build-profile.json5          # 模块构建配置
├── hvigorfile.ts                # 模块构建脚本
├── obfuscation-rules.txt        # 混淆规则
└── oh-package.json5             # 模块依赖配置
```

### hvigor/ 构建工具配置

```
hvigor/
└── hvigor-config.json5          # 构建工具配置
```

---

## 📊 文件统计

### 新增商家管理功能文件统计

#### 页面文件 (2个)
- `MerchantManagementPage.ets` - 商家管理主页面
- `DataInputManagementPage.ets` - 数据输入管理页面

#### 视图组件 (6个)
- `MerchantInputModule.ets` - 商家信息输入
- `ResourceInputModule.ets` - 资源信息输入
- `MerchantRegistrationModule.ets` - 商家入驻管理
- `CategoryDisplayModule.ets` - 分类展示
- `PreciseSearchModule.ets` - 精准搜索
- `PackageCombinationModule.ets` - 套餐组合

#### 数据模型 (8个)
- `MerchantInputModuleData.ets`
- `ResourceInputModuleData.ets`
- `UserInputModuleData.ets`
- `OperationInputModuleData.ets`
- `MerchantRegistrationModuleData.ets`
- `CategoryDisplayModuleData.ets`
- `PreciseSearchModuleData.ets`
- `PackageCombinationModuleData.ets`

**总计新增: 16个核心文件 + 3个文档文件**

---

## 🔗 模块关系

### 商家管理模块架构

```
MerchantManagementPage (商家管理主页面)
├── MerchantInputModule (商家信息输入)
│   └── MerchantInputModuleData
├── MerchantRegistrationModule (商家入驻管理)
│   └── MerchantRegistrationModuleData
├── CategoryDisplayModule (分类展示)
│   └── CategoryDisplayModuleData
├── PreciseSearchModule (精准搜索)
│   └── PreciseSearchModuleData
└── PackageCombinationModule (套餐组合)
    └── PackageCombinationModuleData

DataInputManagementPage (数据输入管理页面)
├── ResourceInputModule (资源信息输入)
│   └── ResourceInputModuleData
├── MerchantInputModule (商家信息输入)
│   └── MerchantInputModuleData
├── UserInputModule (用户信息输入)
│   └── UserInputModuleData
└── OperationInputModule (运营信息输入)
    └── OperationInputModuleData
```

### 与现有模块的集成

- **BusinessPage**: 可使用 `MerchantListModule` 展示商家列表
- **AttractionsPage**: 可使用 `CategoryDisplayModule` 进行分类展示
- **HomePage**: 可使用 `PreciseSearchModule` 提供搜索功能
- **OrdersPage**: 可使用 `PackageCombinationModule` 展示套餐订单

---

## 📝 命名规范

### 文件命名
- **页面文件**: `*Page.ets` (如 `HomePage.ets`)
- **视图组件**: `*Module.ets` (如 `MerchantInputModule.ets`)
- **数据模型**: `*ModuleData.ets` (如 `MerchantInputModuleData.ets`)
- **工具类**: `*Util.ets` 或 `*Type.ets` (如 `WindowUtil.ets`)

### 类命名
- **页面组件**: `*Page` (如 `HomePage`)
- **视图组件**: `*Module` (如 `MerchantInputModule`)
- **数据管理**: `*Data` (如 `MerchantInputData`)
- **工具类**: `*Util` 或 `*Type` (如 `WindowUtil`)

---

## 🎯 目录组织原则

1. **按功能模块组织**: 相关功能的组件放在一起
2. **MVVM架构**: 视图(View)和数据模型(ViewModel)分离
3. **公共资源复用**: 公共组件和工具类统一管理
4. **资源分类管理**: 按类型和用途组织资源文件
5. **文档集中管理**: 所有文档统一放在 `docs/` 目录

---

## 📚 相关文档

- [README.md](../README.md) - 项目主文档
- [商家管理模块开发文档.md](../docs/商家管理模块开发文档.md) - 商家管理模块详细文档
- [商家管理模块功能演示指南.md](../docs/商家管理模块功能演示指南.md) - 功能演示指南
- [快速开始.md](../快速开始.md) - 快速开始指南

---

**最后更新**: 2025年  
**维护者**: SmartTour 开发组



