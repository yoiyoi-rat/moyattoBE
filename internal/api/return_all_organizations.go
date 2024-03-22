package api

import (
	"fmt"
	"log"

	"github.com/yoiyoi-rat/moyattoBE/internal/utility"
)


func FindAllOrganizations(organizations *[]utility.Organization) {

	db := utility.DbInit()

	if db == nil {
		log.Fatal("DB connection is nil")
		fmt.Println("db is nil")
	}

	// Auto migrate the schema
	err := db.AutoMigrate(&utility.Organization{}, &utility.Tag{})
	if err != nil {
		log.Fatal(err)
	}
	// Query data
	db.Debug().Preload("Tags").Find(&organizations)

}

