FROM debian:latest

RUN echo "deb http://mirrors.aliyun.com/debian/ bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://mirrors.aliyun.com/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get install hugo

COPY  . .

WORKDIR /bin

EXPOSE 1313

CMD ["sh","start.sh"]