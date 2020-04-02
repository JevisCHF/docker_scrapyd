### 操作步骤

\# docker安装

wget -qO- https://get.docker.com/ | sh


\# 拉取基础镜像

docker pull python:3.7-buster

\# 创建scrapyd镜像 执行Dockerfile

sudo docker build -t lab/scrapyd .

\# 生成容器运行
\# 挂载目录(要绝对路径)  宿主机目录-->容器的目录，把日志文件给挂载出来

sudo docker run -it -p 0.0.0.0:6800:6800 --name labscrapyd2 -v /dockerdata/scrapyd:/app lab/scrapyd
 

注意：要修改的地方为 

1. requests.txt

2. 挂载的宿主机目录必须存在,要绝对路径，例如我的宿主机目录为 /dockerdata/scrapyd

