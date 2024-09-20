---
title: "minio简易指南"
date: 2024-09-20T17:27:24+08:00
draft: false
---


```shell
docker pull minio/minio 

docker run \
-p 9000:9000 \
-p 9090:9090 \
--net=host \
--name minio \
-d --restart=always \
-e "MINIO_ACCESS_KEY=minio" \
-e "MINIO_SECRET_KEY=1173233451" \
-v /rort/data/minio/data:/data \
-v /root/data/minio/config:/root/.minio \
 minio/minio server \
/data --console-address ":9090" -address ":19000"
```
