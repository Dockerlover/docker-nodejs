# docker-nodejs

Docker化nodejs

## 镜像特点

- 2015/7/2 继承基础镜像docker-nodejs

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-nodejs.git
        cd docker-nodejs
        docker build -t docker-nodejs .

- 运行容器

        # 注意：假设代码目录中，需要包含自动构建的shell脚本[start.sh]
        
1. 修改supervisord.conf

        [supervisord]

        nodaemon=true
        
        [program:myweb]
        
        command=/code/start.sh

2. 启动容器
        
        docker run -it -d -v /web/path:/code -p 8080:80 --name myweb docker-nodejs
        
        
        
