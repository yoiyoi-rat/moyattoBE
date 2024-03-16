参考：https://zenn.dev/nobonobo/articles/e0af4e8afc6c38b42ae1

- MySQLかpostgresqLか
MySQL
理由：必要な操作は主に読み込み。また、複雑な操作は必要ない

- GOPATHは古い、moduleモードを使う

- goenvは使わない
基本的に後方互換性があるため、最新バージョンを使えばよい（GopherJS, WASM, CGO）あたりは気を付けた方がいいらしい。
また、以下の操作で任意のバージョンが使用可能
```
go install golang.org/dl/go1.##.#@latest
go1.##.# download
go1.##.# version
```

- my.cnf
default-time-zone='+9:00'

- docker-compose upがうまくいかなくて、一回リセットしたいとき
[参考](<https://qiita.com/suin/items/19d65e191b96a0079417>)
```
docker-compose down --rmi all --volumes --remove-orphans
```

- bashの入り方
docker-compose up -d
docker exec -it db bash