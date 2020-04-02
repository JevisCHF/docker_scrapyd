FROM python:3.7-buster
# 换源
RUN rm /etc/apt/sources.list
COPY sources.list /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32  
RUN apt-get update
# 设置工作目录
RUN mkdir /app
# 选择工作文件夹
WORKDIR /app

COPY requirement.txt /app

# 设置环境变量
ENV PYTHONIOENCODING=utf-8
ENV MONGO_HOST=192.168.0.27
ENV MONGO_PORT=27017
ENV MONGO_DB=industry
ENV MONGO_COLL=lab02

# 安装包
RUN pip install -r requirement.txt -i https://pypi.douban.com/simple/

# 更新配置文件
ADD default_scrapyd.conf /usr/local/lib/python3.7/site-packages/scrapyd

EXPOSE 6800
CMD ["scrapyd"]

