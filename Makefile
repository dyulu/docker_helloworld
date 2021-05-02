# gcc for c program; g++ for c++
CC = g++

CFLAGS  = -g -Wall -static

VPATH = src

TARGET = hello-world

CONTAINER = hello-world-container

all: ${TARGET}

${TARGET}: HelloWorld.cpp
	${CC} ${CFLAGS} -o ${TARGET} src/HelloWorld.cpp

${CONTAINER}:
	docker build -t ${CONTAINER} -f docker/Dockerfile .

clean:
	rm ${TARGET}
	docker rm ${CONTAINER}:latest
