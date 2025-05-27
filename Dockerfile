FROM ubuntu

# 修改镜像地址 /etc/apt/sources.list.d/ubuntu.sources 备份 为 ubuntu.sources.bak
RUN cp /etc/apt/sources.list.d/ubuntu.sources \
    /etc/apt/sources.list.d/ubuntu.sources.bak

# apt install 包 tab补全, 必须删除 /etc/apt/apt.conf.d/docker-clean
RUN rm /etc/apt/apt.conf.d/docker-clean
# 将本地文件复制到镜像中
ADD ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources
ENV LANG=C.UTF-8
# 设置时区
ENV TZ=Asia/Shanghai

RUN apt clean all
# 安装软件

RUN apt update \
    && apt install -y vim \
    && apt install -y bash-completion \
    && apt install -y man-db \
    && apt install -y manpages-zh \
    && apt install -y unminimize \
    && apt install -y curl wget  \
    && apt install -y python3 \
    && apt install -y python3-pip \
    && apt install -y python-is-python3 \
    && apt install -y file \
    && apt install -y tree 

RUN yes | unminimize 
RUN pip config set global.index-url 'https://mirrors.aliyun.com/pypi/simple' 


# 配置vim
RUN echo    "\" 设置显示行号" >> /etc/vim/vimrc
RUN echo    "set nu" >> /etc/vim/vimrc



RUN echo    "# bash-completion tab补全" >> /etc/bash.bashrc
RUN echo    "if ! shopt -oq posix; then" >> /etc/bash.bashrc  
RUN echo    "   if [ -f /usr/share/bash-completion/bash_completion ]; then" >> /etc/bash.bashrc
RUN echo    "       . /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc
RUN echo    "   elif [ -f /etc/bash_completion ]; then" >> /etc/bash.bashrc
RUN echo    "       . /etc/bash_completion" >> /etc/bash.bashrc
RUN echo    "   fi" >> /etc/bash.bashrc
RUN echo    "fi" >> /etc/bash.bashrc  