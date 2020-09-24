.ONESHELL:

all: latest python3

latest:
	@docker build . -f Dockerfile --no-cache --tag rucio-client:latest

python3:
	@docker build . -f Dockerfile_py3 --no-cache --tag rucio-client:py3

