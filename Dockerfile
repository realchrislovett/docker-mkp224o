FROM alpine:latest AS builder

WORKDIR /

RUN apk add git gcc musl-dev libsodium-dev make autoconf ;\
    git clone https://github.com/cathugger/mkp224o.git ;\
    cd mkp224o ;\
    ./autogen.sh ;\
    ./configure --enable-intfilter ;\
    make

FROM alpine:latest

RUN apk add --no-cache libsodium

COPY --from=builder /mkp224o/mkp224o /bin/mkp224o

WORKDIR /onions

ENTRYPOINT ["/bin/mkp224o"]
