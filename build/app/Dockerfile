FROM golang:1.22-alpine
RUN apk update && apk add git
WORKDIR /go/app
CMD ["go", "run", "./cmd/moyatto_be/main.go"]