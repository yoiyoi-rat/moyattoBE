package api

import (
	"fmt"
	"log"

	"github.com/yoiyoi-rat/moyattoBE/internal/utility"
)


func FindLatest(posts *[]utility.Post) {

	db := utility.DbInit()

	if db == nil {
		log.Fatal("DB connection is nil")
		fmt.Println("db is nil")
	}

	// Auto migrate the schema
	err := db.AutoMigrate(&utility.Post{}, &utility.Tag{})
	if err != nil {
		log.Fatal(err)
	}
	// Query data
	db.Debug().Preload("Tags").Order("created_at DESC").Limit(5).Find(&posts)

	for _, post := range *posts {
		fmt.Println("Post ID:", post.Id)
		fmt.Println("User Name:", post.UserName)
		fmt.Println("Post Body:", post.PostBody)
		fmt.Println("Created At:", post.CreatedAt)
		fmt.Println("Tags:")
		for _, tag := range post.Tags {
			fmt.Printf("\tTag ID: %d, Tag Body: %s\n", tag.Id, tag.TagBody)
		}
		fmt.Println()
	}
}
