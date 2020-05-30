create database if not exists social_media;

use social_media;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

create table users (
	username varchar(20) not null,
	email varchar(30) not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	primary key (username)
);

create table posts (
	post_id int(11) auto_increment,
	username varchar(20) not null,
	post_content varchar(255) not null,
	post_date datetime default current_timestamp,
	primary key (post_id),
	foreign key (username) references users(username)

);

create table comments (
	comment_id int(11) auto_increment,
	username varchar(20) not null,
	post_id int(11),
	comment_content varchar(255) not null,
	comment_date datetime default current_timestamp,
	primary key (comment_id),
	foreign key (username) references posts(username),
	foreign key (post_id) references posts(post_id)

);