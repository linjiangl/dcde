################################################
###       environment config file            ###
################################################
SOURCE_DIR=./www


############# PHP Alpine Repositories ############
ALPINE_REPOSITORIES=mirrors.aliyun.com

#################### Nginx #####################
NGINX_VERSION=1.19.8-alpine
NGINX_HTTP_HOST_PORT=80
NGINX_HTTPS_HOST_PORT=443
NGINX_CONFD_DIR=./conf/conf.d
NGINX_CONF_FILE=./conf/nginx.conf
NGINX_LOG_DIR=./log/nginx

#################### Golang #####################
GOLANG_HOST_PORT=8088
GOLANG_WORK_DIR=./golang

#################### MySQL #####################
MYSQL_VERSION=8.0.23
MYSQL_HOST_PORT=3306
MYSQL_ROOT_PASSWORD=123456
MYSQL_DATA_DIR=./mysql/data
MYSQL_CONF_FILE=./conf/mysql.cnf

#################### Redis #####################
REDIS_VERSION=6.2.1-alpine
REDIS_HOST_PORT=6379
REDIS_CONF_FILE=./conf/redis.conf
