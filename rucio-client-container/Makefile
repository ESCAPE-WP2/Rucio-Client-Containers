.ONESHELL:

BASETAG:=`cat BASETAG`

all: latest py3

latest:
	@docker build . -f Dockerfile --no-cache --tag rucio-client:latest

py3:
	@docker build . -f Dockerfile --build-arg BASETAG=${BASETAG} --no-cache --tag rucio-client:py3

