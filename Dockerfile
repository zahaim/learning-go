FROM golang:latest as builder
MAINTAINER janek.idzie@gmail.com

WORKDIR /go/src/myapp
COPY app.go .

# build
RUN go build -o app .

FROM alpine:latest 
RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/myapp/app .

CMD ["./app"]
