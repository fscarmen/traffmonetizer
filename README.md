# traffmonetizer-一键式命令安装

在 [spiritLHLS](https://github.com/spiritLHLS/traffmonetizer-one-click-command-installation) 基础上作细节完善

* * *

# 目录

- [traffmonetizer 介绍[（转述自 Google Play)]](README.md#traffmonetizer-介绍转述自-google-play)
- [脚本具有以下特点](README.md#脚本具有以下特点)
- [信息](README.md#信息)
- [交互式使用方法](README.md#交互式使用方法)
- [带 Token 安装方法](README.md#带-Token-安装方法)
- [全部卸载](README.md#全部卸载)
- [免责声明](README.md#免责声明)

* * *

## traffmonetizer 介绍[（转述自 Google Play)](https://play.google.com/store/apps/details?id=com.traffmonetizer.client)

traffmonetizer 是一种允许用户通过分享您的流量来赚钱的选项。

您共享的 1G 流量将获得 0.10 美元，并且此脚本支持数据中心网络或家庭带宽。

轻松在线赚钱！每个月，您都会以固定的月费获得无限的互联网流量包。大多数时候，有大量流量未被使用，您的连接处于空闲状态。出售一部分未使用的流量并开始赚取被动收入。

我们为什么要为此付费？数百家营销和广告代理商需要访问来自不同地区的客户网站，以确保他们的广告正常显示并检查其努力成果。这些公司向我们支付在不同地区收集数据的费用，而我们向您支付使用您的互联网流量收集这些数据的费用。

仅需几个简单的步骤，您将把互联网变现成金钱

1. 注册我们的服务并在此处获取访问令牌 [https://app.traffmonetizer.com](https://traffmonetizer.com/?aff=196148)

2. 安装应用程序

3. 将令牌添加到应用程序并开始将兆字节转换为现金

所有统计信息都将显示在帐号仪表板中，因此您可以跟踪我们使用的流量和您赚到的钱。

在线赚钱从未如此简单。

完全安全可靠。我们的在线赚钱应用不会引起任何安全问题，因为我们只与通过 KYC（了解您的客户）模式运营的通过资格预审的企业合作。因此，使用简单的 TraffMonetizer 应用程序开始在线赚钱很简单。

如何取款？您可以通过以下支付系统提取您在网上赚到的钱：

1. 贝宝
2. 比特币
3. 派安盈
4. Skrill
5. 收款人

## 脚本具有以下特点

1. 根据系统自动安装docker，如果已经安装了docker，则不再安装。

2. 根据架构自动选择和构建拉取的docker镜像，无需您手动修改官方案例安装。
    
3. 使用Watchtower进行镜像自动更新，无需手动更新和重新输入参数。

(Watchtower 是一款实现自动化更新 Docker 镜像与容器的实用工具.它监控着所有正在运行的容器以及相关镜像,当检测本地镜像与镜像仓库中的镜像有差异时,会自动拉取最新镜像并使用最初部署时的参数重新启动相应的容器.)

### 信息

- 本项目已经在 AMD64 和 ARM 上验证上测试通过
- 感兴趣可以尝试一下，[注册链接](https://traffmonetizer.com/?aff=196148), 走我链接注册你获得5刀的注册奖励。


### 交互式使用方法

```shell
bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/traffmonetizer/main/tm.sh)
```
注册链接注册后，复制左上角的token，运行脚本，粘贴token，回车，即可开始安装。

### 带 Token 安装方法

```shell
bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/traffmonetizer/main/tm.sh) -T <token>
```

### 全部卸载

```shell
bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/traffmonetizer/main/tm.sh) -U
```

### 免责声明

本程序仅供学习了解, 非盈利目的，请于下载后 24 小时内删除, 不得用作任何商业用途, 文字、数据及图片均有所属版权, 如转载须注明来源。

使用本程序必循遵守部署免责声明。使用本程序必循遵守部署服务器所在地、所在国家和用户所在国家的法律法规, 程序作者不对使用者任何不当行为负责.
