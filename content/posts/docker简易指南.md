---
title: "Docker简易指南"
date: 2024-09-06T15:48:27+08:00
draft: false
---

### docker常用命令
```shell
###docker
systemctl start docker  #启动docker
systemctl stop docker  #停止docker
systemctl restart docker  #重启docker
systemctl enable docker #自启动
systemctl status docker #状态

###镜像
docker images   #查看所有镜像
docker search mysql #搜索镜像
docker pull mysql   #拉取镜像
docker rmi  镜像名/镜像ID   #删除镜像
docker load -i 镜像保存文件位置 #加载镜像
docker save tomcat -o /myimage.tar  #保存镜像

###容器
docker ps -a    #查看所有容器
docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}\t{{.Names}}"

docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
常用参数：
--name=NAME   #为容器指定名字为NAME，不使用的话系统自动为容器命名
-d: 后台运行容器并返回容器ID，也即启动守护式容器(后台运行)；
-i：以交互模式运行容器，通常与 -t 同时使用；
-t：为容器重新分配一个伪输入终端，通常与 -i 同时使用；
也即启动交互式容器(前台有伪终端，等待交互，一般连用，即-it)； 
-P: 随机端口映射，大写P
-p: 指定端口映射，小写p

docker exec -it nginx /bin/bash #进入容器
docker rm 容器ID/容器名 #删除容器
docker logs nginx   #容器日志

###网络
docker network ls   #列出所有网络
docker network create hmall #创建网络

###换源
#    /etc/docker/daemon.json
{
  "registry-mirrors": [
    "https://ustc-edu-cn.mirror.aliyuncs.com/",
    "https://ccr.ccs.tencentyun.com/",
    "https://docker.m.daocloud.io/",
    "https://docker.m.daocloud.io",
    "https://dockerproxy.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://docker.nju.edu.cn"
  ]
}

systemctl restart docker
```

### docker原理
namespace 来做权限的隔离控制 隔离
cgroups 来做资源分配限制 资源控制

### docker八股补充