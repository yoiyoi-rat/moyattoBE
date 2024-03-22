package utility

import "gorm.io/gorm"

func GetPostsByTags(posts *[]Post, tags []string, limit int, db *gorm.DB) error {
	err := db.
		Where("tag_body IN ?", tags).
		Joins("JOIN mid_post_tags ON posts.id = mid_post_tags.post_id").
		Joins("JOIN tags ON mid_post_tags.tag_id = tags.id").
		Group("posts.id").
		Order("COUNT(posts.id) DESC").
		Preload("Tags").
		Limit(limit).
		Find(&posts).Error
	if err != nil {
		return err
	}
	return nil
}

func GetOrganizationsByTags(organizations *[]Organization, tags []string, limit int, db *gorm.DB) error {
	err := db.
		Where("tag_body IN ?", tags).
		Joins("JOIN mid_org_tags ON organizations.id = mid_org_tags.organization_id").
		Joins("JOIN tags ON mid_org_tags.tag_id = tags.id").
		Group("organizations.id").
		Order("COUNT(organizations.id) DESC").
		Preload("Tags").
		Limit(limit).
		Find(&organizations).Error
	if err != nil {
		return err
	}
	return nil
}
