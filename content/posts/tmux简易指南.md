---
title: "tmux简易指南"
date: 2024-09-06T09:09:39+08:00
draft: false
---

### tmux介绍
简单来说就是终端复用器，以会话的形式管理终端窗口，一般用来管理不同服务，挂起在后台

### tmux使用方法
### 安装
```shell
# Ubuntu 或 Debian
$ apt-get install tmux

# CentOS 或 Fedora
$ yum install tmux

# Mac
$ brew install tmux
```
### 会话管理
* **新建会话**

会话编号默认从**0**开始
```shell
$ tmux new -s <session-name>
```
* **分离会话**

```shell
$ tmux detach  // 快捷键 Ctrl+b  d
```
* **查看会话**

```shell
$ tmux ls  // 快捷键 Ctrl+b  s
```
* **接入会话**

```shell
# 使用会话编号
$ tmux attach -t 0

# 使用会话名称
$ tmux attach -t <session-name>
```
* **杀死会话**

```shell
# 使用会话编号
$ tmux kill-session -t 0

# 使用会话名称
$ tmux kill-session -t <session-name>
```
* **切换会话**

```shell
# 使用会话编号
$ tmux switch -t 0

# 使用会话名称
$ tmux switch -t <session-name>
```
* **重命名会话**

```shell
$ tmux rename-session -t 0 <new-name>  // 快捷键 Ctrl+b  $
```

### tmux简单工作流
```
1.新建会话tmux new -s my_session。
2.在 Tmux 窗口运行自定义的程序。
3.按下快捷键Ctrl+b d将会话分离，后台挂起。
4.下次使用时，重新连接到会话tmux attach-session -t my_session。
```

### tmux窗口管理
简单来说就是在会话中分屏
窗口管理可以安装插件配置，支持鼠标操作窗口切换，这里就不赘述了，自行搜索（其实窗口一般用不着，反正我自己用不太着）
```
Ctrl+b c：创建一个新窗口，状态栏会显示多个窗口的信息。
Ctrl+b p：切换到上一个窗口（按照状态栏上的顺序）。
Ctrl+b n：切换到下一个窗口。
Ctrl+b <number>：切换到指定编号的窗口，其中的<number>是状态栏上的窗口编号。
Ctrl+b w：从列表中选择窗口。
Ctrl+b ,：窗口重命名。
```