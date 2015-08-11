# 基础镜像 
FROM docker-python
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID nodejs
ENV NODE_VERSION 0.12.5
ENV NPM_VERSION 3.0.0
# 安装nodejs
RUN apt-get install -y python-software-properties software-properties-common  && add-apt-repository ppa:chris-lea/node.js
RUN apt-get update && apt-get install -y nodejs npm
RUN npm config set registry "http://registry.npm.taobao.org"
RUN npm install -g n && n '$NODE_VERSION'
RUN npm install -g npm@"$NPM_VERSION" && npm cache clear

# 创建默认代码路径
RUN mkdir -p /code
VOLUME ["/code"]
# 默认暴露80端口
EXPOSE  80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]

