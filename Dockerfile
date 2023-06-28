FROM openjdk:11.0-jdk

# 设置时区
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制解压包和txlib到工作目录
COPY unidbg-fetch-qsign /app
COPY txlib /app/txlib

# 设置命令
CMD bash bin/unidbg-fetch-qsign --port=7860 --count=1 --library=txlib/8.9.63 --android_id=IL.1621888.3540

# 暴露端口
EXPOSE 7860
