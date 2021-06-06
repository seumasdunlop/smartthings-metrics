FROM golang:1.14

RUN go get -u github.com/seumasdunlop/smartthings-metrics2

WORKDIR /go/bin

COPY ./units.json /go/bin

EXPOSE 9153