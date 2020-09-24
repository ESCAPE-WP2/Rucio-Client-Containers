.ONESHELL:

all: dev dev-python3 latest python3

dev:
	@docker build . -f Dockerfile_dev --no-cache --tag rucio-client:dev

dev-python3:
	@docker build . -f Dockerfile_dev_py3 --no-cache --tag rucio-client:dev-py3

latest:
	@docker build . -f Dockerfile --no-cache --tag rucio-client:latest

python3:
	@docker build . -f Dockerfile_py3 --no-cache --tag rucio-client:py3

