FROM openjdk:8-jdk

# Set timezone
ENV TZ Asia/Shanghai

# Set working directory
WORKDIR /app

# Copy the unpacked package and txlib to the working directory
COPY unidbg-fetch-qsign /app
COPY txlib /app/txlib

RUN chmod 755 /app

# Set the command
CMD bash bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION

#pose port
EXPOSE 7860
