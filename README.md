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

