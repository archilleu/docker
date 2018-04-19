#Version: 0.0.1
FROM ubuntu:latest
MAINTAINER archilleu "313720180@qq.com"

#update
RUN apt update
# install software 
RUN apt install golang -y
RUN apt install git -y

RUN cd /usr/local
RUN git clone https://github.com/inconshreveable/ngrok.git /usr/local/ngrok

# copy config file
COPY rootCA.pem /usr/local/ngrok/assets/client/tls/ngrokroot.crt
COPY server.crt /usr/local/ngrok/assets/server/tls/snakeoil.crt
COPY server.key /usr/local/ngrok/assets/server/tls/snakeoil.key

WORKDIR /usr/local/ngrok

RUN make release-server

#expose port 8080
EXPOSE 80
EXPOSE 443 
EXPOSE 4433

