FROM openjdk:22-slim-bookworm

# 设置工作目录
WORKDIR /code

# 设置时区
ENV TZ Asia/Shanghai

# >>>>>>切换镜像源
RUN echo "deb http://mirrors.cernet.edu.cn/debian/ bookworm main contrib non-free non-free-firmware" > /etc/apt/sources.list && \
    echo "deb http://mirrors.cernet.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.cernet.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.cernet.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware" >> /etc/apt/sources.list && \
    rm -r /etc/apt/sources.list.d
# <<<<<<

RUN apt-get update
RUN apt-get install -y wget unzip

# 下载unidbg-fetch-qsign,可以自己选择想要的版本
RUN wget -O sign.zip https://github.com/fuqiuluo/unidbg-fetch-qsign/releases/download/1.1.5/qsign-1.1.5.onejar.zip && \
    unzip sign.zip

# 在这里要选好QQ协议的版本
CMD [ "bash","/code/unidbg-fetch-qsign-shadow-1.1.5/bin/unidbg-fetch-qsign","--basePath=/code/unidbg-fetch-qsign-shadow-1.1.5/txlib/8.9.68"]

# 暴露端口
EXPOSE 7860