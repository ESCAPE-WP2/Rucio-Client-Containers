.ONESHELL:

all: latest py3

latest:
	@docker build . -f Dockerfile --no-cache --tag rucio-client:latest

py3:
	@docker build . -f Dockerfile --build-arg BASEIMAGE=rucio/rucio-clients:release-1.24.1.post1 --no-cache --tag rucio-client:py3

