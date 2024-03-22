FROM golang:1.22-alpine
RUN apk update && apk add git
# CMD ["go", "install", "github.com/cosmtrek/air@latest"] わからん
# CMD ["air", "-c", ".air.toml"]
WORKDIR /go/app
CMD ["go", "run", "./cmd/moyatto_be/main.go"]