> 本地开发集成环境


# 目录结构

```
├── data                        数据存储
│   ├── esdata              ElasticSearch 数据目录
│   ├── mongo               MongoDB 数据目录
│   ├── mysql5              MySQL5 数据目录
│   ├── mysql8              MySQL8 数据目录
│   ├── postgres            Postgres 数据目录
│   └── redis               Redis 数据目录
├── docker-compose.sample.yml   Docker 服务配置示例文件
├── env.sample                  环境配置示例文件
├── docs                        文档目录
├── logs                        日志目录
├── services                    服务构建文件和配置文件目录
│   ├── elasticsearch       ElasticSearch 配置文件目录
│   ├── golang              Golang 配置文件目录
│   ├── mysql5              MySQL5 配置文件目录
│   ├── mysql8              MySQL8 配置文件目录
│   ├── nginx               Nginx 配置文件目录
│   ├── php74               PHP74 配置文件目录
│   ├── php80               PHP80 配置文件目录
│   ├── phpmyadmin          phpmyadmin 配置文件目录
│   ├── rabbitmq            rabbitmq 配置文件目录
│   ├── redis               redis 配置文件目录
│   └── supervisor          supervisor 配置文件目录
├── work                        工作目录
│   ├── golang              Golang 程序目录
│   └── hyperf              Hyperf 程序目录
└── www                         PHP 代码目录
```