FROM openjdk:11.0-jdk

# 设置时区
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制解压包和txlib到工作目录
COPY unidbg-fetch-qsign /app
COPY txlib /app/txlib

# 安装dotenv库
RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install dotenv

# 复制.env文件
COPY .env /app/.env

# 设置命令
CMD bash -c "source /app/.env && bin/unidbg-fetch-qsign --host=0.0.0.0 --port=7860 --count=$COUNT --library=txlib/$TXLIB_VERSION --android_id=$ANDROID_ID"

# 暴露端口
EXPOSE 7860
