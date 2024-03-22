package api

import (
	"log"

	"github.com/yoiyoi-rat/moyattoBE/internal/utility"
)

func TagSearch(posts *[]utility.Post, req *utility.CreateTags) {

	db := utility.DbInit()

	if err := db.AutoMigrate(&utility.Post{}, &utility.Tag{}); err != nil {
		log.Fatal(err)
	}

	str_tags := req.StringArray()

	// Function to get posts based on tag frequency
	
	limit := 5
	if err := utility.GetPostsByTags(posts, str_tags, limit, db); err != nil {
		log.Fatalf("failed to get posts: %v", err)
	}

}