APP := app

.PHONY: all run build clean

all: run


run: build
	./$(APP)

build:
	go build -o $(APP)

clean:
	rm -f $(APP)
