package api

import (
	"log"
	"net/http"
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/yoiyoi-rat/moyattoBE/internal/utility"
)


func AddPostAndSearch(posts_and_organizations *utility.PostsAndOrganizations, c *gin.Context) {

	// jsonをPost構造体にマッピング
	var req utility.CreatePost
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// db接続
	db := utility.DbInit()

	err := db.AutoMigrate(&utility.Tag{}, &utility.Tag{})
	if err != nil {
		log.Fatal(err)
	}

	// dbにpostをcreate
	postdata := utility.NewPost(req.UserName, req.PostBody, req.Tags.StringArray(), db)
	
	fmt.Println(postdata)

	result := db.Create(&postdata)

	if result.Error != nil {
		log.Fatal(result.Error)
		c.JSON(http.StatusInternalServerError, "")
		return
	}

	// タグの似た投稿を取得

	post_limit := 5

    if err := utility.GetPostsByTags(&posts_and_organizations.Posts, req.Tags.StringArray(), post_limit, db); err != nil {
		log.Fatalf("failed to get posts: %v", err)
	}

	org_limit := 4
	if err := utility.GetOrganizationsByTags(&posts_and_organizations.Organizations, req.Tags.StringArray(), org_limit, db); err != nil {
		log.Fatalf("failed to get organizations: %v", err)
	}


}
