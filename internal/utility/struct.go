package utility

import (
	"time"
	"log"
	"gorm.io/gorm"
)

type PostsAndOrganizations struct {
	Posts []Post
	Organizations []Organization
}

type Post struct {
	Id        int       `gorm:"primary_key"`
	UserName  string    `gorm:"size:255"`
	PostBody  string    `gorm:"not null"`
	CreatedAt time.Time `gorm:"type:timestamp; default:CURRENT_TIMESTAMP"`
	Tags      []*Tag     `gorm:"many2many:mid_post_tags"`
}

type Tag struct {
	Id      int    `gorm:"primary_key"`
	TagBody string `gorm:"size:255; uniqueIndex"`
}

type Organization struct {
	Id        int       `gorm:"primary_key"`
	OrganizationName  string    `gorm:"size:255"`
	OrganizationBody  string    `gorm:"not null"`
	Link			string `default:""`
	Tags      []*Tag     `gorm:"many2many:mid_org_tags"`
}



func NewPostsAndOrganizations(posts []Post, organizations []Organization) *PostsAndOrganizations {
	return &PostsAndOrganizations {
		Posts: posts,
		Organizations: organizations, 
	}
}

func NewPost(username string, postbody string, tagbodies []string, db *gorm.DB) *Post {
	var tags []*Tag
	for _, tagbody := range tagbodies {
		tag := NewTag(tagbody)
		if err := db.Where("tag_body = ?", tagbody).FirstOrCreate(tag, Tag{TagBody: tagbody}).Error; err != nil {
			log.Fatalf("failed to create or find tag with body %s: %s", tagbody, err)
		}
		tags = append(tags, tag)
	}
	return &Post {
		UserName: username,
		PostBody: postbody,
		Tags: tags,
	}
}

func NewTag(tagbody string) *Tag {
	return &Tag {
		TagBody: tagbody,
	}
}


type CreatePost struct {
	UserName string `binding:"required,max=255"`
	PostBody string `binding:"required"`
	Tags     CreateTags
}

type CreateTags []*CreateTag

type CreateTag struct {
	TagBody string `binding:"max=255"`
}

func (ts *CreateTags) StringArray() []string {
	var str_tags []string
	for _, t := range *ts {
		str_tags = append(str_tags, t.TagBody)
	}
	return str_tags
}

