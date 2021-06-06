FROM golang:1.16

RUN go get -u github.com/seumasdunlop/smartthings-metrics2

WORKDIR /go/bin

COPY ./units.json /go/bin

EXPOSE 9153