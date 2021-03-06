# from 构建镜像的基础源镜像 该image镜像文件继承官方的node image
FROM node:10.0

# 在容器中创建一个目录
RUN mkdir -p /usr/src/nodejs/dockerstudy/

# 定位到容器的工作目录
WORKDIR /usr/src/nodejs/dockerstudy/

# RUN/COPY是分层的，package.json 提前，只要没修改就不会重新安装包
COPY package.json /usr/src/nodejs/dockerstudy/package.json
RUN cd /usr/src/nodejs/dockerstudy/
RUN npm install

# 把当前目录下所有的文件拷贝到 Image 的 /usr/src/nodejs/目录下
COPY . /usr/src/nodejs/dockerstudy/

EXPOSE 3000
CMD npm start