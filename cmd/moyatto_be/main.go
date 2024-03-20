package main

import (
	"fmt"
	"database/sql"
	"log"
	"os"
	_ "github.com/go-sql-driver/mysql"
)

func main() {

	// 環境変数から接続情報を取得
	dbUser := os.Getenv("MYSQL_USER")
	dbPassword := os.Getenv("MYSQL_PASSWORD")
	dbName := os.Getenv("MYSQL_DATABASE")
	dbHost := "db"
	dbPort := "3306"

	path := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8&parseTime=true", dbUser, dbPassword, dbHost, dbPort, dbName)

	db, err := sql.Open("mysql", path)
	if err != nil {
		log.Fatal(err)
		fmt.Println("--- db open failed !!! ---")
	} else {
		fmt.Println("--- db open scceeded !!! ---")
	}
	defer db.Close()
}
