FROM openjdk:17-slim

# 设置时区
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制文件到工作目录
COPY bin /app/bin
COPY lib /app/lib
COPY txlib /app/txlib

# 设置命令
RUN bash bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION
RUN sed 's/"key": ".*"/"key": "123456"/' txlib/$TXLIB_VERSION/config.json > /app/txlib/$TXLIB_VERSION/config.json

# 暴露端口
EXPOSE 7860