package main

import (
	"github.com/gin-gonic/gin"
	"github.com/yoiyoi-rat/moyattoBE/internal/api"
	"github.com/yoiyoi-rat/moyattoBE/internal/utility"
	"net/http"
	"log"
)

func main() {
	// Ginエンジンのインスタンスを作成
	r := gin.Default()

	// ルートURL ("/") に対するGETリクエストをハンドル
	r.GET("/", func(c *gin.Context) {
		// JSONレスポンスを返す
		c.JSON(200, gin.H{
			"message": "Hello World",
		})
	})
	// return first page posts
	r.GET("/latest", func(c *gin.Context) {
		var posts []utility.Post
		api.FindLatest(&posts)
		c.JSON(http.StatusOK, posts)
	})

	r.POST("/post-and-search", func(c *gin.Context) {
		var posts_and_organizations utility.PostsAndOrganizations
		api.AddPostAndSearch(&posts_and_organizations, c)
		c.JSON(http.StatusOK, posts_and_organizations)
	})

	r.POST("/postsearch", func(c *gin.Context) {
		// jsonを構造体にマッピング
		var req utility.CreateTags
		if err := c.ShouldBindJSON(&req); err != nil {
			log.Fatal(err)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		}

		// 返却用
		var posts []utility.Post

		api.PostSearch(&posts, &req)
		c.JSON(http.StatusOK, posts)
	})

	r.GET("/organizations", func(c *gin.Context) {
		var organizations []utility.Organization
		api.FindAllOrganizations(&organizations)
		c.JSON(http.StatusOK, organizations)
	})

	r.POST("/orgssearch", func(c *gin.Context) {
		// jsonを構造体にマッピング
		var req utility.CreateTags
		if err := c.ShouldBindJSON(&req); err != nil {
			log.Fatal(err)
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		}

		// 返却用
		var organizations []utility.Organization

		api.OrgSearch(&organizations, &req)
		c.JSON(http.StatusOK, organizations)
	})

	// 8080ポートでサーバーを起動
	r.Run(":8080")
}
