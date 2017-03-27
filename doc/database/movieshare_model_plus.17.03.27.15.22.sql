CREATE TABLE `users` (
`id` char(64) NOT NULL,
`username` varchar(32) NOT NULL,
`password` varchar(128) NOT NULL COMMENT '加密后的密码',
`salt` varchar(64) NOT NULL,
`authid` char(64) NOT NULL COMMENT '用于登陆验证，与id配合，作为登陆凭证',
`permission` int NULL DEFAULT 1,
`create_time` datetime NULL,
`modify_time` datetime NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `userinfo` (
`userid` char(64) NOT NULL COMMENT '依赖与user表 如果在user表中没有则不允许插入',
`avatars` varchar(255) NULL COMMENT '头像',
`nickname` varchar(32) NOT NULL,
`email` varchar(32) NOT NULL,
`sex` char(8) NULL,
`phonenumber` char(11) NULL COMMENT '手机号',
PRIMARY KEY (`userid`) 
);

CREATE TABLE `famouspeoples` (
`id` char(64) NOT NULL,
`name` varchar(16) NULL,
`name_zh` varchar(16) NULL,
`sex` char(8) NULL,
`birthday` date NULL,
`birthplace` varchar(32) NULL,
`occupation` varchar(32) NULL COMMENT '职业',
`imdbnum` char(32) NULL COMMENT 'imdb编号',
`summary` varchar(512) NULL COMMENT '描述',
PRIMARY KEY (`id`) 
);

CREATE TABLE `movies` (
`id` char(64) NULL,
`name_en` varchar(32) NULL,
`name_zh` varchar(255) NULL,
`playbill` varchar(255) NULL COMMENT '海报地址',
`len_film` time NULL,
`producer` char(16) NULL COMMENT '制片国家',
`douban_score` float NULL DEFAULT 0 COMMENT '豆瓣评分',
`language` char(16) NULL COMMENT '语言',
`foreshow` varchar(255) NULL COMMENT '预告地址 默认豆瓣的预告地址',
`summary` varchar(255) NULL COMMENT '电影剧情简介',
`release` date NULL COMMENT '上映时间 只记录中国上映时间',
`IMDbURI` varchar(255) NULL COMMENT 'IMDb链接',
PRIMARY KEY (`id`) 
);

CREATE TABLE `movies_peoples` (
`movie_id` char(64) NOT NULL,
`people_id` char(64) NOT NULL,
`type` char(32) NULL COMMENT '人种类- 导演 演员 编剧',
PRIMARY KEY (`movie_id`, `people_id`) 
);

CREATE TABLE `user_movie_impressions` (
`id` char(64) NULL,
`userid` char(64) NULL,
`movieid` char(64) NULL,
`score` int NULL,
`hadsaw_wanted` varchar(8) NULL COMMENT 'hadsaw or want',
`comment` varchar(255) NULL COMMENT '评论',
`datetime` datetime NULL COMMENT '点评时间',
PRIMARY KEY (`id`) 
);

CREATE TABLE `friends` (
`userid` char(64) NOT NULL,
`friendsid` char(64) NOT NULL,
PRIMARY KEY (`userid`, `friendsid`) 
);

CREATE TABLE `filmtype_meta` (
`id` char(64) NULL,
`type` char(16) NOT NULL COMMENT '电影的类型 英文 也为链接',
`name` char(16) NULL COMMENT '电影的类型 中文',
PRIMARY KEY (`id`) 
);

CREATE TABLE `filmtype` (
`id` char(64) NULL,
`movieid` char(64) NULL,
`filmtype` char(64) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `movie_picture` (
`movieid` char(64) NULL,
`imguri` varchar(255) NULL COMMENT '图片地址 可本地 可url',
PRIMARY KEY (`movieid`, `imguri`) 
);

CREATE TABLE `tag_meta` (
`id` char(64) NULL,
`tagname` varchar(255) NULL COMMENT '标签名字',
`type` varchar(32) NULL COMMENT '电影 人 等的tag',
PRIMARY KEY (`id`) 
);

CREATE TABLE `movie_tag` (
`userid` char(64) NULL,
`movieid` char(64) NULL,
`tagid` char(64) NULL,
PRIMARY KEY (`userid`, `movieid`, `tagid`) 
);

CREATE TABLE `movie_comment_impressions` (
`movie_comment_id` char(64) NULL,
`userid` char(64) NULL,
`isagree` bit NULL COMMENT '是否赞同这个该评论 1赞同 0不赞同',
`datetime` datetime NULL COMMENT '赞同或否定时间',
PRIMARY KEY (`movie_comment_id`, `userid`) 
);


ALTER TABLE `userinfo` ADD CONSTRAINT `userinfo_userid_users_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
ALTER TABLE `movies_peoples` ADD CONSTRAINT `movies_peoples_writer_id_famouspeoples_foreignkey` FOREIGN KEY (`people_id`) REFERENCES `famouspeoples` (`id`);
ALTER TABLE `movies_peoples` ADD CONSTRAINT `movies_peoples_movie_id_movies_foreignkey` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
ALTER TABLE `user_movie_impressions` ADD CONSTRAINT `movie_impression_userid_users_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
ALTER TABLE `user_movie_impressions` ADD CONSTRAINT `movie_impression_movieid_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`);
ALTER TABLE `friends` ADD CONSTRAINT `friends_userid_users_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
ALTER TABLE `friends` ADD CONSTRAINT `friends_friendid_users_foreignkey` FOREIGN KEY (`friendsid`) REFERENCES `users` (`id`);
ALTER TABLE `filmtype` ADD CONSTRAINT `filmtype_movieid_movies_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`);
ALTER TABLE `filmtype` ADD CONSTRAINT `filmtype_type_filmtypemeta_foreignkey` FOREIGN KEY (`filmtype`) REFERENCES `filmtype_meta` (`id`);
ALTER TABLE `movie_picture` ADD CONSTRAINT `moviepicture_movieid_movies_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`);
ALTER TABLE `movie_tag` ADD CONSTRAINT `movietag_tagid_foreignkey` FOREIGN KEY (`tagid`) REFERENCES `tag_meta` (`id`);
ALTER TABLE `movie_tag` ADD CONSTRAINT `movietag_userid_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
ALTER TABLE `movie_tag` ADD CONSTRAINT `movietag_movieid_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`);
ALTER TABLE `movie_comment_impressions` ADD CONSTRAINT `moviecomment_impression_impressionid_movieimpression` FOREIGN KEY (`movie_comment_id`) REFERENCES `user_movie_impressions` (`id`);
ALTER TABLE `movie_comment_impressions` ADD CONSTRAINT `moviecomment_userid_movieimpression` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

