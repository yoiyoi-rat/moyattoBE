FROM golang:1.22-alpine as builder
RUN apk update && apk add git \
  && apk add --no-cache git curl make gcc g++ \
  && go get github.com/oxequa/realize


# CMD ["go", "install", "github.com/cosmtrek/air@latest"] わからん
# CMD ["air", "-c", ".air.toml"]
WORKDIR /go/app

COPY go.mod .
COPY go.sum .

RUN go mod download
COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o /main

FROM alpine:3.9

COPY --from=builder /main .

ENV PORT=${PORT}

ENTRYPOINT ["/main"]

EXPOSE 8080

# 初期化スクリプトをコピー
COPY init-script.sh .

# 初期化スクリプトを実行するCMDを追加
CMD ["bash", "init-script.sh"]