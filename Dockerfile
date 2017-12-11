# builder
FROM golang:latest as builder
MAINTAINER janek.idzie@gmail.com
WORKDIR /
COPY app.go .
RUN go build -o app .

# runner
FROM scratch
#WORKDIR /root/
COPY --from=builder /app .
CMD ["/app"]
