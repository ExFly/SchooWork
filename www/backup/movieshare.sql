/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : movieshare

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-12 14:37:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `famouspeoples`
-- ----------------------------
DROP TABLE IF EXISTS `famouspeoples`;
CREATE TABLE `famouspeoples` (
  `id` int(11) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `name_zh` varchar(16) DEFAULT NULL,
  `sex` char(8) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(32) DEFAULT NULL,
  `occupation` varchar(32) DEFAULT NULL COMMENT '职业',
  `imdbnum` char(32) DEFAULT NULL COMMENT 'imdb编号',
  `summary` varchar(512) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of famouspeoples
-- ----------------------------
INSERT INTO `famouspeoples` VALUES ('1', 'en詹姆斯·曼高德', '詹姆斯·曼高德', 'man', '2010-02-03', 'birthplace1', '???', 'nm0003506', '詹姆斯·曼高德出生在一个艺术家庭，父母都是著名画家。他曾在加利富尼亚州艺术学院取得电影和表演的学士学位，因为在大学时拍摄了很多短片，21岁的曼高德被迪斯尼公司看中，开始为动画片创作剧本，并为美国广播公司(ABC)拍摄电视电影。后来他进入哥伦比亚大学电影专业就读，并取得了硕士学位。虽然从影至今曼高德只拍摄了5部影片，但部部都以不可小觑的业绩掷地有声。');
INSERT INTO `famouspeoples` VALUES ('2', 'enname1', null, null, null, null, null, null, null);
INSERT INTO `famouspeoples` VALUES ('3', 'Stephen Merchant', '斯戴芬·莫昌特', 'man', '2010-02-01', 'virthplace3', '???', 'nm0580351', '一位英国的编剧导演制片和演员，主要作品有英剧《办公室》的编剧，《临时演员》的编剧制片导演和演员，等等。2015年参加了真人秀《对口型假唱大赛》');

-- ----------------------------
-- Table structure for `filmtype`
-- ----------------------------
DROP TABLE IF EXISTS `filmtype`;
CREATE TABLE `filmtype` (
  `id` int(11) NOT NULL,
  `movieid` int(11) DEFAULT NULL,
  `filmtype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filmtype_movieid_movies_foreignkey` (`movieid`),
  KEY `filmtype_type_filmtypemeta_foreignkey` (`filmtype`),
  CONSTRAINT `filmtype_movieid_movies_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`),
  CONSTRAINT `filmtype_type_filmtypemeta_foreignkey` FOREIGN KEY (`filmtype`) REFERENCES `filmtype_meta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filmtype
-- ----------------------------
INSERT INTO `filmtype` VALUES ('1', '1', '1');
INSERT INTO `filmtype` VALUES ('2', '1', '2');
INSERT INTO `filmtype` VALUES ('3', '1', '3');
INSERT INTO `filmtype` VALUES ('4', '2', '3');

-- ----------------------------
-- Table structure for `filmtype_meta`
-- ----------------------------
DROP TABLE IF EXISTS `filmtype_meta`;
CREATE TABLE `filmtype_meta` (
  `id` int(11) NOT NULL,
  `type` char(16) NOT NULL COMMENT '电影的类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filmtype_meta
-- ----------------------------
INSERT INTO `filmtype_meta` VALUES ('1', '科幻');
INSERT INTO `filmtype_meta` VALUES ('2', '剧情');
INSERT INTO `filmtype_meta` VALUES ('3', '动作');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `userid` int(11) NOT NULL,
  `friendsid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`friendsid`),
  KEY `friends_friendid_users_foreignkey` (`friendsid`),
  CONSTRAINT `friends_friendid_users_foreignkey` FOREIGN KEY (`friendsid`) REFERENCES `users` (`id`),
  CONSTRAINT `friends_userid_users_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friends
-- ----------------------------

-- ----------------------------
-- Table structure for `movies`
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name_en` varchar(32) DEFAULT NULL,
  `name_zh` varchar(255) DEFAULT NULL,
  `playbill` varchar(255) DEFAULT NULL COMMENT '海报地址',
  `len_film` time DEFAULT NULL,
  `producer` char(16) DEFAULT NULL COMMENT '制片国家',
  `douban_score` float DEFAULT '0' COMMENT '豆瓣评分',
  `language` char(16) DEFAULT NULL COMMENT '语言',
  `foreshow` varchar(255) DEFAULT NULL COMMENT '预告地址 默认豆瓣的预告地址',
  `summary` varchar(255) DEFAULT NULL COMMENT '电影剧情简介',
  `release` date DEFAULT NULL COMMENT '上映时间 只记录中国上映时间',
  `IMDbURI` varchar(255) DEFAULT NULL COMMENT 'IMDb链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES ('1', 'Wolverine 3', '金刚狼3：殊死一战 Logan', '/movie/img/playbill/p2431980130.jpg', '00:02:09', '美国', '0', '英语', 'https://movie.douban.com/trailer/212262/#content', '2029年，变种人大幅减少，X战警已经解散。身心疲惫的金刚狼罗根（休·杰克曼 Hugh Jackman 饰）自愈因子逐渐消失，整天饮酒度日，靠当司机养家。他在墨西哥边境隐居，并照顾着饱受病痛折磨的老X教授（帕特里克·斯图尔特 Patrick Stewart 饰）。有一天，一位陌生女子让罗根送一个叫劳拉（达芙妮·金 Dafne Keen 饰）的女孩去加拿大边境，一开始罗根拒绝了，但查尔斯一直在等着这个女孩的出现，劳拉拥有超强的战斗力，而且在许多方面都很像金刚狼。她被一个强大公司的幕后人物所追踪，因为她的DN', '2017-03-03', 'tt3315342');
INSERT INTO `movies` VALUES ('2', 'Wolverine 2', '金刚狼2', '/movie/img/playbill/p2431980130.jpg', '00:02:09', '美国', '0', '英语', 'https://movie.douban.com/trailer/212262/#content', '2029年，变种人大幅减少，X战警已经解散。身心疲惫的金刚狼罗根（休·杰克曼 Hugh Jackman 饰）自愈因子逐渐消失，整天饮酒度日，靠当司机养家。他在墨西哥边境隐居，并照顾着饱受病痛折磨的老X教授（帕特里克·斯图尔特 Patrick Stewart 饰）。有一天，一位陌生女子让罗根送一个叫劳拉（达芙妮·金 Dafne Keen 饰）的女孩去加拿大边境，一开始罗根拒绝了，但查尔斯一直在等着这个女孩的出现，劳拉拥有超强的战斗力，而且在许多方面都很像金刚狼。她被一个强大公司的幕后人物所追踪，因为她的DN', '2017-03-03', 'tt3315342');

-- ----------------------------
-- Table structure for `movies_peoples`
-- ----------------------------
DROP TABLE IF EXISTS `movies_peoples`;
CREATE TABLE `movies_peoples` (
  `movie_id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `type` char(32) DEFAULT NULL COMMENT '人种类- 导演 演员 编剧',
  PRIMARY KEY (`movie_id`,`people_id`),
  KEY `movies_peoples_writer_id_famouspeoples_foreignkey` (`people_id`),
  CONSTRAINT `movies_peoples_movie_id_movies_foreignkey` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movies_peoples_writer_id_famouspeoples_foreignkey` FOREIGN KEY (`people_id`) REFERENCES `famouspeoples` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movies_peoples
-- ----------------------------
INSERT INTO `movies_peoples` VALUES ('1', '1', '导演');
INSERT INTO `movies_peoples` VALUES ('2', '2', '导演');

-- ----------------------------
-- Table structure for `movies_spider_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `movies_spider_assignment`;
CREATE TABLE `movies_spider_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rank` varchar(4) NOT NULL,
  `link` varchar(50) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `score` varchar(4) NOT NULL,
  `quote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movies_spider_assignment
-- ----------------------------
INSERT INTO `movies_spider_assignment` VALUES ('1', '肖申克的救赎', '1', 'https://movie.douban.com/subject/1292052/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg', '9.6', '希望让人自由。');
INSERT INTO `movies_spider_assignment` VALUES ('2', '这个杀手不太冷', '2', 'https://movie.douban.com/subject/1295644/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p511118051.jpg', '9.4', '怪蜀黍和小萝莉不得不说的故事。');
INSERT INTO `movies_spider_assignment` VALUES ('3', '霸王别姬', '3', 'https://movie.douban.com/subject/1291546/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910813120.jpg', '9.5', '风华绝代。');
INSERT INTO `movies_spider_assignment` VALUES ('4', '阿甘正传', '4', 'https://movie.douban.com/subject/1292720/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p510876377.jpg', '9.4', '一部美国近现代史。');
INSERT INTO `movies_spider_assignment` VALUES ('5', '美丽人生', '5', 'https://movie.douban.com/subject/1292063/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p510861873.jpg', '9.5', '最美的谎言。');
INSERT INTO `movies_spider_assignment` VALUES ('6', '千与千寻', '6', 'https://movie.douban.com/subject/1291561/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1910830216.jpg', '9.2', '最好的宫崎骏，最好的久石让。 ');
INSERT INTO `movies_spider_assignment` VALUES ('7', '辛德勒的名单', '7', 'https://movie.douban.com/subject/1295124/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p492406163.jpg', '9.4', '拯救一个人，就是拯救整个世界。');
INSERT INTO `movies_spider_assignment` VALUES ('8', '泰坦尼克号', '8', 'https://movie.douban.com/subject/1292722/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p457760035.jpg', '9.2', '失去的才是永恒的。 ');
INSERT INTO `movies_spider_assignment` VALUES ('9', '盗梦空间', '9', 'https://movie.douban.com/subject/3541415/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p513344864.jpg', '9.2', '诺兰给了我们一场无法盗取的梦。');
INSERT INTO `movies_spider_assignment` VALUES ('10', '机器人总动员', '10', 'https://movie.douban.com/subject/2131459/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p449665982.jpg', '9.3', '小瓦力，大人生。');
INSERT INTO `movies_spider_assignment` VALUES ('11', '海上钢琴师', '11', 'https://movie.douban.com/subject/1292001/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p511146957.jpg', '9.2', '每个人都要走一条自己坚定了的路，就算是粉身碎骨。 ');
INSERT INTO `movies_spider_assignment` VALUES ('12', '三傻大闹宝莱坞', '12', 'https://movie.douban.com/subject/3793023/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p579729551.jpg', '9.1', '英俊版憨豆，高情商版谢耳朵。');
INSERT INTO `movies_spider_assignment` VALUES ('13', '忠犬八公的故事', '13', 'https://movie.douban.com/subject/3011091/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p524964016.jpg', '9.2', '永远都不能忘记你所爱的人。');
INSERT INTO `movies_spider_assignment` VALUES ('14', '放牛班的春天', '14', 'https://movie.douban.com/subject/1291549/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910824951.jpg', '9.2', '天籁一般的童声，是最接近上帝的存在。 ');
INSERT INTO `movies_spider_assignment` VALUES ('15', '大话西游之大圣娶亲', '15', 'https://movie.douban.com/subject/1292213/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p648365452.jpg', '9.1', '一生所爱。');
INSERT INTO `movies_spider_assignment` VALUES ('16', '教父', '16', 'https://movie.douban.com/subject/1291841/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910907404.jpg', '9.2', '千万不要记恨你的对手，这样会让你失去理智。');
INSERT INTO `movies_spider_assignment` VALUES ('17', '龙猫', '17', 'https://movie.douban.com/subject/1291560/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910829638.jpg', '9.1', '人人心中都有个龙猫，童年就永远不会消失。');
INSERT INTO `movies_spider_assignment` VALUES ('18', '乱世佳人', '18', 'https://movie.douban.com/subject/1300267/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1963126880.jpg', '9.2', 'Tomorrow is another day.');
INSERT INTO `movies_spider_assignment` VALUES ('19', '楚门的世界', '19', 'https://movie.douban.com/subject/1292064/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480420695.jpg', '9.0', '如果再也不能见到你，祝你早安，午安，晚安。');
INSERT INTO `movies_spider_assignment` VALUES ('20', '天堂电影院', '20', 'https://movie.douban.com/subject/1291828/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910901025.jpg', '9.1', '那些吻戏，那些青春，都在影院的黑暗里被泪水冲刷得无比清晰。');
INSERT INTO `movies_spider_assignment` VALUES ('21', '当幸福来敲门', '21', 'https://movie.douban.com/subject/1849031/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1312700628.jpg', '8.9', '平民励志片。 ');
INSERT INTO `movies_spider_assignment` VALUES ('22', '触不可及', '22', 'https://movie.douban.com/subject/6786002/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1454261925.jpg', '9.1', '满满温情的高雅喜剧。');
INSERT INTO `movies_spider_assignment` VALUES ('23', '搏击俱乐部', '23', 'https://movie.douban.com/subject/1292000/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910926158.jpg', '9.0', '邪恶与平庸蛰伏于同一个母体，在特定的时间互相对峙。');
INSERT INTO `movies_spider_assignment` VALUES ('24', '十二怒汉', '24', 'https://movie.douban.com/subject/1293182/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173577632.jpg', '9.3', '1957年的理想主义。 ');
INSERT INTO `movies_spider_assignment` VALUES ('25', '指环王3：王者无敌', '25', 'https://movie.douban.com/subject/1291552/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910825503.jpg', '9.1', '史诗的终章。');
INSERT INTO `movies_spider_assignment` VALUES ('26', '无间道', '26', 'https://movie.douban.com/subject/1307914/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2233971046.jpg', '9.0', '香港电影史上永不过时的杰作。');
INSERT INTO `movies_spider_assignment` VALUES ('27', '怦然心动', '27', 'https://movie.douban.com/subject/3319755/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p663036666.jpg', '8.9', '真正的幸福是来自内心深处。');
INSERT INTO `movies_spider_assignment` VALUES ('28', '熔炉', '28', 'https://movie.douban.com/subject/5912992/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1363250216.jpg', '9.2', '我们一路奋战不是为了改变世界，而是为了不让世界改变我们。');
INSERT INTO `movies_spider_assignment` VALUES ('29', '罗马假日', '29', 'https://movie.douban.com/subject/1293839/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2189265085.jpg', '8.9', '爱情哪怕只有一天。');
INSERT INTO `movies_spider_assignment` VALUES ('30', '天空之城', '30', 'https://movie.douban.com/subject/1291583/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1446261379.jpg', '9.0', '对天空的追逐，永不停止。 ');
INSERT INTO `movies_spider_assignment` VALUES ('31', '少年派的奇幻漂流', '31', 'https://movie.douban.com/subject/1929463/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1784592701.jpg', '9.0', '瑰丽壮观、无人能及的冒险之旅。');
INSERT INTO `movies_spider_assignment` VALUES ('32', '大话西游之月光宝盒', '32', 'https://movie.douban.com/subject/1299398/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1280323646.jpg', '8.9', '旷古烁今。');
INSERT INTO `movies_spider_assignment` VALUES ('33', '鬼子来了', '33', 'https://movie.douban.com/subject/1291858/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1181775734.jpg', '9.1', '对敌人的仁慈，就是对自己残忍。');
INSERT INTO `movies_spider_assignment` VALUES ('34', '两杆大烟枪', '34', 'https://movie.douban.com/subject/1293350/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792443418.jpg', '9.0', '4个臭皮匠顶个诸葛亮，盖·里奇果然不是盖的。');
INSERT INTO `movies_spider_assignment` VALUES ('35', '飞屋环游记', '35', 'https://movie.douban.com/subject/2129039/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p465583562.jpg', '8.9', '最后那些最无聊的事情，才是最值得怀念的。 ');
INSERT INTO `movies_spider_assignment` VALUES ('36', '蝙蝠侠：黑暗骑士', '36', 'https://movie.douban.com/subject/1851857/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p462657443.jpg', '9.0', '无尽的黑暗。');
INSERT INTO `movies_spider_assignment` VALUES ('37', '飞越疯人院', '37', 'https://movie.douban.com/subject/1292224/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792238287.jpg', '9.0', '自由万岁。');
INSERT INTO `movies_spider_assignment` VALUES ('38', '窃听风暴', '38', 'https://movie.douban.com/subject/1900841/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1808872109.jpg', '9.1', '别样人生。');
INSERT INTO `movies_spider_assignment` VALUES ('39', '星际穿越', '39', 'https://movie.douban.com/subject/1889243/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2206088801.jpg', '9.1', '爱是一种力量，让我们超越时空感知它的存在。');
INSERT INTO `movies_spider_assignment` VALUES ('40', '活着', '40', 'https://movie.douban.com/subject/1292365/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173575484.jpg', '9.0', '张艺谋最好的电影。');
INSERT INTO `movies_spider_assignment` VALUES ('41', '海豚湾', '41', 'https://movie.douban.com/subject/3442220/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455222172.jpg', '9.3', '海豚的微笑，是世界上最高明的伪装。');
INSERT INTO `movies_spider_assignment` VALUES ('42', '闻香识女人', '42', 'https://movie.douban.com/subject/1298624/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p925123037.jpg', '8.9', '史上最美的探戈。');
INSERT INTO `movies_spider_assignment` VALUES ('43', 'V字仇杀队', '43', 'https://movie.douban.com/subject/1309046/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p803516632.jpg', '8.8', '一张面具背后的理想与革命。');
INSERT INTO `movies_spider_assignment` VALUES ('44', '美丽心灵', '44', 'https://movie.douban.com/subject/1306029/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1665997400.jpg', '8.9', '爱是一切逻辑和原由。');
INSERT INTO `movies_spider_assignment` VALUES ('45', '教父2', '45', 'https://movie.douban.com/subject/1299131/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p616779231.jpg', '9.1', '优雅的孤独。');
INSERT INTO `movies_spider_assignment` VALUES ('46', '指环王2：双塔奇兵', '46', 'https://movie.douban.com/subject/1291572/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p909265336.jpg', '8.9', '承前启后的史诗篇章。');
INSERT INTO `movies_spider_assignment` VALUES ('47', '指环王1：魔戒再现', '47', 'https://movie.douban.com/subject/1291571/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1354436051.jpg', '8.9', '传说的开始。');
INSERT INTO `movies_spider_assignment` VALUES ('48', '哈尔的移动城堡', '48', 'https://movie.douban.com/subject/1308807/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2174346180.jpg', '8.8', '带着心爱的人在天空飞翔。');
INSERT INTO `movies_spider_assignment` VALUES ('49', '天使爱美丽', '49', 'https://movie.douban.com/subject/1292215/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p803896904.jpg', '8.7', '法式小清新。 ');
INSERT INTO `movies_spider_assignment` VALUES ('50', '情书', '50', 'https://movie.douban.com/subject/1292220/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p449897379.jpg', '8.8', '暗恋的极致。');
INSERT INTO `movies_spider_assignment` VALUES ('51', '死亡诗社', '51', 'https://movie.douban.com/subject/1291548/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910824340.jpg', '8.9', '当一个死水般的体制内出现一个活跃的变数时，所有的腐臭都站在了光明的对面。');
INSERT INTO `movies_spider_assignment` VALUES ('52', '美国往事', '52', 'https://movie.douban.com/subject/1292262/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p477229647.jpg', '9.1', '往事如烟，无处祭奠。');
INSERT INTO `movies_spider_assignment` VALUES ('53', '七宗罪', '53', 'https://movie.douban.com/subject/1292223/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p457631605.jpg', '8.7', '警察抓小偷，老鼠玩死猫。');
INSERT INTO `movies_spider_assignment` VALUES ('54', '钢琴家', '54', 'https://movie.douban.com/subject/1296736/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792484461.jpg', '9.0', '音乐能化解仇恨。');
INSERT INTO `movies_spider_assignment` VALUES ('55', '狮子王', '55', 'https://movie.douban.com/subject/1301753/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2277799019.jpg', '8.9', '动物版《哈姆雷特》。');
INSERT INTO `movies_spider_assignment` VALUES ('56', '勇敢的心', '56', 'https://movie.douban.com/subject/1294639/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1374546770.jpg', '8.8', '史诗大片的典范。');
INSERT INTO `movies_spider_assignment` VALUES ('57', '致命魔术', '57', 'https://movie.douban.com/subject/1780330/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480383375.jpg', '8.8', '孪生蝙蝠侠大战克隆金刚狼。');
INSERT INTO `movies_spider_assignment` VALUES ('58', '被嫌弃的松子的一生', '58', 'https://movie.douban.com/subject/1787291/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p453723669.jpg', '8.9', '以戏谑来戏谑戏谑。');
INSERT INTO `movies_spider_assignment` VALUES ('59', '剪刀手爱德华', '59', 'https://movie.douban.com/subject/1292370/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p480956937.jpg', '8.7', '浪漫忧郁的成人童话。');
INSERT INTO `movies_spider_assignment` VALUES ('60', '辩护人', '60', 'https://movie.douban.com/subject/21937445/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2158166535.jpg', '9.1', '电影的现实意义大过电影本身。');
INSERT INTO `movies_spider_assignment` VALUES ('61', '音乐之声', '61', 'https://movie.douban.com/subject/1294408/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p453788577.jpg', '8.9', '用音乐化解仇恨，让歌声串起美好。');
INSERT INTO `movies_spider_assignment` VALUES ('62', '小鞋子', '62', 'https://movie.douban.com/subject/1303021/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173580603.jpg', '9.1', '奔跑的孩子是天使。');
INSERT INTO `movies_spider_assignment` VALUES ('63', '饮食男女', '63', 'https://movie.douban.com/subject/1291818/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910899751.jpg', '9.0', '人生不能像做菜，把所有的料都准备好了才下锅。');
INSERT INTO `movies_spider_assignment` VALUES ('64', '控方证人', '64', 'https://movie.douban.com/subject/1296141/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1505392928.jpg', '9.6', '比利·怀德满分作品。');
INSERT INTO `movies_spider_assignment` VALUES ('65', '低俗小说', '65', 'https://movie.douban.com/subject/1291832/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910902213.jpg', '8.7', '故事的高级讲法。');
INSERT INTO `movies_spider_assignment` VALUES ('66', '入殓师', '66', 'https://movie.douban.com/subject/2149806/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p594972928.jpg', '8.8', '死可能是一道门，逝去并不是终结，而是超越，走向下一程。');
INSERT INTO `movies_spider_assignment` VALUES ('67', '沉默的羔羊', '67', 'https://movie.douban.com/subject/1293544/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1593414327.jpg', '8.7', '安东尼·霍普金斯的顶级表演。');
INSERT INTO `movies_spider_assignment` VALUES ('68', '本杰明·巴顿奇事', '68', 'https://movie.douban.com/subject/1485260/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p475749652.jpg', '8.7', '在时间之河里感受溺水之苦。');
INSERT INTO `movies_spider_assignment` VALUES ('69', '蝴蝶效应', '69', 'https://movie.douban.com/subject/1292343/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1783650111.jpg', '8.7', '人的命运被自己瞬间的抉择改变。');
INSERT INTO `movies_spider_assignment` VALUES ('70', '黑客帝国', '70', 'https://movie.douban.com/subject/1291843/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910908765.jpg', '8.8', '视觉革命。');
INSERT INTO `movies_spider_assignment` VALUES ('71', '拯救大兵瑞恩', '71', 'https://movie.douban.com/subject/1292849/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1014542496.jpg', '8.8', '美利坚精神输出大片No1.');
INSERT INTO `movies_spider_assignment` VALUES ('72', '玛丽和马克思', '72', 'https://movie.douban.com/subject/3072124/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1820615077.jpg', '8.9', '你是我最好的朋友，你是我唯一的朋友 。');
INSERT INTO `movies_spider_assignment` VALUES ('73', '西西里的美丽传说', '73', 'https://movie.douban.com/subject/1292402/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p792400696.jpg', '8.7', '美丽无罪。');
INSERT INTO `movies_spider_assignment` VALUES ('74', '素媛', '74', 'https://movie.douban.com/subject/21937452/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2118532944.jpg', '9.1', '受过伤害的人总是笑得最开心，因为他们不愿意让身边的人承受一样的痛苦。');
INSERT INTO `movies_spider_assignment` VALUES ('75', '心灵捕手', '75', 'https://movie.douban.com/subject/1292656/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480965695.jpg', '8.7', '人生中应该拥有这样的一段豁然开朗。');
INSERT INTO `movies_spider_assignment` VALUES ('76', '幽灵公主', '76', 'https://movie.douban.com/subject/1297359/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1613191025.jpg', '8.8', '人与自然的战争史诗。');
INSERT INTO `movies_spider_assignment` VALUES ('77', '第六感', '77', 'https://movie.douban.com/subject/1297630/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2220184425.jpg', '8.8', '深入内心的恐怖，出人意料的结局。');
INSERT INTO `movies_spider_assignment` VALUES ('78', '阳光灿烂的日子', '78', 'https://movie.douban.com/subject/1291875/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p967457079.jpg', '8.7', '一场华丽的意淫。');
INSERT INTO `movies_spider_assignment` VALUES ('79', '让子弹飞', '79', 'https://movie.douban.com/subject/3742360/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1512562287.jpg', '8.7', '你给我翻译翻译，神马叫做TMD的惊喜。');
INSERT INTO `movies_spider_assignment` VALUES ('80', '大鱼', '80', 'https://movie.douban.com/subject/1291545/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p692813374.jpg', '8.7', '抱着梦想而活着的人是幸福的，怀抱梦想而死去的人是不朽的。');
INSERT INTO `movies_spider_assignment` VALUES ('81', '春光乍泄', '81', 'https://movie.douban.com/subject/1292679/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p465939041.jpg', '8.7', '爱情纠缠，男女一致。');
INSERT INTO `movies_spider_assignment` VALUES ('82', '射雕英雄传之东成西就', '82', 'https://movie.douban.com/subject/1316510/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1993903133.jpg', '8.7', '百看不厌。 ');
INSERT INTO `movies_spider_assignment` VALUES ('83', '大闹天宫', '83', 'https://movie.douban.com/subject/1418019/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2184505167.jpg', '9.2', '经典之作，历久弥新。');
INSERT INTO `movies_spider_assignment` VALUES ('84', '阳光姐妹淘', '84', 'https://movie.douban.com/subject/4917726/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1374786017.jpg', '8.8', '再多各自牛逼的时光，也比不上一起傻逼的岁月。 ');
INSERT INTO `movies_spider_assignment` VALUES ('85', '重庆森林', '85', 'https://movie.douban.com/subject/1291999/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792381411.jpg', '8.6', '寂寞没有期限。');
INSERT INTO `movies_spider_assignment` VALUES ('86', '上帝之城', '86', 'https://movie.douban.com/subject/1292208/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455677490.jpg', '8.9', '被上帝抛弃了的上帝之城。');
INSERT INTO `movies_spider_assignment` VALUES ('87', '禁闭岛', '87', 'https://movie.douban.com/subject/2334904/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1832875827.jpg', '8.6', '昔日翩翩少年，今日大腹便便。');
INSERT INTO `movies_spider_assignment` VALUES ('88', '甜蜜蜜', '88', 'https://movie.douban.com/subject/1305164/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2223011274.jpg', '8.7', '相逢只要一瞬间，等待却像是一辈子。');
INSERT INTO `movies_spider_assignment` VALUES ('89', '致命ID', '89', 'https://movie.douban.com/subject/1297192/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p453720880.jpg', '8.6', '最不可能的那个人永远是最可能的。');
INSERT INTO `movies_spider_assignment` VALUES ('90', '告白', '90', 'https://movie.douban.com/subject/4268598/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p689520756.jpg', '8.6', '没有一人完全善，也没有一人完全恶。');
INSERT INTO `movies_spider_assignment` VALUES ('91', '一一', '91', 'https://movie.douban.com/subject/1292434/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2119675128.jpg', '8.9', '我们都曾经是一一。');
INSERT INTO `movies_spider_assignment` VALUES ('92', '加勒比海盗', '92', 'https://movie.douban.com/subject/1298070/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1596085504.jpg', '8.6', '约翰尼·德普的独角戏。');
INSERT INTO `movies_spider_assignment` VALUES ('93', '爱在黎明破晓前', '93', 'https://movie.douban.com/subject/1296339/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1486234122.jpg', '8.7', '缘分是个连绵词，最美不过一瞬。');
INSERT INTO `movies_spider_assignment` VALUES ('94', '萤火虫之墓', '94', 'https://movie.douban.com/subject/1293318/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1157334208.jpg', '8.7', '幸福是生生不息，却难以触及的远。 ');
INSERT INTO `movies_spider_assignment` VALUES ('95', '阿凡达', '95', 'https://movie.douban.com/subject/1652587/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p492458287.jpg', '8.6', '绝对意义上的美轮美奂。');
INSERT INTO `movies_spider_assignment` VALUES ('96', '风之谷', '96', 'https://movie.douban.com/subject/1291585/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1917567652.jpg', '8.8', '动画片的圣经。');
INSERT INTO `movies_spider_assignment` VALUES ('97', '布达佩斯大饭店', '97', 'https://movie.douban.com/subject/11525673/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2178872593.jpg', '8.7', '小清新的故事里注入了大历史的情怀。');
INSERT INTO `movies_spider_assignment` VALUES ('98', '狩猎', '98', 'https://movie.douban.com/subject/6985810/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1546987967.jpg', '9.0', '人言可畏。');
INSERT INTO `movies_spider_assignment` VALUES ('99', '断背山', '99', 'https://movie.douban.com/subject/1418834/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p513535588.jpg', '8.6', '每个人心中都有一座断背山。');
INSERT INTO `movies_spider_assignment` VALUES ('100', '爱在日落黄昏时', '100', 'https://movie.douban.com/subject/1291990/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910924055.jpg', '8.7', '九年后的重逢是世俗和责任的交叠，没了悸动和青涩，沧桑而温暖。');
INSERT INTO `movies_spider_assignment` VALUES ('101', '猫鼠游戏', '101', 'https://movie.douban.com/subject/1305487/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p453924541.jpg', '8.7', '骗子大师和执著警探的你追我跑故事。 ');
INSERT INTO `movies_spider_assignment` VALUES ('102', '侧耳倾听', '102', 'https://movie.douban.com/subject/1297052/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456692072.jpg', '8.8', '少女情怀总是诗。');
INSERT INTO `movies_spider_assignment` VALUES ('103', '摩登时代', '103', 'https://movie.douban.com/subject/1294371/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2173707976.jpg', '9.2', '大时代中的人生，小人物的悲喜。');
INSERT INTO `movies_spider_assignment` VALUES ('104', '驯龙高手', '104', 'https://movie.douban.com/subject/2353023/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p450042258.jpg', '8.7', '和谐的生活离不开摸头与被摸头。');
INSERT INTO `movies_spider_assignment` VALUES ('105', '末代皇帝', '105', 'https://movie.douban.com/subject/1293172/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p452088641.jpg', '8.8', '“不要跟我比惨，我比你更惨”再适合这部电影不过了。');
INSERT INTO `movies_spider_assignment` VALUES ('106', '海洋', '106', 'https://movie.douban.com/subject/3443389/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p497010372.jpg', '9.0', '大海啊，不全是水。');
INSERT INTO `movies_spider_assignment` VALUES ('107', '超脱', '107', 'https://movie.douban.com/subject/5322596/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1305562621.jpg', '8.7', '穷尽一生，我们要学会的，不过是彼此拥抱。');
INSERT INTO `movies_spider_assignment` VALUES ('108', '哈利·波特与魔法石', '108', 'https://movie.douban.com/subject/1295038/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p804947166.jpg', '8.6', '童话世界的开端。');
INSERT INTO `movies_spider_assignment` VALUES ('109', '幸福终点站', '109', 'https://movie.douban.com/subject/1292274/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p854757687.jpg', '8.6', '有时候幸福需要等一等。 ');
INSERT INTO `movies_spider_assignment` VALUES ('110', '燃情岁月', '110', 'https://movie.douban.com/subject/1295865/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1023654037.jpg', '8.8', '传奇，不是每个人都可以拥有。');
INSERT INTO `movies_spider_assignment` VALUES ('111', '穿条纹睡衣的男孩', '111', 'https://movie.douban.com/subject/3008247/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1473670352.jpg', '8.8', '尽管有些不切实际的幻想，这部电影依旧是一部感人肺腑的佳作。');
INSERT INTO `movies_spider_assignment` VALUES ('112', '谍影重重3', '112', 'https://movie.douban.com/subject/1578507/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792223507.jpg', '8.7', '像吃了苏打饼一样干脆的电影。');
INSERT INTO `movies_spider_assignment` VALUES ('113', '电锯惊魂', '113', 'https://movie.douban.com/subject/1417598/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2163771304.jpg', '8.6', '真相就在眼前。');
INSERT INTO `movies_spider_assignment` VALUES ('114', '菊次郎的夏天', '114', 'https://movie.douban.com/subject/1293359/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p751835224.jpg', '8.7', '从没见过那么流氓的温柔，从没见过那么温柔的流氓。');
INSERT INTO `movies_spider_assignment` VALUES ('115', '神偷奶爸', '115', 'https://movie.douban.com/subject/3287562/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792776858.jpg', '8.5', 'Mr. I Don\'t Care其实也有Care的时候。');
INSERT INTO `movies_spider_assignment` VALUES ('116', '真爱至上', '116', 'https://movie.douban.com/subject/1292401/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p475600770.jpg', '8.5', '爱，是个动词。');
INSERT INTO `movies_spider_assignment` VALUES ('117', '借东西的小人阿莉埃蒂', '117', 'https://movie.douban.com/subject/4202302/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p617533616.jpg', '8.7', '曾经的那段美好会沉淀为一辈子的记忆。');
INSERT INTO `movies_spider_assignment` VALUES ('118', '虎口脱险', '118', 'https://movie.douban.com/subject/1296909/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2399597512.jpg', '8.9', '永远看不腻的喜剧。');
INSERT INTO `movies_spider_assignment` VALUES ('119', '雨人', '119', 'https://movie.douban.com/subject/1291870/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p942376281.jpg', '8.6', '生活在自己的世界里，也可以让周围的人显得可笑和渺小。');
INSERT INTO `movies_spider_assignment` VALUES ('120', '倩女幽魂', '120', 'https://movie.douban.com/subject/1297447/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2347277555.jpg', '8.6', '两张绝世的脸。 ');
INSERT INTO `movies_spider_assignment` VALUES ('121', '岁月神偷', '121', 'https://movie.douban.com/subject/3792799/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456666151.jpg', '8.6', '岁月流逝，来日可追。');
INSERT INTO `movies_spider_assignment` VALUES ('122', '消失的爱人', '122', 'https://movie.douban.com/subject/21318488/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2221768894.jpg', '8.7', '');
INSERT INTO `movies_spider_assignment` VALUES ('123', '七武士', '123', 'https://movie.douban.com/subject/1295399/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p647099823.jpg', '9.1', '时代悲歌。');
INSERT INTO `movies_spider_assignment` VALUES ('124', '贫民窟的百万富翁', '124', 'https://movie.douban.com/subject/2209573/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p470476887.jpg', '8.5', '上帝之城+猜火车+阿甘正传+开心辞典=山寨富翁');
INSERT INTO `movies_spider_assignment` VALUES ('125', '记忆碎片', '125', 'https://movie.douban.com/subject/1304447/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p641688453.jpg', '8.5', '一个针管引发的血案。');
INSERT INTO `movies_spider_assignment` VALUES ('126', '东邪西毒', '126', 'https://movie.douban.com/subject/1292328/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1982176012.jpg', '8.6', '电影诗。');
INSERT INTO `movies_spider_assignment` VALUES ('127', '恐怖直播', '127', 'https://movie.douban.com/subject/21360417/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2016930906.jpg', '8.7', '恐怖分子的“秋菊打官司”。');
INSERT INTO `movies_spider_assignment` VALUES ('128', '疯狂原始人', '128', 'https://movie.douban.com/subject/1907966/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1867084027.jpg', '8.7', '老少皆宜，这就是好莱坞动画的魅力。');
INSERT INTO `movies_spider_assignment` VALUES ('129', '怪兽电力公司', '129', 'https://movie.douban.com/subject/1291579/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1805127697.jpg', '8.6', '不要给它起名字，起了名字就有感情了。');
INSERT INTO `movies_spider_assignment` VALUES ('130', '杀人回忆', '130', 'https://movie.douban.com/subject/1300299/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p480225538.jpg', '8.6', '关于连环杀人悬案的集体回忆。');
INSERT INTO `movies_spider_assignment` VALUES ('131', '穿越时空的少女', '131', 'https://movie.douban.com/subject/1937946/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2079334286.jpg', '8.6', '爱上未来的你。 ');
INSERT INTO `movies_spider_assignment` VALUES ('132', '卢旺达饭店', '132', 'https://movie.douban.com/subject/1291822/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2159368352.jpg', '8.8', '当这个世界闭上双眼，他却敞开了怀抱。');
INSERT INTO `movies_spider_assignment` VALUES ('133', '红辣椒', '133', 'https://movie.douban.com/subject/1865703/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p672363704.jpg', '8.8', '梦的勾结。');
INSERT INTO `movies_spider_assignment` VALUES ('134', '魂断蓝桥', '134', 'https://movie.douban.com/subject/1293964/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2351134499.jpg', '8.8', '中国式内在的美国电影。');
INSERT INTO `movies_spider_assignment` VALUES ('135', '黑天鹅', '135', 'https://movie.douban.com/subject/1978709/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p823724107.jpg', '8.5', '黑暗之美。');
INSERT INTO `movies_spider_assignment` VALUES ('136', '恋恋笔记本', '136', 'https://movie.douban.com/subject/1309163/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p483604864.jpg', '8.5', '爱情没有那么多借口，如果不能圆满，只能说明爱的不够。 ');
INSERT INTO `movies_spider_assignment` VALUES ('137', '猜火车', '137', 'https://movie.douban.com/subject/1292528/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p513567548.jpg', '8.5', '不可猜的青春迷笛。 ');
INSERT INTO `movies_spider_assignment` VALUES ('138', '英雄本色', '138', 'https://movie.douban.com/subject/1297574/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2157672975.jpg', '8.7', '英雄泪短，兄弟情长。 ');
INSERT INTO `movies_spider_assignment` VALUES ('139', '喜宴', '139', 'https://movie.douban.com/subject/1303037/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2173713676.jpg', '8.8', '中国家庭的喜怒哀乐忍。');
INSERT INTO `movies_spider_assignment` VALUES ('140', '傲慢与偏见', '140', 'https://movie.douban.com/subject/1418200/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p452005185.jpg', '8.4', '爱是摈弃傲慢与偏见之后的曙光。');
INSERT INTO `movies_spider_assignment` VALUES ('141', '教父3', '141', 'https://movie.douban.com/subject/1294240/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2169664351.jpg', '8.7', '任何信念的力量，都无法改变命运。');
INSERT INTO `movies_spider_assignment` VALUES ('142', '雨中曲', '142', 'https://movie.douban.com/subject/1293460/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1612355875.jpg', '8.9', '骨灰级歌舞片。');
INSERT INTO `movies_spider_assignment` VALUES ('143', '完美的世界', '143', 'https://movie.douban.com/subject/1300992/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792403691.jpg', '9.0', '坏人的好总是比好人的好来得更感人。');
INSERT INTO `movies_spider_assignment` VALUES ('144', '玩具总动员3', '144', 'https://movie.douban.com/subject/1858711/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1283675359.jpg', '8.7', '跨度十五年的欢乐与泪水。');
INSERT INTO `movies_spider_assignment` VALUES ('145', '纵横四海', '145', 'https://movie.douban.com/subject/1295409/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p933122297.jpg', '8.7', '香港浪漫主义警匪动作片的巅峰之作。');
INSERT INTO `movies_spider_assignment` VALUES ('146', '小森林 夏秋篇', '146', 'https://movie.douban.com/subject/25814705/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2221319641.jpg', '8.9', '');
INSERT INTO `movies_spider_assignment` VALUES ('147', '人工智能', '147', 'https://movie.douban.com/subject/1302827/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792257137.jpg', '8.6', '对爱的执着，可以超越一切。');
INSERT INTO `movies_spider_assignment` VALUES ('148', '萤火之森', '148', 'https://movie.douban.com/subject/5989818/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1272904657.jpg', '8.7', '触不到的恋人。');
INSERT INTO `movies_spider_assignment` VALUES ('149', '喜剧之王', '149', 'https://movie.douban.com/subject/1302425/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1043597424.jpg', '8.4', '我是一个演员。');
INSERT INTO `movies_spider_assignment` VALUES ('150', '我是山姆', '150', 'https://movie.douban.com/subject/1306861/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p652417775.jpg', '8.8', '爱并不需要智商 。');
INSERT INTO `movies_spider_assignment` VALUES ('151', '香水', '151', 'https://movie.douban.com/subject/1760622/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p470006658.jpg', '8.4', '一个单凭体香达到高潮的男人。');
INSERT INTO `movies_spider_assignment` VALUES ('152', '冰川时代', '152', 'https://movie.douban.com/subject/1291578/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910895719.jpg', '8.4', '松鼠才是角儿。');
INSERT INTO `movies_spider_assignment` VALUES ('153', '浪潮', '153', 'https://movie.douban.com/subject/2297265/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1344888983.jpg', '8.7', '世界离独裁只有五天。');
INSERT INTO `movies_spider_assignment` VALUES ('154', '撞车', '154', 'https://movie.douban.com/subject/1388216/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2075132390.jpg', '8.6', '天使与魔鬼的冲撞。');
INSERT INTO `movies_spider_assignment` VALUES ('155', '哈利·波特与死亡圣器(下)', '155', 'https://movie.douban.com/subject/3011235/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p917846733.jpg', '8.6', '10年的完美句点。');
INSERT INTO `movies_spider_assignment` VALUES ('156', '7号房的礼物', '156', 'https://movie.douban.com/subject/10777687/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1816276065.jpg', '8.6', '《我是山姆》的《美丽人生》。');
INSERT INTO `movies_spider_assignment` VALUES ('157', '朗读者', '157', 'https://movie.douban.com/subject/2213597/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1140984198.jpg', '8.5', '当爱情跨越年龄的界限，它似乎能变得更久远一点，成为一种责任，一种水到渠成的相濡以沫。 ');
INSERT INTO `movies_spider_assignment` VALUES ('158', '秒速5厘米', '158', 'https://movie.douban.com/subject/2043546/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p982896012.jpg', '8.4', '青春就是放弃和怀念。');
INSERT INTO `movies_spider_assignment` VALUES ('159', '碧海蓝天', '159', 'https://movie.douban.com/subject/1300960/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p455724599.jpg', '8.7', '在那片深蓝中，感受来自大海的忧伤寂寞与美丽自由。');
INSERT INTO `movies_spider_assignment` VALUES ('160', '追随', '160', 'https://movie.douban.com/subject/1397546/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2074443514.jpg', '9.0', '诺兰的牛逼来源于内心散发出的恐惧。');
INSERT INTO `movies_spider_assignment` VALUES ('161', '花样年华', '161', 'https://movie.douban.com/subject/1291557/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1910828286.jpg', '8.4', '偷情本没有这样美。');
INSERT INTO `movies_spider_assignment` VALUES ('162', '罗生门', '162', 'https://movie.douban.com/subject/1291879/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1864872647.jpg', '8.7', '人生的N种可能性。');
INSERT INTO `movies_spider_assignment` VALUES ('163', '梦之安魂曲', '163', 'https://movie.douban.com/subject/1292270/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p884936202.jpg', '8.7', '一场没有春天的噩梦。');
INSERT INTO `movies_spider_assignment` VALUES ('164', '战争之王', '164', 'https://movie.douban.com/subject/1419936/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p453719066.jpg', '8.5', '做一颗让别人需要你的棋子。');
INSERT INTO `movies_spider_assignment` VALUES ('165', '可可西里', '165', 'https://movie.douban.com/subject/1308857/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2363208684.jpg', '8.6', '坚硬的信仰。');
INSERT INTO `movies_spider_assignment` VALUES ('166', '一次别离', '166', 'https://movie.douban.com/subject/5964718/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2189835254.jpg', '8.7', '只有有信仰的人才能说出事实真相。');
INSERT INTO `movies_spider_assignment` VALUES ('167', '海盗电台', '167', 'https://movie.douban.com/subject/3007773/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p769608791.jpg', '8.6', '生命不止，摇滚不死。');
INSERT INTO `movies_spider_assignment` VALUES ('168', '心迷宫', '168', 'https://movie.douban.com/subject/25917973/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2275298525.jpg', '8.6', '');
INSERT INTO `movies_spider_assignment` VALUES ('169', '唐伯虎点秋香', '169', 'https://movie.douban.com/subject/1306249/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1946455272.jpg', '8.3', '华太师是黄霑，吴镇宇四大才子之一。');
INSERT INTO `movies_spider_assignment` VALUES ('170', '超能陆战队', '170', 'https://movie.douban.com/subject/11026735/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2224568669.jpg', '8.6', '');
INSERT INTO `movies_spider_assignment` VALUES ('171', '时空恋旅人', '171', 'https://movie.douban.com/subject/10577869/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2070153774.jpg', '8.6', '把每天当作最后一天般珍惜度过，积极拥抱生活，就是幸福。');
INSERT INTO `movies_spider_assignment` VALUES ('172', '谍影重重2', '172', 'https://movie.douban.com/subject/1308767/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p667644866.jpg', '8.5', '谁说王家卫镜头很晃？');
INSERT INTO `movies_spider_assignment` VALUES ('173', '谍影重重', '173', 'https://movie.douban.com/subject/1304102/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1597183981.jpg', '8.5', '哗啦啦啦啦，天在下雨，哗啦啦啦啦，云在哭泣……找自己。');
INSERT INTO `movies_spider_assignment` VALUES ('174', '迁徙的鸟', '174', 'https://movie.douban.com/subject/1292281/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2238274168.jpg', '9.1', '最美的飞翔。');
INSERT INTO `movies_spider_assignment` VALUES ('175', '地球上的星星', '175', 'https://movie.douban.com/subject/2363506/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1973489335.jpg', '8.8', '天使保护事件始末。');
INSERT INTO `movies_spider_assignment` VALUES ('176', '荒野生存', '176', 'https://movie.douban.com/subject/1905462/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p465687407.jpg', '8.6', '出门必备：本草纲目。');
INSERT INTO `movies_spider_assignment` VALUES ('177', '蝙蝠侠：黑暗骑士崛起', '177', 'https://movie.douban.com/subject/3395373/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1706428744.jpg', '8.5', '诺兰就是保证。');
INSERT INTO `movies_spider_assignment` VALUES ('178', '阿飞正传', '178', 'https://movie.douban.com/subject/1305690/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p924558512.jpg', '8.5', '王家卫是一种风格，张国荣是一个代表。');
INSERT INTO `movies_spider_assignment` VALUES ('179', '绿里奇迹', '179', 'https://movie.douban.com/subject/1300374/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p767586451.jpg', '8.7', '天使暂时离开。');
INSERT INTO `movies_spider_assignment` VALUES ('180', '勇闯夺命岛', '180', 'https://movie.douban.com/subject/1292728/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p636048104.jpg', '8.5', '类型片的极致。 ');
INSERT INTO `movies_spider_assignment` VALUES ('181', '荒蛮故事', '181', 'https://movie.douban.com/subject/24750126/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2192834364.jpg', '8.7', '');
INSERT INTO `movies_spider_assignment` VALUES ('182', '恐怖游轮', '182', 'https://movie.douban.com/subject/3011051/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p462470694.jpg', '8.3', '不要企图在重复中寻找已经失去的爱。');
INSERT INTO `movies_spider_assignment` VALUES ('183', '惊魂记', '183', 'https://movie.douban.com/subject/1293181/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1021883305.jpg', '8.8', '故事的反转与反转，分裂电影的始祖。');
INSERT INTO `movies_spider_assignment` VALUES ('184', '燕尾蝶', '184', 'https://movie.douban.com/subject/1307793/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p532195562.jpg', '8.6', '现实与童话交相辉映的旅程。');
INSERT INTO `movies_spider_assignment` VALUES ('185', '魔女宅急便', '185', 'https://movie.douban.com/subject/1307811/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456676352.jpg', '8.4', '宫崎骏的电影总让人感觉世界是美好的，阳光明媚的。');
INSERT INTO `movies_spider_assignment` VALUES ('186', '卡萨布兰卡', '186', 'https://movie.douban.com/subject/1296753/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1244791866.jpg', '8.6', '与同名歌曲无关。');
INSERT INTO `movies_spider_assignment` VALUES ('187', '再次出发之纽约遇见你', '187', 'https://movie.douban.com/subject/6874403/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2250287733.jpg', '8.5', '爱我就给我看你的播放列表。');
INSERT INTO `movies_spider_assignment` VALUES ('188', '达拉斯买家俱乐部', '188', 'https://movie.douban.com/subject/1793929/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2166160837.jpg', '8.6', 'Jared Leto的腿比女人还美！');
INSERT INTO `movies_spider_assignment` VALUES ('189', '小森林 冬春篇', '189', 'https://movie.douban.com/subject/25814707/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2215147728.jpg', '8.9', '');
INSERT INTO `movies_spider_assignment` VALUES ('190', '英国病人', '190', 'https://movie.douban.com/subject/1291853/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2408623752.jpg', '8.4', 'In memory, love lives forever...');
INSERT INTO `movies_spider_assignment` VALUES ('191', '这个男人来自地球', '191', 'https://movie.douban.com/subject/2300586/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p513303986.jpg', '8.5', '科幻真正的魅力不是视觉效果能取代的。 ');
INSERT INTO `movies_spider_assignment` VALUES ('192', '变脸', '192', 'https://movie.douban.com/subject/1292659/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173855883.jpg', '8.4', '当发哥的风衣、墨镜出现在了凯奇身上⋯⋯');
INSERT INTO `movies_spider_assignment` VALUES ('193', '未麻的部屋', '193', 'https://movie.douban.com/subject/1395091/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1351050722.jpg', '8.8', '好的剧本是，就算你猜到了结局也猜不到全部。');
INSERT INTO `movies_spider_assignment` VALUES ('194', '东京物语', '194', 'https://movie.douban.com/subject/1291568/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910832390.jpg', '9.2', '东京那么大，如果有一天走失了，恐怕一辈子不能再相见。');
INSERT INTO `movies_spider_assignment` VALUES ('195', '终结者2：审判日', '195', 'https://movie.douban.com/subject/1291844/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910909085.jpg', '8.5', '少见的超越首部的续集，动作片中的经典。');
INSERT INTO `movies_spider_assignment` VALUES ('196', '叫我第一名', '196', 'https://movie.douban.com/subject/4798888/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p496133870.jpg', '8.6', '乐观比一切都有力量。');
INSERT INTO `movies_spider_assignment` VALUES ('197', 'E.T. 外星人', '197', 'https://movie.douban.com/subject/1294638/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p984732992.jpg', '8.5', '生病的E.T.皮肤的颜色就像柿子饼。');
INSERT INTO `movies_spider_assignment` VALUES ('198', '被解救的姜戈', '198', 'https://movie.douban.com/subject/6307447/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1959232369.jpg', '8.5', '热血沸腾，那个低俗、性感的无耻混蛋又来了。');
INSERT INTO `movies_spider_assignment` VALUES ('199', '爆裂鼓手', '199', 'https://movie.douban.com/subject/25773932/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2220776342.jpg', '8.6', '');
INSERT INTO `movies_spider_assignment` VALUES ('200', '牯岭街少年杀人事件', '200', 'https://movie.douban.com/subject/1292329/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p848381236.jpg', '8.7', '弱者送给弱者的一刀。');
INSERT INTO `movies_spider_assignment` VALUES ('201', '末路狂花', '201', 'https://movie.douban.com/subject/1291992/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p794583044.jpg', '8.7', '没有了退路，只好飞向自由。');
INSERT INTO `movies_spider_assignment` VALUES ('202', '穆赫兰道', '202', 'https://movie.douban.com/subject/1292217/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792248233.jpg', '8.3', '大卫·林奇的梦境迷宫。');
INSERT INTO `movies_spider_assignment` VALUES ('203', '发条橙', '203', 'https://movie.douban.com/subject/1292233/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p529908155.jpg', '8.4', '我完全康复了。');
INSERT INTO `movies_spider_assignment` VALUES ('204', '哪吒闹海', '204', 'https://movie.douban.com/subject/1307315/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2163636038.jpg', '8.8', '想你时你在闹海。');
INSERT INTO `movies_spider_assignment` VALUES ('205', '忠犬八公物语', '205', 'https://movie.douban.com/subject/1959195/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2297934945.jpg', '9.0', '养狗三日，便会对你终其一生。');
INSERT INTO `movies_spider_assignment` VALUES ('206', '源代码', '206', 'https://movie.douban.com/subject/3075287/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p988260245.jpg', '8.3', '邓肯·琼斯继《月球》之后再度奉献出一部精彩绝伦的科幻佳作。');
INSERT INTO `movies_spider_assignment` VALUES ('207', '黑客帝国3：矩阵革命', '207', 'https://movie.douban.com/subject/1302467/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p443461818.jpg', '8.5', '不得不说，《黑客帝国》系列是商业片与科幻、哲学完美结合的典范。');
INSERT INTO `movies_spider_assignment` VALUES ('208', '非常嫌疑犯', '208', 'https://movie.douban.com/subject/1292214/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p470383576.jpg', '8.6', '我不信仰上帝，但我敬畏上帝。');
INSERT INTO `movies_spider_assignment` VALUES ('209', '美国丽人', '209', 'https://movie.douban.com/subject/1292062/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p571671715.jpg', '8.4', '每个人的内心都是深不可测的大海。 ');
INSERT INTO `movies_spider_assignment` VALUES ('210', '青蛇', '210', 'https://movie.douban.com/subject/1303394/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p584021784.jpg', '8.4', '人生如此，浮生如斯。谁人言，花彼岸，此生情长意短。谁都是不懂爱的罢了。');
INSERT INTO `movies_spider_assignment` VALUES ('211', '新龙门客栈', '211', 'https://movie.douban.com/subject/1292287/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1421018669.jpg', '8.4', '嬉笑怒骂，调风动月。');
INSERT INTO `movies_spider_assignment` VALUES ('212', '黄金三镖客', '212', 'https://movie.douban.com/subject/1401118/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2101693489.jpg', '9.1', '最棒的西部片。');
INSERT INTO `movies_spider_assignment` VALUES ('213', '上帝也疯狂', '213', 'https://movie.douban.com/subject/1297478/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2173719647.jpg', '8.6', '纯净原始的笑与感动。');
INSERT INTO `movies_spider_assignment` VALUES ('214', '爱·回家', '214', 'https://movie.douban.com/subject/1299361/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2107418134.jpg', '9.0', '献给所有外婆的电影。');
INSERT INTO `movies_spider_assignment` VALUES ('215', '无耻混蛋', '215', 'https://movie.douban.com/subject/1438652/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p770734475.jpg', '8.4', '昆汀同学越来越变态了，比北野武还杜琪峰。');
INSERT INTO `movies_spider_assignment` VALUES ('216', '城市之光', '216', 'https://movie.douban.com/subject/1293908/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2099815842.jpg', '9.2', '永远的小人物，伟大的卓别林。');
INSERT INTO `movies_spider_assignment` VALUES ('217', '勇士', '217', 'https://movie.douban.com/subject/3217169/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1145536386.jpg', '8.9', '热血沸腾，相当完美的娱乐拳击大餐。');
INSERT INTO `movies_spider_assignment` VALUES ('218', '初恋这件小事', '218', 'https://movie.douban.com/subject/4739952/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1505312273.jpg', '8.2', '黑小鸭速效美白记。');
INSERT INTO `movies_spider_assignment` VALUES ('219', '曾经', '219', 'https://movie.douban.com/subject/2053515/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173720203.jpg', '8.3', '有些幸福无关爱情。');
INSERT INTO `movies_spider_assignment` VALUES ('220', '蓝色大门', '220', 'https://movie.douban.com/subject/1308575/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p584822570.jpg', '8.2', '青春的窃窃私语。 ');
INSERT INTO `movies_spider_assignment` VALUES ('221', '麦兜故事', '221', 'https://movie.douban.com/subject/1302476/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p804938713.jpg', '8.5', '麦兜是一只很哲学的猪。 ');
INSERT INTO `movies_spider_assignment` VALUES ('222', '蝴蝶', '222', 'https://movie.douban.com/subject/1292056/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1451436171.jpg', '8.6', '我们长途跋涉寻找的东西，有可能一直就在身边。 ');
INSERT INTO `movies_spider_assignment` VALUES ('223', '暖暖内含光', '223', 'https://movie.douban.com/subject/1308777/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p479565065.jpg', '8.4', '恋爱是一次神经的冒险。就算失去记忆，也会爱上你。');
INSERT INTO `movies_spider_assignment` VALUES ('224', '无敌破坏王', '224', 'https://movie.douban.com/subject/6534248/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1735642656.jpg', '8.6', '迪士尼和皮克斯拿错剧本的产物。');
INSERT INTO `movies_spider_assignment` VALUES ('225', '与狼共舞', '225', 'https://movie.douban.com/subject/1293764/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p499158228.jpg', '8.9', '充满诗意与情怀的史诗作品。 ');
INSERT INTO `movies_spider_assignment` VALUES ('226', '巴黎淘气帮', '226', 'https://movie.douban.com/subject/3157605/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p465446537.jpg', '8.6', '四百击的反面。');
INSERT INTO `movies_spider_assignment` VALUES ('227', '大卫·戈尔的一生', '227', 'https://movie.douban.com/subject/1305725/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2186861098.jpg', '8.7', '捍卫人权只是信仰，一点不妨碍其行为的残忍。');
INSERT INTO `movies_spider_assignment` VALUES ('228', '遗愿清单', '228', 'https://movie.douban.com/subject/1867345/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p708613284.jpg', '8.5', '用剩余不多的时间，去燃烧整个生命。');
INSERT INTO `movies_spider_assignment` VALUES ('229', '国王的演讲', '229', 'https://movie.douban.com/subject/4023638/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p768879237.jpg', '8.3', '皇上无话儿。');
INSERT INTO `movies_spider_assignment` VALUES ('230', '血钻', '230', 'https://movie.douban.com/subject/1428175/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p554741987.jpg', '8.5', '每个美丽事物背后都是滴血的现实。');
INSERT INTO `movies_spider_assignment` VALUES ('231', '夜访吸血鬼', '231', 'https://movie.douban.com/subject/1299327/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1353910572.jpg', '8.3', '弥漫淡淡血腥气的优雅。');
INSERT INTO `movies_spider_assignment` VALUES ('232', '偷拐抢骗', '232', 'https://movie.douban.com/subject/1301171/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p616753227.jpg', '8.5', '典型盖·里奇式的英国黑色幽默黑帮片。');
INSERT INTO `movies_spider_assignment` VALUES ('233', '荒岛余生', '233', 'https://movie.douban.com/subject/1298653/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1341248319.jpg', '8.4', '一个人的独角戏。');
INSERT INTO `movies_spider_assignment` VALUES ('234', '模仿游戏', '234', 'https://movie.douban.com/subject/10463953/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2255040492.jpg', '8.5', '');
INSERT INTO `movies_spider_assignment` VALUES ('235', '爱在暹罗', '235', 'https://movie.douban.com/subject/2365260/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1024585648.jpg', '8.3', '把爱放在心底，有爱就有希望。');
INSERT INTO `movies_spider_assignment` VALUES ('236', '中央车站', '236', 'https://movie.douban.com/subject/1292218/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2239441575.jpg', '8.7', '心灵救赎。');
INSERT INTO `movies_spider_assignment` VALUES ('237', '疯狂动物城', '237', 'https://movie.douban.com/subject/25662329/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2315672647.jpg', '9.2', '');
INSERT INTO `movies_spider_assignment` VALUES ('238', '两小无猜', '238', 'https://movie.douban.com/subject/1308817/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455472580.jpg', '8.2', 'Love me, if you dare. ');
INSERT INTO `movies_spider_assignment` VALUES ('239', '月球', '239', 'https://movie.douban.com/subject/3073124/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p449399746.jpg', '8.5', '2009媲美《第九区》的又一部科幻神作。');
INSERT INTO `movies_spider_assignment` VALUES ('240', '千钧一发', '240', 'https://movie.douban.com/subject/1300117/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2195672555.jpg', '8.7', '一部能引人思考的科幻励志片。');
INSERT INTO `movies_spider_assignment` VALUES ('241', '疯狂的石头', '241', 'https://movie.douban.com/subject/1862151/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p712241453.jpg', '8.2', '中国版《两杆大烟枪》。');
INSERT INTO `movies_spider_assignment` VALUES ('242', '罪恶之城', '242', 'https://movie.douban.com/subject/1309027/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2173716829.jpg', '8.4', '权力不是来自枪和子弹，权力来自谎言。');
INSERT INTO `movies_spider_assignment` VALUES ('243', '枪火', '243', 'https://movie.douban.com/subject/1300741/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1538646661.jpg', '8.6', '一群演技精湛的戏骨，奉献出一个精致的黑帮小品，成就杜琪峰群戏的巅峰之作。');
INSERT INTO `movies_spider_assignment` VALUES ('244', '寿司之神', '244', 'https://movie.douban.com/subject/6146955/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1528763106.jpg', '8.8', '仪式主义的狂欢，偏执狂的完胜。');
INSERT INTO `movies_spider_assignment` VALUES ('245', '我爱你', '245', 'https://movie.douban.com/subject/5908478/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1075591188.jpg', '9.0', '你要相信，这世上真的有爱存在，不管在什么年纪 ');
INSERT INTO `movies_spider_assignment` VALUES ('246', '爱在午夜降临前', '246', 'https://movie.douban.com/subject/10808442/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2001069785.jpg', '8.7', '所谓爱情，就是话唠一路，都不会心生腻烦，彼此嫌弃。');
INSERT INTO `movies_spider_assignment` VALUES ('247', '廊桥遗梦', '247', 'https://movie.douban.com/subject/1293929/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2190558219.jpg', '8.5', '这样确切的爱，一生只有一次。');
INSERT INTO `movies_spider_assignment` VALUES ('248', '角斗士', '248', 'https://movie.douban.com/subject/1293530/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1601948450.jpg', '8.4', '罗马斗兽场的鸦雀无声，久久停留在这样的肃穆中。');
INSERT INTO `movies_spider_assignment` VALUES ('249', '假如爱有天意', '249', 'https://movie.douban.com/subject/1304073/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p479746811.jpg', '8.2', '琼瑶阿姨在韩国的深刻版。');
INSERT INTO `movies_spider_assignment` VALUES ('250', '黑鹰坠落', '250', 'https://movie.douban.com/subject/1291824/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910900710.jpg', '8.5', '还原真实而残酷的战争。');

-- ----------------------------
-- Table structure for `movie_comment_impressions`
-- ----------------------------
DROP TABLE IF EXISTS `movie_comment_impressions`;
CREATE TABLE `movie_comment_impressions` (
  `movie_comment_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `isagree` bit(1) DEFAULT NULL COMMENT '是否赞同这个该评论 1赞同 0不赞同',
  `datetime` datetime DEFAULT NULL COMMENT '赞同或否定时间',
  PRIMARY KEY (`movie_comment_id`,`userid`),
  KEY `moviecomment_userid_movieimpression` (`userid`),
  CONSTRAINT `moviecomment_impression_impressionid_movieimpression` FOREIGN KEY (`movie_comment_id`) REFERENCES `user_movie_impressions` (`id`),
  CONSTRAINT `moviecomment_userid_movieimpression` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_comment_impressions
-- ----------------------------
INSERT INTO `movie_comment_impressions` VALUES ('1', '1', '', '2017-03-08 16:05:46');
INSERT INTO `movie_comment_impressions` VALUES ('1', '2', '', '2017-03-08 16:05:28');

-- ----------------------------
-- Table structure for `movie_picture`
-- ----------------------------
DROP TABLE IF EXISTS `movie_picture`;
CREATE TABLE `movie_picture` (
  `movieid` int(11) NOT NULL,
  `imguri` varchar(255) NOT NULL COMMENT '图片地址 可本地 可url',
  PRIMARY KEY (`movieid`,`imguri`),
  CONSTRAINT `moviepicture_movieid_movies_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_picture
-- ----------------------------
INSERT INTO `movie_picture` VALUES ('1', 'imguri1');
INSERT INTO `movie_picture` VALUES ('1', 'imguri2');
INSERT INTO `movie_picture` VALUES ('2', 'imguri3');

-- ----------------------------
-- Table structure for `movie_tag`
-- ----------------------------
DROP TABLE IF EXISTS `movie_tag`;
CREATE TABLE `movie_tag` (
  `userid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`movieid`,`tagid`),
  KEY `movietag_tagid_foreignkey` (`tagid`),
  KEY `movietag_movieid_foreignkey` (`movieid`),
  CONSTRAINT `movietag_movieid_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`),
  CONSTRAINT `movietag_tagid_foreignkey` FOREIGN KEY (`tagid`) REFERENCES `tag_meta` (`id`),
  CONSTRAINT `movietag_userid_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_tag
-- ----------------------------
INSERT INTO `movie_tag` VALUES ('1', '1', '1');
INSERT INTO `movie_tag` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for `tag_meta`
-- ----------------------------
DROP TABLE IF EXISTS `tag_meta`;
CREATE TABLE `tag_meta` (
  `id` int(11) NOT NULL,
  `tagname` varchar(255) DEFAULT NULL COMMENT '标签名字',
  `type` varchar(32) DEFAULT NULL COMMENT '电影 人 等的tag',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag_meta
-- ----------------------------
INSERT INTO `tag_meta` VALUES ('1', '激情', 'movie');
INSERT INTO `tag_meta` VALUES ('2', '好看', 'movie');
INSERT INTO `tag_meta` VALUES ('3', '无聊', 'people');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL COMMENT '依赖与user表 如果在user表中没有则不允许插入',
  `avatars` varchar(255) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `sex` char(8) DEFAULT NULL,
  `phonenumber` char(11) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`userid`),
  CONSTRAINT `userinfo_userid_users_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'avatars1', 'root', 'root@email.com', 'man', '15965486523');
INSERT INTO `userinfo` VALUES ('2', 'avatars2', 'test', 'test@email.com', 'famale', '15876448856');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL COMMENT '加密后的密码',
  `salt` varchar(64) NOT NULL,
  `authid` char(64) NOT NULL COMMENT '用于登陆验证，与id配合，作为登陆凭证',
  `permission` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'root', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', '', '2147483647', '2017-03-08 15:00:36', '2017-03-08 15:00:40');
INSERT INTO `users` VALUES ('2', 'test', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', '', '1', '2017-03-08 15:01:38', '2017-03-08 15:01:41');
INSERT INTO `users` VALUES ('581', 'username', 'f5dcb8df7b3d3d8d564f28fec0e18c8d23b1c9bc', 'su8bHSFR4WjmaQqEZNxC0roiPAzXhfkU', '9ES10hH9LGwli_DtSHu4wrvQSUyOKqIfNSCYeCGGIRMl6Lw_byA__AbIV684MV8q', '1', '2017-03-11 10:45:05', '2017-03-11 10:45:05');
INSERT INTO `users` VALUES ('1578', 'exfly', '9fd316724d32094959eace23c4a43c0671420fdc', 'RCPfEmXxhLNBUcl5yQt9Oq106TWzGrVF', 'GYbN6ltpH98QvtLzbdGU_OWxFNrWbT0pH7L9faNQEr2f0MhL4TzaGd1jwvMGWKWU', '1', '2017-03-11 17:08:07', '2017-03-11 17:08:07');

-- ----------------------------
-- Table structure for `user_movie_impressions`
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_impressions`;
CREATE TABLE `user_movie_impressions` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `movieid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `hadsaw_wanted` varchar(8) DEFAULT NULL COMMENT 'hadsaw or wanted',
  `comment` varchar(255) DEFAULT NULL COMMENT '评论',
  `datetime` datetime DEFAULT NULL COMMENT '点评时间',
  PRIMARY KEY (`id`),
  KEY `movie_impression_userid_users_foreignkey` (`userid`),
  KEY `movie_impression_movieid_foreignkey` (`movieid`),
  CONSTRAINT `movie_impression_movieid_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`),
  CONSTRAINT `movie_impression_userid_users_foreignkey` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_movie_impressions
-- ----------------------------
INSERT INTO `user_movie_impressions` VALUES ('1', '1', '1', '5', 'wanted', '最后一幕的「X」。严厉“抵制”这种从头煽到尾、拳拳打到心的反超级英雄电影，太犯规了，感觉自己的精神一直都被蹂躏，哭到爆炸，还怎么客观看待。希望《金刚狼3》不要变成一个转折点，开启一“迟暮”时代，再来类似风格的真的不敢再去看了QAQ', '2017-03-08 16:03:46');
INSERT INTO `user_movie_impressions` VALUES ('2', '2', '1', '4', 'hadsaw', '太牛逼了……我居然有生之年看到X战警全死在荧幕上了……这个系列也算是画上了一个完美的句号了吧，阿狼演技最用力的一部', '2017-03-08 16:05:07');
