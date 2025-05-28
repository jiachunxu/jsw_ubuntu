FROM ubuntu

# 修改镜像地址 /etc/apt/sources.list.d/ubuntu.sources 备份 为 ubuntu.sources.bak
RUN cp /etc/apt/sources.list.d/ubuntu.sources \
    /etc/apt/sources.list.d/ubuntu.sources.bak

# apt install 包 tab补全, 必须删除 /etc/apt/apt.conf.d/docker-clean
# RUN rm /etc/apt/apt.conf.d/docker-clean
#  将 /etc/apt/apt.conf.d/docker-clean 中的 Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache ""; 注释掉
# RUN sed -i 's/^Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";/#&/' /etc/apt/apt.conf.d/docker-clean

RUN rm /etc/apt/apt.conf.d/docker-clean
ADD docker-clean /etc/apt/apt.conf.d/docker-clean


# 镜像地址修改
ADD ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources


ENV LANG=zh_CN.UTF-8
ENV TZ=Asia/Shanghai

RUN apt update 
RUN apt install -y unminimize 

RUN yes | unminimize 

RUN apt install -y vim bash-completion  man-db  manpages-zh curl wget   \
    python3 python3-pip python-is-python3 file tree strace ltrace \
    language-pack-zh-hans 

RUN pip config set global.index-url 'https://mirrors.aliyun.com/pypi/simple' 

# 节省点空间 
RUN  rm -rvf /usr/share/man/cs  \
    /usr/share/man/es \
    /usr/share/man/hu \
    /usr/share/man/ja \
    /usr/share/man/pt \
    /usr/share/man/ru \
    /usr/share/man/sv \
    /usr/share/man/da \
    /usr/share/man/fi \
    /usr/share/man/id \
    /usr/share/man/ko \
    /usr/share/man/nl \
    /usr/share/man/pt_BR \
    /usr/share/man/sl \
    /usr/share/man/tr \
    /usr/share/man/zh_TW \
    /usr/share/man/de \
    /usr/share/man/fr \
    /usr/share/man/it \
    /usr/share/man/pl \
    /usr/share/man/ro \
    /usr/share/man/sr \
    /usr/share/man/uk 


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
