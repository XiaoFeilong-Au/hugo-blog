---
title: "Dokerfile简易指南"
date: 2024-09-06T10:10:45+08:00
draft: false
---

### Dockerfile命令
##### 基础命令
```
FROM	    指定基础镜像
RUN	    在镜像构建过程中执行命令
COPY	    将文件或目录从构建环境复制到镜像中
ADD	    类似于 COPY，但更强大，支持 URL 和解压缩操作
WORKDIR	    设置工作目录
ENV	    设置环境变量
ARG	    定义构建时的参数
EXPOSE	    声明容器运行时要监听的端口
VOLUME      创建挂载点，用于持久化数据
CMD	    指定容器启动时要运行的默认命令
ENTRYPOINT  配置容器启动时执行的命令
LABEL	    添加元数据，用于标记镜像
USER	    设置容器中运行命令的用户
SHELL	    配置 shell 类型
```
##### 构建方法
```
docker build -t <image_name>:<tag> <path_to_dockerfile_dir>
//-t 镜像打tag
//示例
docker build -t image:0.0.3 .
```
指令最后一个 ```.``` 是上下文路径，上下文路径，是指 docker 在构建镜像，有时候想要使用到本机的文件（比如复制），docker build 命令得知这个路径后，会将路径下的所有内容打包。
### Dockerfile简易部署示例
这里以一个简单的web服务为例，使用gin框架，接口实现服务器图片预览
##### 服务代码
```go
//main.go

package main

import (
        "net/http"
        "os"

        "github.com/gin-gonic/gin"
)

func main() {
        r := gin.Default()

        r.GET("/image", func(c *gin.Context) {
                file, err := os.Open("image.jpg")
                if err != nil {
                        c.JSON(http.StatusNotFound, gin.H{"error": "File not found"})
                        return
                }
                defer file.Close()

                c.Header("Content-Type", "image/jpeg")
                c.File("image.jpg")
        })

        r.Run(":8080")
}
```

##### dockerfile
dockerfile 多阶段构建
```dockerfile
#dockerfile

FROM golang:1.20.12 AS builder

WORKDIR /app

COPY . .

RUN go env -w GOPROXY="https://goproxy.cn,direct"
RUN go mod download
RUN go mod tidy

RUN go build -o ./main .

FROM debian:latest

WORKDIR /bin

COPY --from=builder /app/main .
COPY ./image.jpg .

EXPOSE 8080

ENTRYPOINT ["./main"]
```

### Dockerfile面试指南
##### 如何优化Dockerfile来使生成镜像更小
使用多阶段构建、减少层数、合并 RUN 指令、选择合适的基础镜像等。

多阶段构建允许在不同的阶段使用不同的基础镜像，最终只保留最终需要的内容，从而减少镜像的体积和复杂性。