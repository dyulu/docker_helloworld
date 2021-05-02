FROM gcc AS hello_builder

ARG HELLOWORLD=/hello-world
RUN mkdir -p ${HELLOWORLD}
COPY src ${HELLOWORLD}/src
COPY Makefile ${HELLOWORLD}
COPY scripts ${HELLOWORLD}
WORKDIR ${HELLOWORLD}
RUN make

FROM alpine
RUN apk update && apk add bash bash-completion
COPY --from=hello_builder /hello-world/hello-world /usr/bin
COPY --from=hello_builder /hello-world/HelloWorld.sh /usr/bin

ENTRYPOINT bash
