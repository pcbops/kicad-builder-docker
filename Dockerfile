# Kicad Development Branch Build Image
# Tried to stay up to date to build KiCad master branch
# This image is intended to be used as base image
# for a multi-stage build

FROM ubuntu:16.04

LABEL maintainer="akshmakov@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
# Leave apt-lists so users can apt-get without update

RUN apt-get update && apt-get upgrade -y &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository --yes ppa:js-reynaud/kicad-5 &&\
    apt-get update && \
    apt-get install -y \
    	    libwxgtk3.0-dev \
	    cmake \
	    libboost-all-dev \
	    mesa-common-dev \
	    zlib1g-dev \
	    libcairo-dev \
	    libglew-dev \
	    liboce-ocaf-dev \
	    libcurl4-openssl-dev \
	    libglm-dev \
	    doxygen \
	    python \
	    swig \
	    libngspice-kicad \
	    ngspice \
	    python-wxgtk3.0-dev \
	    libssl-dev &&\ 
    rm -rf /var/lib/apt/list/* 

ENTRYPOINT [ "/bin/bash" ]

WORKDIR "/workspace"

	
	
	    
    	    