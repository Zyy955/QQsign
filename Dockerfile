FROM openjdk:22-slim-bookworm

# Set timezone
ENV TZ Asia/Shanghai

# Set working directory
WORKDIR /app

# Copy the unpacked package and txlib to the working directory
COPY unidbg-fetch-qsign /app
COPY txlib /app/txlib

# Set the command
CMD bash bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION

#pose port
EXPOSE 7860
