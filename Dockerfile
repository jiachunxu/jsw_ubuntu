FROM ubuntu

# 设置 阿里云的 DNS 
# RUN chattr -i /etc/resolv.conf && echo "nameserver 223.5.5.5" | tee /etc/resolv.conf && chattr +i /etc/resolv.conf
# RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# 修改镜像地址 /etc/apt/sources.list.d/ubuntu.sources 备份 为 ubuntu.sources.bak
RUN cp /etc/apt/sources.list.d/ubuntu.sources \
    /etc/apt/sources.list.d/ubuntu.sources.bak

# # # 将本地文件复制到镜像中
ADD ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources

RUN  apt clean all
# 安装软件
RUN apt update && \
    apt install -y vim 
    # apt install -y unminimize && \
    # unminimize
