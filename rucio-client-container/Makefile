.ONESHELL:

BASETAG:=`cat BASETAG`

all: latest py2

latest:
        @docker build . -f Dockerfile --build-arg BASETAG=${BASETAG} --no-cache --tag rucio-client:latest

py2:
        @docker build . -f Dockerfile --build-arg BASETAG=${BASETAG}_py2 --no-cache --tag rucio-client:py2
