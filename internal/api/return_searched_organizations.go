package api

import (
	"log"

	"github.com/yoiyoi-rat/moyattoBE/internal/utility"
)

func OrgSearch(organizations *[]utility.Organization, req *utility.CreateTags) {

	db := utility.DbInit()

	if err := db.AutoMigrate(&utility.Organization{}, &utility.Tag{}); err != nil {
		log.Fatal(err)
	}

	str_tags := req.StringArray()

	// Function to get posts based on tag frequency
	
	limit := 100
	if err := utility.GetOrganizationsByTags(organizations, str_tags, limit, db); err != nil {
		log.Fatalf("failed to get posts: %v", err)
	}

}
