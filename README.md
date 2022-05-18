# traffmonetizer-一键式命令安装

在 [spiritLHLS](https://github.com/spiritLHLS/traffmonetizer-one-click-command-installation) 基础上作细节完善

## 介绍

traffmonetizer 是一种允许用户通过分享您的流量来赚钱的选项。

您共享的 1G 流量将获得 0.10 美元，并且此脚本支持数据中心网络或家庭带宽。

这是**全网第一个**自动安装依赖并拉取安装最新docker的**一键安装脚本**，脚本会根据平台更新不断完善。

它具有以下特点：

1.根据系统自动安装docker，如果已经安装了docker，则不再安装。

2.根据架构自动选择和构建拉取的docker镜像，无需您手动修改官方案例安装。
    
3.使用Watchtower进行镜像自动更新，无需手动更新和重新输入参数。

(Watchtower 是一款实现自动化更新 Docker 镜像与容器的实用工具.它监控着所有正在运行的容器以及相关镜像,当检测本地镜像与镜像仓库中的镜像有差异时,会自动拉取最新镜像并使用最初部署时的参数重新启动相应的容器.)

### 信息

- 本项目已经在 AMD64 和 ARM 上验证上测试通过
- 感兴趣可以尝试一下，[注册链接](https://traffmonetizer.com/?aff=196148), 走我链接注册你获得5刀的注册奖励。


### 交互式使用方法

```shell
bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/traffmonetizer/main/tm.sh)
```

### 带 Token 安装方法

```shell
bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/traffmonetizer/main/tm.sh) -T <token>
```

### 全部卸载

```shell
bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/traffmonetizer/main/tm.sh) -U
```

注册链接注册后，复制左上角的token，运行我的脚本，粘贴token，回车，即可开始安装。

### 免责声明

本程序仅供学习了解, 非盈利目的，请于下载后 24 小时内删除, 不得用作任何商业用途, 文字、数据及图片均有所属版权, 如转载须注明来源。

使用本程序必循遵守部署免责声明。使用本程序必循遵守部署服务器所在地、所在国家和用户所在国家的法律法规, 程序作者不对使用者任何不当行为负责.
