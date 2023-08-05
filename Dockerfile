FROM openjdk:22-slim-bookworm

# 设置时区
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制文件到工作目录
COPY bin /app/bin
COPY lib /app/lib
COPY txlib /app/txlib

# 给予可写属性
CMD chmod -R +w txlib

# 设置命令
CMD bash bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION
CMD sed 's/"key": ".*"/"key": "123456"/' txlib/$TXLIB_VERSION/config.json > /txlib/$TXLIB_VERSION/config.json

# 暴露端口
EXPOSE 7860