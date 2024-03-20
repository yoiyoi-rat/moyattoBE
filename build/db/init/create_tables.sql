CREATE DATABASE IF NOT EXISTS moyatto_db;

USE moyatto_db;

CREATE TABLE IF NOT EXISTS posts (
    post_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    post_body TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (post_id)
);
CREATE TABLE IF NOT EXISTS tags (
    tag_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    tag_body VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (tag_id)
);
CREATE TABLE IF NOT EXISTS organizations (
    organization_id INT AUTO_INCREMENT UNIQUE NOT NULL,
    organization_name VARCHAR(255) NOT NULL,
    organization_body TEXT NOT NULL,
    link VARCHAR(255),
    PRIMARY KEY (organization_id)
);
CREATE TABLE IF NOT EXISTS mid_post_tag (
    post_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (post_id)
        REFERENCES posts(post_id)
        ON DELETE CASCADE,
    FOREIGN KEY (tag_id)
        REFERENCES tags(tag_id)
        ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS mid_org_tag (
    organization_id INT NOT NULL,
    tag_id INT,
    FOREIGN KEY (organization_id)
        REFERENCES organizations(organization_id)
        ON DELETE CASCADE,
    FOREIGN KEY (tag_id)
        REFERENCES tags(tag_id)
        ON DELETE CASCADE
);

INSERT INTO posts (user_name, post_body)
VALUES
("はなこ", "つかれたな"),
("かなこ", "もやもやする"),
("たろう", "パワハラだ～"),
("けん","心が休まらない");

INSERT INTO tags (tag_body)
VALUES
("セクシュアリティ"),
("仕事"),
("家族"),
("お金");

INSERT INTO mid_post_tag (post_id, tag_id) 
VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(3,3);

INSERT INTO organizations (organization_name, organization_body, link) 
VALUES
("祖父母の家", "いいところ：aa /n 悪いところ：ああ", "https://google.com"),
("相談センター", "いいところ：bb /n 悪いところ：いい", "https://example.com"),
("保護センター", "いいところ：cc /n 悪いところ：うう", "https://sample.com");

INSERT INTO mid_org_tag (organization_id, tag_id)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1);
