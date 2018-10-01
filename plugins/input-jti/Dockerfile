FROM golang:1.10
RUN mkdir /go/src/github.com
RUN mkdir /go/src/github.com/influxdata
WORKDIR /go/src/github.com/influxdata

#RUN go get -u -v google.golang.org/grpc

RUN apt-get update &&\
    apt-get install -y unzip wget curl

RUN git clone https://github.com/psagrera/telegraf.git

WORKDIR /go/src/github.com/influxdata/telegraf
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
RUN make

RUN mkdir /source
RUN mkdir /source/logs

WORKDIR /source
#COPY cert_files /source/cert_files
#COPY telegraf.toml /source/telegraf.toml

COPY start-input-jti.sh /source/start-input-jti.sh
RUN chmod +x /source/start-input-jti.sh

CMD ["/source/start-input-jti.sh"]
