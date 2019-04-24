# build image
FROM golang:1.12-alpine as builder
RUN apk update && apk add git ca-certificates

WORKDIR /app
COPY ./kube-eagle .

# executable image
FROM daocloud.io/daocloud/go-busybox:glibc
COPY --from=builder /app/kube-eagle /go/bin/kube-eagle

ENV VERSION 1.1.1
ENTRYPOINT ["/go/bin/kube-eagle"]
