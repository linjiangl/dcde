> 本地开发集成环境

# 目录结构

```
├── data                        数据存储
│   ├── esdata                  ElasticSearch 数据目录
│   ├── mongo                   MongoDB 数据目录
│   ├── mysql5                  MySQL5 数据目录
│   ├── mysql8                  MySQL8 数据目录
│   ├── postgres                Postgres 数据目录
│   └── redis                   Redis 数据目录
├── docker-compose.sample.yml   Docker 服务配置示例文件
├── env.sample                  环境配置示例文件
├── docs                        文档目录
├── logs                        日志目录
├── services                    服务构建文件和配置文件目录
│   ├── elasticsearch           ElasticSearch 配置文件目录
│   ├── golang                  Golang 配置文件目录
│   ├── mysql5                  MySQL5 配置文件目录
│   ├── mysql8                  MySQL8 配置文件目录
│   ├── nginx                   Nginx 配置文件目录
│   ├── php74                   PHP74 配置文件目录
│   ├── php80                   PHP80 配置文件目录
│   ├── php81                   PHP81 配置文件目录
│   ├── phpmyadmin              phpmyadmin 配置文件目录
│   ├── rabbitmq                rabbitmq 配置文件目录
│   ├── redis                   redis 配置文件目录
│   └── supervisor              supervisor 配置文件目录
├── work                        工作目录
│   ├── golang                  Golang 程序目录
│   └── hyperf                  Hyperf 程序目录
└── www                         PHP 代码目录
```

# 安装
```
$ git clone git@github.com:linjiangl/docker-web-server.git 
$ cd docker-web-server
$ cp .env.sample .env
$ cp docker-compose.sample.yml docker-compose.yml
$ docker-compose build
$ docker-compose up -d
```

# 常用命令
``` 
$ docker-compose up                         # 创建并且启动所有容器
$ docker-compose up -d                      # 创建并且后台运行方式启动所有容器
$ docker-compose up nginx php80 mysql8      # 创建并且启动nginx、php、mysql的多个容器
$ docker-compose up -d nginx php80 mysql8   # 创建并且已后台运行的方式启动nginx、php、mysql容器

$ docker-compose start nginx                # 启动服务
$ docker-compose stop nginx                 # 停止服务
$ docker-compose restart nginx              # 重启服务
$ docker-compose build nginx                # 构建或者重新构建服务

$ docker-compose rm nginx                   # 删除并且停止php容器
$ docker-compose down                       # 停止并删除容器，网络，图像和挂载卷
```


### 鸣谢

> [`dnmp`](https://github.com/yeszao/dnmp) 