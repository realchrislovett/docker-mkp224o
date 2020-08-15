FROM alpine:latest AS builder

WORKDIR /

RUN apk add git gcc musl-dev libsodium-dev make autoconf ;\
    git clone https://github.com/cathugger/mkp224o.git ;\
    cd mkp224o ;\
    ./autogen.sh ;\
    ./configure --enable-intfilter ;\
    make

FROM alpine:latest

WORKDIR /

RUN apk add libsodium

COPY --from=builder /mkp224o/mkp224o .

ENTRYPOINT ["/mkp224o"]
