FROM alpine:3.14.2

RUN apk update

# https://github.com/chimera-linux/cports#requirements
RUN apk add python3 openssl git bubblewrap

# https://github.com/chimera-linux/cports#bootstrap-prerequisites
# make is gmake
# binutils has strip
RUN apk add clang cmake meson patch bmake ninja byacc flex perl m4 make lld
compiler-rt libunwind pkgconfig
RUN ln -s /usr/bin/yacc /usr/bin/byacc

RUN adduser --disabled-password nonroot
# Or maybe I should add /sbin to my path?
RUN ln -s /sbin/apk /bin/apk
WORKDIR /home/nonroot

RUN git clone https://github.com/chimera-linux/cports
WORKDIR /home/nonroot/cports

# WARNING: puts signing keys in etc/keys. Should not be considered "trusted".
RUN ./cbuild.py keygen

# fixes for `./cbuild.py bootstrap` errors
# scripts/basic/fixdep.c:92:10: fatal error: 'sys/types.h' file not found
RUN apk add musl-dev
# ld.lld: error: cannot open /usr/lib/clang/11.1.0/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
RUN apk add compiler-rt-static


RUN ./cbuild.py bootstrap
