.ONESHELL:

all: latest py3

latest:
	@docker build . -f Dockerfile --no-cache --tag rucio-client:latest

py3:
	@docker build . -f Dockerfile --build-arg BASEIMAGE=rucio/rucio-clients:release-1.23.11_py3 --no-cache --tag rucio-client:py3

