# Mission 05 - Docker
#
# Something in here is wrong. `docker build` will succeed, but
# `docker run` will not behave. Read the error, inspect this file,
# and fix it.
#
# Intended final behavior:
#   $ docker build -t prereq-quest .
#   $ docker run --rm prereq-quest
#   hello, world
#   42

FROM alpine:3.22 AS builder

RUN apk add --no-cache ca-certificates curl gcc make musl-dev

# Build from source so the image works on both amd64 and arm64 hosts.
# The static musl binary can run in the empty scratch stage below.
ARG JANET_VERSION=v1.42.0
RUN curl -fsSL -o /tmp/janet-src.tar.gz \
        "https://github.com/janet-lang/janet/archive/refs/tags/${JANET_VERSION}.tar.gz" \
    && mkdir -p /tmp/janet-src \
    && tar xzf /tmp/janet-src.tar.gz -C /tmp/janet-src --strip-components=1 \
    && make -C /tmp/janet-src -j"$(nproc)" \
        CFLAGS="-O2 -static" \
        LDFLAGS="-static" \
        HAS_SHARED=0 \
    && strip /tmp/janet-src/build/janet

FROM scratch

COPY --from=builder /tmp/janet-src/build/janet /janet

WORKDIR /quest

COPY app/main.janet /app/main.janet

CMD ["/janet", "main.janet"]
