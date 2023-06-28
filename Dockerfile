FROM openjdk:11.0-jdk

# 设置时区
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制解压包和txlib到工作目录
COPY unidbg-fetch-qsign /app
COPY txlib /app/txlib

# 设置命令
CMD bash bin/unidbg-fetch-qsign --host=0.0.0.0 --port=7860 --count=2 --library=txlib/8.9.63 --android_id=IL.3471473.3684

# 暴露端口
EXPOSE 7860
