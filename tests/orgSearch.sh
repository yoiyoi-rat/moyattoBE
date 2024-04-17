#/bin/bash

# APIにPOSTリクエストする

### 引数一覧
# $1 : エンドポイント
# $2 : リクエストボディ(JSON)

### 変数定義

# エンドポイント
ENDPOINT="ec2-35-77-149-195.ap-northeast-1.compute.amazonaws.com:80/orgssearch"

# リクエストボディ(JSON形式で受け取る)
JSON=$(cat "${1}")

# リクエストを出す
curl -X POST -H "Content-Type: application/json" -d "${JSON}" "${ENDPOINT}"
