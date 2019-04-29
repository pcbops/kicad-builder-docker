# kicad-builder-docker

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/pcbops/kicad-builder.svg)![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/pcbops/kicad-builder.svg)

Docker Image for Building Kicad: Available on docker hub [pcbops/kicad-builder](https://cloud.docker.com/u/pcbops/repository/docker/pcbops/kicad-builder)

Used in multi-stage builds of kicad or can be used standalone for development purposes

 - `latest` latest build version targeting master branch of KiCad Development

Two Major Tags

 - `v5` Stable Version 5.x Builds
 - `v4` Stable Version 4.x Builds

Version specific tags may be released from time to time e.g. `5.0.1`


## Using This Image to Build Locally

`$ docker run --rm -it -v $(PWD):/workspace pcbops/kicad-builder -c 'mkdir build && cd build && cmake .. && make'`

On linux systems, in order to have the build directory have your user owner instead of root, add the following flag anywhere before the  `pcbops/kicad-builder`

`--user $(id -u):$(id -g)`

For other platforms refer to docker documentation.


## Using This Image as part of multi-stage build


```Dockerfile
#Dockerfile

#Build Kicad
FROM pcbops:kicad-builder

ADD .
RUN mkdir build &&\
    cd build    &&\
    cmake ..    &&\
    make        &&\
    make install


#User Image without Build Dependencies :)
FROM ubuntu:16.04

COPY from=0 /usr/local/bin /usr/local/bin

# ...


```
