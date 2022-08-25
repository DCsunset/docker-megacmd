FROM ubuntu:18.04

# Dependencies
RUN apt update && apt install -y build-essential git \
	autoconf libtool g++ libcrypto++-dev libz-dev libsqlite3-dev libssl-dev libcurl4-gnutls-dev libreadline-dev libpcre++-dev libsodium-dev libc-ares-dev libfreeimage-dev libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libmediainfo-dev libzen-dev libuv1-dev \
	&& rm -rf /var/lib/apt/lists/*

# Build
RUN git clone --depth 1 https://github.com/meganz/MEGAcmd.git \
	&& cd MEGAcmd \
	&& git submodule update --init --recursive --depth 1 \
	&& sh autogen.sh && ./configure && make && make install \
	&& cd / && rm -rf MEGAcmd
