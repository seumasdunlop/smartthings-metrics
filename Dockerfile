FROM golang:1.16 as build-env

#RUN go get -u github.com/seumasdunlop/smartthings-metrics2

COPY . /build
WORKDIR /build
RUN CGO_ENABLED=0 go build -a -o /bin/main .

FROM scratch
COPY --from=build-env /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build-env /bin/main /
COPY ./units.json /

EXPOSE 9153

ENTRYPOINT ["/main"]
