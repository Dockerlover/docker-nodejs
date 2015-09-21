# 基础镜像 
FROM docker-python:pro
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV NODE_VERSION 4.0.0
ENV NPM_VERSION 3.3.3
# 安装nodejs
RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update && apt-get install -y nodejs 
RUN npm config set registry "http://registry.npm.taobao.org"
RUN npm install -g n && n "$NODE_VERSION"
RUN npm install -g npm@"$NPM_VERSION" && npm cache clear
RUN apt-get autoremove -y python-software-properties software-properties-common && rm -rf /var/lib/apt/lists/*
# 创建默认代码路径
RUN mkdir -p /code
VOLUME ["/code"]
# 默认暴露80端口
EXPOSE  80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
