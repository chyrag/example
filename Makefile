APP := app

.PHONY: all run build clean

all: run


run: build
	docker run --rm --network=host ckzed-$(APP)

build:
	docker build -t ckzed-$(APP) .

clean:
	-docker rmi ckzed-$(APP)
