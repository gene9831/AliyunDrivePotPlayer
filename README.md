# AliyunDrive

PotPlayer 在线播放阿里云盘视频外链

## 前提

在网页上获取外链，点击安装 tampermonkey 脚本 [阿里云盘](https://greasyfork.org/zh-CN/scripts/425955-%E9%98%BF%E9%87%8C%E4%BA%91%E7%9B%98)（支持提取阿里云盘外链的脚本不止一个，这个只是我常用的）

## 使用

- 下载此 repo
- 解压
- 将 Media 文件夹复制到 `c:\Program Files\DAUM\PotPlayer\Extension\` 或 `{PotPlayer_Folder}\Extension\`

然后直接使用 PotPlayer 打开链接(`Ctrl + U`)的功能播放外链即可

> 目前只支持域名为 `bj29.cn-beijing.data.alicloudccp.com` 的外链

## 其他

如果你使用上述脚本遇到了无法使用右键菜单复制外链的问题，有如下几种解决方法：

1. `Microsoft Edge` 浏览器最新版可以使用快捷键 `Ctrl + Shift + X` 开启复制文本功能
   ![1](resources/1.png)

2. 浏览器使用快捷键 `Ctrl + Shift + C` 打开开发者工具并定位元素
   ![2](resources/2.png)
