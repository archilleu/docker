#Version: 0.0.1
FROM ubuntu:latest
MAINTAINER archilleu "313720180@qq.com"
#add shadowsocks ppa
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
RUN apt update
# install shadowsocks
RUN apt install shadowsocks-libev -y

# copy config file
COPY config.json /etc/shadowsocks-libev

#expose port 8080
EXPOSE 8080

# start server
RUN /etc/init.d/shadowsocks-libev start
