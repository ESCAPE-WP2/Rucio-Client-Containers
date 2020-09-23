.ONESHELL:

all: latest python3

latest:
	@docker build . -f Dockerfile --tag rucio-client:latest

python3:
	@docker build . -f Dockerfile --tag rucio-client:py3
