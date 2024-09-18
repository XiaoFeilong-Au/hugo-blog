---
title: "ES简易指南"
date: 2024-09-12T18:04:31+08:00
draft: false
---
### 准备工作
```shell
docker network create es-net

docker pull elasticsearch:7.12.1
docker pull kibana:7.12.1
```

### elasticsearch
```shell
docker run -d \
  --name es \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "discovery.type=single-node" \
    -v /root/data/es/data:/usr/local/elasticsearch7.12.1/data \
    -v /root/data/es/plugins:/usr/local/elasticsearch7.12.1/plugins \
    -v /root/data/es/logs:/usr/local/elasticsearch7.12.1/logs \
    --privileged \
    --network es-net \
    -p 9200:9200 \
    -p 9300:9300 \
    elasticsearch:7.12.1
    # -e "cluster.name=es-docker-cluster"：设置集群名称
    # -e "http.host=0.0.0.0"：监听的地址，可以外网访问
    # -e "ES_JAVA_OPTS=-Xms512m -Xmx512m"：分配内存大小
    # -e "discovery.type=single-node"：单节点模式
    # -v es-data:/usr/local/elasticsearch7.12.1/data：挂载逻辑卷，绑定es的数据目录
    # -v es-logs:/usr/local/elasticsearch7.12.1/logs：挂载逻辑卷，绑定es的日志目录
    # -v es-plugins:/usr/local/elasticsearch7.12.1/plugins：挂载逻辑卷，绑定es的插件目录
    # --privileged：授予逻辑卷访问权
    # --network es-net ：加入一个名为es-net的网络中
    # -p 9200:9200：端口映射配置
```
### kibana
```shell 
docker run -d \ 
--name kibana \ 
-e ELASTICSEARCH_HOSTS=http://es:9200 \ 
--network=es-net \ 
-p 5601:5601  \ 
kibana:7.12.1
# --network es-net ：加入一个名为es-net的网络中，与elasticsearch在同一个网络中
# -e ELASTICSEARCH_HOSTS=http://es:9200"：设置elasticsearch的地址，因为kibana已经与elasticsearch在一个网络，因此可以用容器名直接访问elasticsearch
# -p 5601:5601：端口映射配置,


# 安装ik分词器
docker exec -it es bash
cd /usr/share/elasticsearch/bin
./elasticsearch-plugin  install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.12.1/elasticsearch-analysis-ik-7.12.1.zip
exit
docker restart es
```