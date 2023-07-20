FROM openjdk:11.0-jdk

# Install gosu
RUN apt-get update && apt-get install -y gosu

# Set timezone
ENV TZ Asia/Shanghai

# Set working directory
WORKDIR /app

# Copy the unpacked package and txlib to the working directory
COPY unidbg-fetch-qsign /app
COPY txlib /app/txlib

# Set the command
CMD gosu root bash bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION

#pose port
EXPOSE 7860
