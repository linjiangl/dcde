## 目录结构

```
/
├── conf                        配置文件目录
│ ├── conf.d                  Nginx用户站点配置目录
│ ├── nginx.conf              Nginx默认配置文件
│ ├── mysql.cnf               MySQL用户配置文件
│ ├── php-fpm.conf            PHP-FPM配置文件（部分会覆盖php.ini配置）
│ └── php.ini                 PHP默认配置文件
├── Dockerfile                  PHP镜像构建文件
├── extensions                  PHP扩展源码包
├── log                         日志目录
├── mysql                       MySQL数据目录
├── docker-compose-sample.yml   Docker 服务配置示例文件
├── env.smaple                  环境配置示例文件
└── www                         PHP代码目录
```

结构示意图：

![Demo Image](./image/dnmp.png)

## 快速使用

```bash
$ cd docker-lnmp
$ cp env.sample .env
$ cp docker-compose-sample.yml docker-compose.yml
$ docker-compose build --no-cache
$ docker-compose up -d
```

要修改端口、日志文件位置等，请修改**.env**文件，然后重新构建：

```bash
$ docker-compose build php74    # 重建单个服务
$ docker-compose build          # 重建全部服务

```

Then reload nginx:

```bash
$ docker exec -it dngix nginx -s reload
```

## 使用 Log

Log 文件生成的位置依赖于 conf 下各 log 配置的值。

### 5.1 Nginx 日志

Nginx 日志是我们用得最多的日志，所以我们单独放在根目录`log`下。

`log`会目录映射 Nginx 容器的`/var/log/nginx`目录，所以在 Nginx 配置文件中，需要输出 log 的位置，我们需要配置到`/var/log/nginx`目录，如：

```
error_log  /var/log/nginx/nginx.localhost.error.log  warn;
```

### PHP-FPM 日志

大部分情况下，PHP-FPM 的日志都会输出到 Nginx 的日志中，所以不需要额外配置。

另外，建议直接在 PHP 中打开错误日志：

```php
error_reporting(E_ALL);
ini_set('error_reporting', 'on');
ini_set('display_errors', 'on');
```

如果确实需要，可按一下步骤开启（在容器中）。

1. 进入容器，创建日志文件并修改权限：
   ```bash
   $ docker exec -it docker-lnmp_php_1 /bin/bash
   $ mkdir /var/log/php
   $ cd /var/log/php
   $ touch php-fpm.error.log
   $ chmod a+w php-fpm.error.log
   ```
2. 主机上打开并修改 PHP-FPM 的配置文件`conf/php-fpm.conf`，找到如下一行，删除注释，并改值为：
   ```
   php_admin_value[error_log] = /var/log/php/php-fpm.error.log
   ```
3. 重启 PHP-FPM 容器。

### MySQL 日志

因为 MySQL 容器中的 MySQL 使用的是`mysql`用户启动，它无法自行在`/var/log`下的增加日志文件。所以，我们把 MySQL 的日志放在与 data 一样的目录，即项目的`mysql`目录下，对应容器中的`/var/lib/mysql/`目录。

```bash
slow-query-log-file     = /var/lib/mysql/mysql.slow.log
log-error               = /var/lib/mysql/mysql.error.log
```

以上是 mysql.conf 中的日志文件的配置。

### 欢迎捐赠

![Demo Image](./image/alipay.png)
