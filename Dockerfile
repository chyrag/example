FROM golang:1.14-alpine as build

RUN apk add --no-cache git=2.24.3-r0
RUN mkdir -p /go/src/github.com/chyrag/example
WORKDIR /go/src/github.com/chyrag/example
COPY . .
ENV CGO_ENABLED 0
RUN go get github.com/chyrag/example

FROM scratch
COPY --from=build /go/bin/example /

CMD ["/example"]
