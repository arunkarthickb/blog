use blog;
DROP TABLE IF EXISTS blog_technology;
create table blog_technology(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(10) NOT NULL
);
DROP TABLE IF EXISTS blog_post;
create table blog_post(
	id INT PRIMARY KEY AUTO_INCREMENT,
	content TEXT NOT NULL
);
DROP TABLE IF EXISTS blog_metadata;
create table blog_metadata (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	created_by VARCHAR(20) NOT NULL,
	date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	technology_id INT NOT NULL,
	post_id INT UNIQUE NULL,
	image BLOB NOT NULL,
	CONSTRAINT fk_technology_id FOREIGN KEY (technology_id)
  	REFERENCES blog_technology(id),
  	CONSTRAINT fk_post_id FOREIGN KEY (post_id)
  	REFERENCES blog_post(id)
  	ON DELETE CASCADE
  	ON UPDATE CASCADE
);
DROP TABLE IF EXISTS users;
create table users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(100) NOT NULL,
	name VARCHAR(50) NOT NULL,
	password_hash VARCHAR(255) NOT NULL,
	password_digest VARCHAR(255) NOT NULL
);
