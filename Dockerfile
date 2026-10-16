# syntax=docker/dockerfile:1

# alpine:3.24.2
FROM alpine@sha256:c54a80678a9e7a744b39d478329d5eb8e568c2e0321defd14cab57047557e202

RUN apk add --no-cache build-base linux-headers

WORKDIR /build

ADD --checksum=sha256:06602ffd591e98c75b3dc1d66f0f19136cc666b0b2d95caad987d6ab2cb28097 \
    http://www.dest-unreach.org/socat/download/socat-1.8.1.3.tar.gz .

RUN tar xzf socat-1.8.1.3.tar.gz

WORKDIR /build/socat-1.8.1.3

RUN LDFLAGS="-static" ./configure && make
