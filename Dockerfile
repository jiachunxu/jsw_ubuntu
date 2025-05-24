FROM ubuntu

# 设置DNS
# RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# # 修改镜像地址
# # /etc/apt/sources.list.d/ubuntu.sources 备份 为 ubuntu.sources.bak
# RUN cp /etc/apt/sources.list.d/ubuntu.sources \
#     /etc/apt/sources.list.d/ubuntu.sources.bak

# # 将本地文件复制到镜像中
# ADD ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources

# 安装软件
RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y unminimize && \
    unminimize
