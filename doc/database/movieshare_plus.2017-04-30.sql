/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : movieshare_plus

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-30 21:47:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `famouspeoples`
-- ----------------------------
DROP TABLE IF EXISTS `famouspeoples`;
CREATE TABLE `famouspeoples` (
  `id` char(64) NOT NULL,
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

-- ----------------------------
-- Table structure for `filmtype`
-- ----------------------------
DROP TABLE IF EXISTS `filmtype`;
CREATE TABLE `filmtype` (
  `id` char(64) NOT NULL,
  `movieid` char(64) DEFAULT NULL,
  `filmtype` char(64) DEFAULT NULL,
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

-- ----------------------------
-- Table structure for `filmtype_meta`
-- ----------------------------
DROP TABLE IF EXISTS `filmtype_meta`;
CREATE TABLE `filmtype_meta` (
  `id` char(64) NOT NULL,
  `type` char(16) NOT NULL COMMENT '电影的类型 英文 也为链接',
  `name` char(16) DEFAULT NULL COMMENT '电影的类型 中文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of filmtype_meta
-- ----------------------------
INSERT INTO `filmtype_meta` VALUES ('1', 'drama', '剧情');
INSERT INTO `filmtype_meta` VALUES ('2', 'horror', '恐怖');
INSERT INTO `filmtype_meta` VALUES ('3', 'science', '科幻');

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `userid` char(64) NOT NULL,
  `friendsid` char(64) NOT NULL,
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
  `id` char(64) NOT NULL,
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
INSERT INTO `movies` VALUES ('1', 'The Shawshank Redemption', '肖申克的救赎', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg', '02:20:40', 'American', '9.6', '英语', 'https://movie.douban.com/trailer/108756/#content', '20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。未过多久，安迪尝试接近囚犯中颇有声望的瑞德（摩根·弗里曼 Morgan Freeman 饰），请求对方帮自己搞来小锤子。以此为契机，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，帮助监狱管理层逃税、洗黑钱，同时凭借与瑞德的交往在犯', '1994-09-10', 'tt0111161');
INSERT INTO `movies` VALUES ('10', null, '机器人总动员', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p449665982.jpg', null, null, '9.3', null, null, '小瓦力，大人生。', null, null);
INSERT INTO `movies` VALUES ('100', null, '爱在日落黄昏时', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910924055.jpg', null, null, '8.7', null, null, '九年后的重逢是世俗和责任的交叠，没了悸动和青涩，沧桑而温暖。', null, null);
INSERT INTO `movies` VALUES ('101', null, '猫鼠游戏', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p453924541.jpg', null, null, '8.7', null, null, '骗子大师和执著警探的你追我跑故事。 ', null, null);
INSERT INTO `movies` VALUES ('102', null, '侧耳倾听', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456692072.jpg', null, null, '8.8', null, null, '少女情怀总是诗。', null, null);
INSERT INTO `movies` VALUES ('103', null, '摩登时代', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2173707976.jpg', null, null, '9.2', null, null, '大时代中的人生，小人物的悲喜。', null, null);
INSERT INTO `movies` VALUES ('104', null, '驯龙高手', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p450042258.jpg', null, null, '8.7', null, null, '和谐的生活离不开摸头与被摸头。', null, null);
INSERT INTO `movies` VALUES ('105', null, '末代皇帝', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p452088641.jpg', null, null, '8.8', null, null, '“不要跟我比惨，我比你更惨”再适合这部电影不过了。', null, null);
INSERT INTO `movies` VALUES ('106', null, '哈利·波特与魔法石', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p804947166.jpg', null, null, '8.6', null, null, '童话世界的开端。', null, null);
INSERT INTO `movies` VALUES ('107', null, '超脱', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1305562621.jpg', null, null, '8.7', null, null, '穷尽一生，我们要学会的，不过是彼此拥抱。', null, null);
INSERT INTO `movies` VALUES ('108', null, '海洋', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p497010372.jpg', null, null, '9', null, null, '大海啊，不全是水。', null, null);
INSERT INTO `movies` VALUES ('109', null, '幸福终点站', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p854757687.jpg', null, null, '8.6', null, null, '有时候幸福需要等一等。 ', null, null);
INSERT INTO `movies` VALUES ('11', null, '海上钢琴师', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p511146957.jpg', null, null, '9.2', null, null, '每个人都要走一条自己坚定了的路，就算是粉身碎骨。 ', null, null);
INSERT INTO `movies` VALUES ('110', null, '燃情岁月', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1023654037.jpg', null, null, '8.8', null, null, '传奇，不是每个人都可以拥有。', null, null);
INSERT INTO `movies` VALUES ('111', null, '穿条纹睡衣的男孩', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1473670352.jpg', null, null, '8.8', null, null, '尽管有些不切实际的幻想，这部电影依旧是一部感人肺腑的佳作。', null, null);
INSERT INTO `movies` VALUES ('112', null, '谍影重重3', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792223507.jpg', null, null, '8.7', null, null, '像吃了苏打饼一样干脆的电影。', null, null);
INSERT INTO `movies` VALUES ('113', null, '菊次郎的夏天', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p751835224.jpg', null, null, '8.7', null, null, '从没见过那么流氓的温柔，从没见过那么温柔的流氓。', null, null);
INSERT INTO `movies` VALUES ('114', null, '电锯惊魂', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2163771304.jpg', null, null, '8.6', null, null, '真相就在眼前。', null, null);
INSERT INTO `movies` VALUES ('115', null, '神偷奶爸', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792776858.jpg', null, null, '8.5', null, null, 'Mr. I Don\'t Care其实也有Care的时候。', null, null);
INSERT INTO `movies` VALUES ('116', null, '真爱至上', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p475600770.jpg', null, null, '8.5', null, null, '爱，是个动词。', null, null);
INSERT INTO `movies` VALUES ('117', null, '借东西的小人阿莉埃蒂', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p617533616.jpg', null, null, '8.7', null, null, '曾经的那段美好会沉淀为一辈子的记忆。', null, null);
INSERT INTO `movies` VALUES ('118', null, '倩女幽魂', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2347277555.jpg', null, null, '8.6', null, null, '两张绝世的脸。 ', null, null);
INSERT INTO `movies` VALUES ('119', null, '岁月神偷', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456666151.jpg', null, null, '8.6', null, null, '岁月流逝，来日可追。', null, null);
INSERT INTO `movies` VALUES ('12', null, '三傻大闹宝莱坞', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p579729551.jpg', null, null, '9.1', null, null, '英俊版憨豆，高情商版谢耳朵。', null, null);
INSERT INTO `movies` VALUES ('120', null, '虎口脱险', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2399597512.jpg', null, null, '8.9', null, null, '永远看不腻的喜剧。', null, null);
INSERT INTO `movies` VALUES ('121', null, '雨人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p942376281.jpg', null, null, '8.6', null, null, '生活在自己的世界里，也可以让周围的人显得可笑和渺小。', null, null);
INSERT INTO `movies` VALUES ('122', null, '消失的爱人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2221768894.jpg', null, null, '8.7', null, null, '', null, null);
INSERT INTO `movies` VALUES ('123', null, '七武士', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p647099823.jpg', null, null, '9.1', null, null, '时代悲歌。', null, null);
INSERT INTO `movies` VALUES ('124', null, '贫民窟的百万富翁', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p470476887.jpg', null, null, '8.5', null, null, '上帝之城+猜火车+阿甘正传+开心辞典=山寨富翁', null, null);
INSERT INTO `movies` VALUES ('125', null, '恐怖直播', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2016930906.jpg', null, null, '8.7', null, null, '恐怖分子的“秋菊打官司”。', null, null);
INSERT INTO `movies` VALUES ('126', null, '记忆碎片', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p641688453.jpg', null, null, '8.5', null, null, '一个针管引发的血案。', null, null);
INSERT INTO `movies` VALUES ('127', null, '东邪西毒', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1982176012.jpg', null, null, '8.6', null, null, '电影诗。', null, null);
INSERT INTO `movies` VALUES ('128', null, '疯狂原始人', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1867084027.jpg', null, null, '8.7', null, null, '老少皆宜，这就是好莱坞动画的魅力。', null, null);
INSERT INTO `movies` VALUES ('129', null, '怪兽电力公司', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1805127697.jpg', null, null, '8.6', null, null, '不要给它起名字，起了名字就有感情了。', null, null);
INSERT INTO `movies` VALUES ('13', null, '忠犬八公的故事', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p524964016.jpg', null, null, '9.2', null, null, '永远都不能忘记你所爱的人。', null, null);
INSERT INTO `movies` VALUES ('130', null, '杀人回忆', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p480225538.jpg', null, null, '8.6', null, null, '关于连环杀人悬案的集体回忆。', null, null);
INSERT INTO `movies` VALUES ('131', null, '红辣椒', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p672363704.jpg', null, null, '8.8', null, null, '梦的勾结。', null, null);
INSERT INTO `movies` VALUES ('132', null, '卢旺达饭店', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2159368352.jpg', null, null, '8.8', null, null, '当这个世界闭上双眼，他却敞开了怀抱。', null, null);
INSERT INTO `movies` VALUES ('133', null, '穿越时空的少女', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2079334286.jpg', null, null, '8.6', null, null, '爱上未来的你。 ', null, null);
INSERT INTO `movies` VALUES ('134', null, '魂断蓝桥', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2351134499.jpg', null, null, '8.8', null, null, '中国式内在的美国电影。', null, null);
INSERT INTO `movies` VALUES ('135', null, '黑天鹅', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p719282906.jpg', null, null, '8.5', null, null, '黑暗之美。', null, null);
INSERT INTO `movies` VALUES ('136', null, '恋恋笔记本', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p483604864.jpg', null, null, '8.5', null, null, '爱情没有那么多借口，如果不能圆满，只能说明爱的不够。 ', null, null);
INSERT INTO `movies` VALUES ('137', null, '猜火车', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p513567548.jpg', null, null, '8.5', null, null, '不可猜的青春迷笛。 ', null, null);
INSERT INTO `movies` VALUES ('138', null, '喜宴', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2173713676.jpg', null, null, '8.8', null, null, '中国家庭的喜怒哀乐忍。', null, null);
INSERT INTO `movies` VALUES ('139', null, '英雄本色', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2157672975.jpg', null, null, '8.7', null, null, '英雄泪短，兄弟情长。 ', null, null);
INSERT INTO `movies` VALUES ('14', null, '放牛班的春天', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910824951.jpg', null, null, '9.2', null, null, '天籁一般的童声，是最接近上帝的存在。 ', null, null);
INSERT INTO `movies` VALUES ('140', null, '傲慢与偏见', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p452005185.jpg', null, null, '8.4', null, null, '爱是摈弃傲慢与偏见之后的曙光。', null, null);
INSERT INTO `movies` VALUES ('141', null, '教父3', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2169664351.jpg', null, null, '8.7', null, null, '任何信念的力量，都无法改变命运。', null, null);
INSERT INTO `movies` VALUES ('142', null, '雨中曲', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1612355875.jpg', null, null, '8.9', null, null, '骨灰级歌舞片。', null, null);
INSERT INTO `movies` VALUES ('143', null, '完美的世界', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792403691.jpg', null, null, '9', null, null, '坏人的好总是比好人的好来得更感人。', null, null);
INSERT INTO `movies` VALUES ('144', null, '玩具总动员3', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1283675359.jpg', null, null, '8.7', null, null, '跨度十五年的欢乐与泪水。', null, null);
INSERT INTO `movies` VALUES ('145', null, '小森林 夏秋篇', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2221319641.jpg', null, null, '8.9', null, null, '', null, null);
INSERT INTO `movies` VALUES ('146', null, '纵横四海', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p933122297.jpg', null, null, '8.7', null, null, '香港浪漫主义警匪动作片的巅峰之作。', null, null);
INSERT INTO `movies` VALUES ('147', null, '喜剧之王', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1043597424.jpg', null, null, '8.4', null, null, '我是一个演员。', null, null);
INSERT INTO `movies` VALUES ('148', null, '人工智能', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792257137.jpg', null, null, '8.6', null, null, '对爱的执着，可以超越一切。', null, null);
INSERT INTO `movies` VALUES ('149', null, '萤火之森', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1272904657.jpg', null, null, '8.7', null, null, '触不到的恋人。', null, null);
INSERT INTO `movies` VALUES ('15', null, '大话西游之大圣娶亲', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p648365452.jpg', null, null, '9.1', null, null, '一生所爱。', null, null);
INSERT INTO `movies` VALUES ('150', null, '我是山姆', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p652417775.jpg', null, null, '8.8', null, null, '爱并不需要智商 。', null, null);
INSERT INTO `movies` VALUES ('151', null, '香水', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p470006658.jpg', null, null, '8.4', null, null, '一个单凭体香达到高潮的男人。', null, null);
INSERT INTO `movies` VALUES ('152', null, '冰川时代', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910895719.jpg', null, null, '8.4', null, null, '松鼠才是角儿。', null, null);
INSERT INTO `movies` VALUES ('153', null, '浪潮', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1344888983.jpg', null, null, '8.7', null, null, '世界离独裁只有五天。', null, null);
INSERT INTO `movies` VALUES ('154', null, '撞车', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2075132390.jpg', null, null, '8.6', null, null, '天使与魔鬼的冲撞。', null, null);
INSERT INTO `movies` VALUES ('155', null, '7号房的礼物', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1816276065.jpg', null, null, '8.6', null, null, '《我是山姆》的《美丽人生》。', null, null);
INSERT INTO `movies` VALUES ('156', null, '哈利·波特与死亡圣器(下)', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p917846733.jpg', null, null, '8.6', null, null, '10年的完美句点。', null, null);
INSERT INTO `movies` VALUES ('157', null, '朗读者', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1140984198.jpg', null, null, '8.5', null, null, '当爱情跨越年龄的界限，它似乎能变得更久远一点，成为一种责任，一种水到渠成的相濡以沫。 ', null, null);
INSERT INTO `movies` VALUES ('158', null, '花样年华', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1910828286.jpg', null, null, '8.4', null, null, '偷情本没有这样美。', null, null);
INSERT INTO `movies` VALUES ('159', null, '追随', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2074443514.jpg', null, null, '9', null, null, '诺兰的牛逼来源于内心散发出的恐惧。', null, null);
INSERT INTO `movies` VALUES ('16', null, '教父', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910907404.jpg', null, null, '9.2', null, null, '千万不要记恨你的对手，这样会让你失去理智。', null, null);
INSERT INTO `movies` VALUES ('160', null, '秒速5厘米', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p982896012.jpg', null, null, '8.4', null, null, '青春就是放弃和怀念。', null, null);
INSERT INTO `movies` VALUES ('161', null, '碧海蓝天', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p455724599.jpg', null, null, '8.7', null, null, '在那片深蓝中，感受来自大海的忧伤寂寞与美丽自由。', null, null);
INSERT INTO `movies` VALUES ('162', null, '疯狂动物城', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2315672647.jpg', null, null, '9.2', null, null, '', null, null);
INSERT INTO `movies` VALUES ('163', null, '罗生门', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1864872647.jpg', null, null, '8.7', null, null, '人生的N种可能性。', null, null);
INSERT INTO `movies` VALUES ('164', null, '梦之安魂曲', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p884936202.jpg', null, null, '8.7', null, null, '一场没有春天的噩梦。', null, null);
INSERT INTO `movies` VALUES ('165', null, '战争之王', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p453719066.jpg', null, null, '8.5', null, null, '做一颗让别人需要你的棋子。', null, null);
INSERT INTO `movies` VALUES ('166', null, '可可西里', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2363208684.jpg', null, null, '8.6', null, null, '坚硬的信仰。', null, null);
INSERT INTO `movies` VALUES ('167', null, '一次别离', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2189835254.jpg', null, null, '8.7', null, null, '只有有信仰的人才能说出事实真相。', null, null);
INSERT INTO `movies` VALUES ('168', null, '心迷宫', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2275298525.jpg', null, null, '8.6', null, null, '', null, null);
INSERT INTO `movies` VALUES ('169', null, '海盗电台', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p769608791.jpg', null, null, '8.6', null, null, '生命不止，摇滚不死。', null, null);
INSERT INTO `movies` VALUES ('17', null, '龙猫', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910829638.jpg', null, null, '9.1', null, null, '人人心中都有个龙猫，童年就永远不会消失。', null, null);
INSERT INTO `movies` VALUES ('170', null, '超能陆战队', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2224568669.jpg', null, null, '8.6', null, null, '', null, null);
INSERT INTO `movies` VALUES ('171', null, '唐伯虎点秋香', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1946455272.jpg', null, null, '8.3', null, null, '华太师是黄霑，吴镇宇四大才子之一。', null, null);
INSERT INTO `movies` VALUES ('172', null, '时空恋旅人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2070153774.jpg', null, null, '8.6', null, null, '把每天当作最后一天般珍惜度过，积极拥抱生活，就是幸福。', null, null);
INSERT INTO `movies` VALUES ('173', null, '谍影重重2', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p667644866.jpg', null, null, '8.5', null, null, '谁说王家卫镜头很晃？', null, null);
INSERT INTO `movies` VALUES ('174', null, '谍影重重', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1597183981.jpg', null, null, '8.5', null, null, '哗啦啦啦啦，天在下雨，哗啦啦啦啦，云在哭泣……找自己。', null, null);
INSERT INTO `movies` VALUES ('175', null, '蝙蝠侠：黑暗骑士崛起', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1706428744.jpg', null, null, '8.5', null, null, '诺兰就是保证。', null, null);
INSERT INTO `movies` VALUES ('176', null, '地球上的星星', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1973489335.jpg', null, null, '8.8', null, null, '天使保护事件始末。', null, null);
INSERT INTO `movies` VALUES ('177', null, '迁徙的鸟', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2238274168.jpg', null, null, '9.1', null, null, '最美的飞翔。', null, null);
INSERT INTO `movies` VALUES ('178', null, '荒野生存', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p465687407.jpg', null, null, '8.6', null, null, '出门必备：本草纲目。', null, null);
INSERT INTO `movies` VALUES ('179', null, '阿飞正传', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p924558512.jpg', null, null, '8.5', null, null, '王家卫是一种风格，张国荣是一个代表。', null, null);
INSERT INTO `movies` VALUES ('18', null, '乱世佳人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1963126880.jpg', null, null, '9.2', null, null, 'Tomorrow is another day.', null, null);
INSERT INTO `movies` VALUES ('180', null, '绿里奇迹', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p767586451.jpg', null, null, '8.7', null, null, '天使暂时离开。', null, null);
INSERT INTO `movies` VALUES ('181', null, '勇闯夺命岛', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p636048104.jpg', null, null, '8.5', null, null, '类型片的极致。 ', null, null);
INSERT INTO `movies` VALUES ('182', null, '荒蛮故事', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2192834364.jpg', null, null, '8.7', null, null, '', null, null);
INSERT INTO `movies` VALUES ('183', null, '恐怖游轮', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p462470694.jpg', null, null, '8.3', null, null, '不要企图在重复中寻找已经失去的爱。', null, null);
INSERT INTO `movies` VALUES ('184', null, '惊魂记', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1021883305.jpg', null, null, '8.8', null, null, '故事的反转与反转，分裂电影的始祖。', null, null);
INSERT INTO `movies` VALUES ('185', null, '燕尾蝶', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p532195562.jpg', null, null, '8.6', null, null, '现实与童话交相辉映的旅程。', null, null);
INSERT INTO `movies` VALUES ('186', null, '小森林 冬春篇', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2215147728.jpg', null, null, '8.9', null, null, '', null, null);
INSERT INTO `movies` VALUES ('187', null, '魔女宅急便', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456676352.jpg', null, null, '8.4', null, null, '宫崎骏的电影总让人感觉世界是美好的，阳光明媚的。', null, null);
INSERT INTO `movies` VALUES ('188', null, '卡萨布兰卡', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1244791866.jpg', null, null, '8.6', null, null, '与同名歌曲无关。', null, null);
INSERT INTO `movies` VALUES ('189', null, '达拉斯买家俱乐部', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2166160837.jpg', null, null, '8.6', null, null, 'Jared Leto的腿比女人还美！', null, null);
INSERT INTO `movies` VALUES ('19', null, '楚门的世界', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480420695.jpg', null, null, '9', null, null, '如果再也不能见到你，祝你早安，午安，晚安。', null, null);
INSERT INTO `movies` VALUES ('190', null, '再次出发之纽约遇见你', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2250287733.jpg', null, null, '8.5', null, null, '爱我就给我看你的播放列表。', null, null);
INSERT INTO `movies` VALUES ('191', null, '英国病人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2408623752.jpg', null, null, '8.4', null, null, 'In memory, love lives forever...', null, null);
INSERT INTO `movies` VALUES ('192', null, '这个男人来自地球', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p513303986.jpg', null, null, '8.5', null, null, '科幻真正的魅力不是视觉效果能取代的。 ', null, null);
INSERT INTO `movies` VALUES ('193', null, '变脸', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173855883.jpg', null, null, '8.4', null, null, '当发哥的风衣、墨镜出现在了凯奇身上⋯⋯', null, null);
INSERT INTO `movies` VALUES ('194', null, '未麻的部屋', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1351050722.jpg', null, null, '8.8', null, null, '好的剧本是，就算你猜到了结局也猜不到全部。', null, null);
INSERT INTO `movies` VALUES ('195', null, '东京物语', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910832390.jpg', null, null, '9.2', null, null, '东京那么大，如果有一天走失了，恐怕一辈子不能再相见。', null, null);
INSERT INTO `movies` VALUES ('196', null, '爆裂鼓手', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2220776342.jpg', null, null, '8.6', null, null, '', null, null);
INSERT INTO `movies` VALUES ('197', null, '终结者2：审判日', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910909085.jpg', null, null, '8.5', null, null, '少见的超越首部的续集，动作片中的经典。', null, null);
INSERT INTO `movies` VALUES ('198', null, '被解救的姜戈', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1959232369.jpg', null, null, '8.5', null, null, '热血沸腾，那个低俗、性感的无耻混蛋又来了。', null, null);
INSERT INTO `movies` VALUES ('199', null, '叫我第一名', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p496133870.jpg', null, null, '8.6', null, null, '乐观比一切都有力量。', null, null);
INSERT INTO `movies` VALUES ('2', null, '这个杀手不太冷', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p511118051.jpg', null, null, '9.4', null, null, '怪蜀黍和小萝莉不得不说的故事。', null, null);
INSERT INTO `movies` VALUES ('20', null, '天堂电影院', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910901025.jpg', null, null, '9.1', null, null, '那些吻戏，那些青春，都在影院的黑暗里被泪水冲刷得无比清晰。', null, null);
INSERT INTO `movies` VALUES ('200', null, '牯岭街少年杀人事件', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p848381236.jpg', null, null, '8.7', null, null, '弱者送给弱者的一刀。', null, null);
INSERT INTO `movies` VALUES ('201', null, 'E.T. 外星人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p984732992.jpg', null, null, '8.5', null, null, '生病的E.T.皮肤的颜色就像柿子饼。', null, null);
INSERT INTO `movies` VALUES ('202', null, '末路狂花', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p794583044.jpg', null, null, '8.7', null, null, '没有了退路，只好飞向自由。', null, null);
INSERT INTO `movies` VALUES ('203', null, '忠犬八公物语', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2297934945.jpg', null, null, '9', null, null, '养狗三日，便会对你终其一生。', null, null);
INSERT INTO `movies` VALUES ('204', null, '哪吒闹海', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2163636038.jpg', null, null, '8.8', null, null, '想你时你在闹海。', null, null);
INSERT INTO `movies` VALUES ('205', null, '发条橙', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p529908155.jpg', null, null, '8.4', null, null, '我完全康复了。', null, null);
INSERT INTO `movies` VALUES ('206', null, '穆赫兰道', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792248233.jpg', null, null, '8.3', null, null, '大卫·林奇的梦境迷宫。', null, null);
INSERT INTO `movies` VALUES ('207', null, '源代码', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p988260245.jpg', null, null, '8.3', null, null, '邓肯·琼斯继《月球》之后再度奉献出一部精彩绝伦的科幻佳作。', null, null);
INSERT INTO `movies` VALUES ('208', null, '黑客帝国3：矩阵革命', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p443461818.jpg', null, null, '8.5', null, null, '不得不说，《黑客帝国》系列是商业片与科幻、哲学完美结合的典范。', null, null);
INSERT INTO `movies` VALUES ('209', null, '青蛇', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p584021784.jpg', null, null, '8.4', null, null, '人生如此，浮生如斯。谁人言，花彼岸，此生情长意短。谁都是不懂爱的罢了。', null, null);
INSERT INTO `movies` VALUES ('21', null, '当幸福来敲门', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1312700628.jpg', null, null, '8.9', null, null, '平民励志片。 ', null, null);
INSERT INTO `movies` VALUES ('210', null, '非常嫌疑犯', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p470383576.jpg', null, null, '8.6', null, null, '我不信仰上帝，但我敬畏上帝。', null, null);
INSERT INTO `movies` VALUES ('211', null, '美国丽人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p571671715.jpg', null, null, '8.4', null, null, '每个人的内心都是深不可测的大海。 ', null, null);
INSERT INTO `movies` VALUES ('212', null, '新龙门客栈', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1421018669.jpg', null, null, '8.4', null, null, '嬉笑怒骂，调风动月。', null, null);
INSERT INTO `movies` VALUES ('213', null, '黄金三镖客', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2101693489.jpg', null, null, '9.1', null, null, '最棒的西部片。', null, null);
INSERT INTO `movies` VALUES ('214', null, '上帝也疯狂', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2173719647.jpg', null, null, '8.6', null, null, '纯净原始的笑与感动。', null, null);
INSERT INTO `movies` VALUES ('215', null, '无耻混蛋', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p770734475.jpg', null, null, '8.4', null, null, '昆汀同学越来越变态了，比北野武还杜琪峰。', null, null);
INSERT INTO `movies` VALUES ('216', null, '城市之光', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2099815842.jpg', null, null, '9.2', null, null, '永远的小人物，伟大的卓别林。', null, null);
INSERT INTO `movies` VALUES ('217', null, '爱·回家', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2107418134.jpg', null, null, '9', null, null, '献给所有外婆的电影。', null, null);
INSERT INTO `movies` VALUES ('218', null, '勇士', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1145536386.jpg', null, null, '8.9', null, null, '热血沸腾，相当完美的娱乐拳击大餐。', null, null);
INSERT INTO `movies` VALUES ('219', null, '初恋这件小事', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1505312273.jpg', null, null, '8.2', null, null, '黑小鸭速效美白记。', null, null);
INSERT INTO `movies` VALUES ('22', null, '触不可及', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1454261925.jpg', null, null, '9.1', null, null, '满满温情的高雅喜剧。', null, null);
INSERT INTO `movies` VALUES ('220', null, '曾经', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173720203.jpg', null, null, '8.3', null, null, '有些幸福无关爱情。', null, null);
INSERT INTO `movies` VALUES ('221', null, '蓝色大门', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p584822570.jpg', null, null, '8.2', null, null, '青春的窃窃私语。 ', null, null);
INSERT INTO `movies` VALUES ('222', null, '麦兜故事', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p804938713.jpg', null, null, '8.5', null, null, '麦兜是一只很哲学的猪。 ', null, null);
INSERT INTO `movies` VALUES ('223', null, '暖暖内含光', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p479565065.jpg', null, null, '8.4', null, null, '恋爱是一次神经的冒险。就算失去记忆，也会爱上你。', null, null);
INSERT INTO `movies` VALUES ('224', null, '无敌破坏王', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1735642656.jpg', null, null, '8.6', null, null, '迪士尼和皮克斯拿错剧本的产物。', null, null);
INSERT INTO `movies` VALUES ('225', null, '蝴蝶', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1451436171.jpg', null, null, '8.6', null, null, '我们长途跋涉寻找的东西，有可能一直就在身边。 ', null, null);
INSERT INTO `movies` VALUES ('226', null, '与狼共舞', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p499158228.jpg', null, null, '8.9', null, null, '充满诗意与情怀的史诗作品。 ', null, null);
INSERT INTO `movies` VALUES ('227', null, '大卫·戈尔的一生', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2186861098.jpg', null, null, '8.7', null, null, '捍卫人权只是信仰，一点不妨碍其行为的残忍。', null, null);
INSERT INTO `movies` VALUES ('228', null, '巴黎淘气帮', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p465446537.jpg', null, null, '8.6', null, null, '四百击的反面。', null, null);
INSERT INTO `movies` VALUES ('229', null, '遗愿清单', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p708613284.jpg', null, null, '8.5', null, null, '用剩余不多的时间，去燃烧整个生命。', null, null);
INSERT INTO `movies` VALUES ('23', null, '搏击俱乐部', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910926158.jpg', null, null, '9', null, null, '邪恶与平庸蛰伏于同一个母体，在特定的时间互相对峙。', null, null);
INSERT INTO `movies` VALUES ('230', null, '国王的演讲', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p768879237.jpg', null, null, '8.3', null, null, '皇上无话儿。', null, null);
INSERT INTO `movies` VALUES ('231', null, '血钻', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p554741987.jpg', null, null, '8.5', null, null, '每个美丽事物背后都是滴血的现实。', null, null);
INSERT INTO `movies` VALUES ('232', null, '夜访吸血鬼', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1353910572.jpg', null, null, '8.3', null, null, '弥漫淡淡血腥气的优雅。', null, null);
INSERT INTO `movies` VALUES ('233', null, '模仿游戏', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2255040492.jpg', null, null, '8.5', null, null, '', null, null);
INSERT INTO `movies` VALUES ('234', null, '偷拐抢骗', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p616753227.jpg', null, null, '8.5', null, null, '典型盖·里奇式的英国黑色幽默黑帮片。', null, null);
INSERT INTO `movies` VALUES ('235', null, '荒岛余生', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1341248319.jpg', null, null, '8.4', null, null, '一个人的独角戏。', null, null);
INSERT INTO `movies` VALUES ('236', null, '爱在暹罗', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1024585648.jpg', null, null, '8.3', null, null, '把爱放在心底，有爱就有希望。', null, null);
INSERT INTO `movies` VALUES ('237', null, '中央车站', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2239441575.jpg', null, null, '8.7', null, null, '心灵救赎。', null, null);
INSERT INTO `movies` VALUES ('238', null, '两小无猜', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455472580.jpg', null, null, '8.1', null, null, 'Love me, if you dare. ', null, null);
INSERT INTO `movies` VALUES ('239', null, '千钧一发', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2195672555.jpg', null, null, '8.7', null, null, '一部能引人思考的科幻励志片。', null, null);
INSERT INTO `movies` VALUES ('24', null, '十二怒汉', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173577632.jpg', null, null, '9.3', null, null, '1957年的理想主义。 ', null, null);
INSERT INTO `movies` VALUES ('240', null, '月球', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p449399746.jpg', null, null, '8.5', null, null, '2009媲美《第九区》的又一部科幻神作。', null, null);
INSERT INTO `movies` VALUES ('241', null, '疯狂的石头', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p712241453.jpg', null, null, '8.2', null, null, '中国版《两杆大烟枪》。', null, null);
INSERT INTO `movies` VALUES ('242', null, '枪火', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1538646661.jpg', null, null, '8.6', null, null, '一群演技精湛的戏骨，奉献出一个精致的黑帮小品，成就杜琪峰群戏的巅峰之作。', null, null);
INSERT INTO `movies` VALUES ('243', null, '罪恶之城', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2173716829.jpg', null, null, '8.4', null, null, '权力不是来自枪和子弹，权力来自谎言。', null, null);
INSERT INTO `movies` VALUES ('244', null, '寿司之神', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1528763106.jpg', null, null, '8.8', null, null, '仪式主义的狂欢，偏执狂的完胜。', null, null);
INSERT INTO `movies` VALUES ('245', null, '爱在午夜降临前', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2001069785.jpg', null, null, '8.7', null, null, '所谓爱情，就是话唠一路，都不会心生腻烦，彼此嫌弃。', null, null);
INSERT INTO `movies` VALUES ('246', null, '我爱你', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1075591188.jpg', null, null, '9', null, null, '你要相信，这世上真的有爱存在，不管在什么年纪 ', null, null);
INSERT INTO `movies` VALUES ('247', null, '廊桥遗梦', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2190558219.jpg', null, null, '8.5', null, null, '这样确切的爱，一生只有一次。', null, null);
INSERT INTO `movies` VALUES ('248', null, '角斗士', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2268656540.jpg', null, null, '8.4', null, null, '罗马斗兽场的鸦雀无声，久久停留在这样的肃穆中。', null, null);
INSERT INTO `movies` VALUES ('249', null, '假如爱有天意', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p479746811.jpg', null, null, '8.2', null, null, '琼瑶阿姨在韩国的深刻版。', null, null);
INSERT INTO `movies` VALUES ('25', null, '指环王3：王者无敌', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910825503.jpg', null, null, '9.1', null, null, '史诗的终章。', null, null);
INSERT INTO `movies` VALUES ('250', null, '黑鹰坠落', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910900710.jpg', null, null, '8.5', null, null, '还原真实而残酷的战争。', null, null);
INSERT INTO `movies` VALUES ('26', null, '无间道', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2233971046.jpg', null, null, '9', null, null, '香港电影史上永不过时的杰作。', null, null);
INSERT INTO `movies` VALUES ('27', null, '熔炉', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1363250216.jpg', null, null, '9.2', null, null, '我们一路奋战不是为了改变世界，而是为了不让世界改变我们。', null, null);
INSERT INTO `movies` VALUES ('28', null, '怦然心动', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p663036666.jpg', null, null, '8.9', null, null, '真正的幸福是来自内心深处。', null, null);
INSERT INTO `movies` VALUES ('29', null, '罗马假日', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2189265085.jpg', null, null, '8.9', null, null, '爱情哪怕只有一天。', null, null);
INSERT INTO `movies` VALUES ('3', null, '霸王别姬', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910813120.jpg', null, null, '9.5', null, null, '风华绝代。', null, null);
INSERT INTO `movies` VALUES ('30', null, '天空之城', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1446261379.jpg', null, null, '9', null, null, '对天空的追逐，永不停止。 ', null, null);
INSERT INTO `movies` VALUES ('31', null, '少年派的奇幻漂流', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1784592701.jpg', null, null, '9', null, null, '瑰丽壮观、无人能及的冒险之旅。', null, null);
INSERT INTO `movies` VALUES ('32', null, '大话西游之月光宝盒', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1280323646.jpg', null, null, '8.9', null, null, '旷古烁今。', null, null);
INSERT INTO `movies` VALUES ('33', null, '鬼子来了', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1181775734.jpg', null, null, '9.1', null, null, '对敌人的仁慈，就是对自己残忍。', null, null);
INSERT INTO `movies` VALUES ('34', null, '两杆大烟枪', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792443418.jpg', null, null, '9', null, null, '4个臭皮匠顶个诸葛亮，盖·里奇果然不是盖的。', null, null);
INSERT INTO `movies` VALUES ('35', null, '蝙蝠侠：黑暗骑士', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p462657443.jpg', null, null, '9', null, null, '无尽的黑暗。', null, null);
INSERT INTO `movies` VALUES ('36', null, '飞屋环游记', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p465583562.jpg', null, null, '8.9', null, null, '最后那些最无聊的事情，才是最值得怀念的。 ', null, null);
INSERT INTO `movies` VALUES ('37', null, '星际穿越', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2206088801.jpg', null, null, '9.1', null, null, '爱是一种力量，让我们超越时空感知它的存在。', null, null);
INSERT INTO `movies` VALUES ('38', null, '飞越疯人院', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792238287.jpg', null, null, '9', null, null, '自由万岁。', null, null);
INSERT INTO `movies` VALUES ('39', null, '窃听风暴', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1808872109.jpg', null, null, '9.1', null, null, '别样人生。', null, null);
INSERT INTO `movies` VALUES ('4', null, '阿甘正传', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p510876377.jpg', null, null, '9.4', null, null, '一部美国近现代史。', null, null);
INSERT INTO `movies` VALUES ('40', null, '活着', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173575484.jpg', null, null, '9', null, null, '张艺谋最好的电影。', null, null);
INSERT INTO `movies` VALUES ('41', null, '海豚湾', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455222172.jpg', null, null, '9.3', null, null, '海豚的微笑，是世界上最高明的伪装。', null, null);
INSERT INTO `movies` VALUES ('42', null, '闻香识女人', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p925123037.jpg', null, null, '8.9', null, null, '史上最美的探戈。', null, null);
INSERT INTO `movies` VALUES ('43', null, 'V字仇杀队', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1465235231.jpg', null, null, '8.8', null, null, '一张面具背后的理想与革命。', null, null);
INSERT INTO `movies` VALUES ('44', null, '美丽心灵', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1665997400.jpg', null, null, '8.9', null, null, '爱是一切逻辑和原由。', null, null);
INSERT INTO `movies` VALUES ('45', null, '教父2', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p616779231.jpg', null, null, '9.1', null, null, '优雅的孤独。', null, null);
INSERT INTO `movies` VALUES ('46', null, '指环王2：双塔奇兵', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p909265336.jpg', null, null, '8.9', null, null, '承前启后的史诗篇章。', null, null);
INSERT INTO `movies` VALUES ('47', null, '指环王1：魔戒再现', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1354436051.jpg', null, null, '8.9', null, null, '传说的开始。', null, null);
INSERT INTO `movies` VALUES ('48', null, '哈尔的移动城堡', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2174346180.jpg', null, null, '8.8', null, null, '带着心爱的人在天空飞翔。', null, null);
INSERT INTO `movies` VALUES ('49', null, '天使爱美丽', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p803896904.jpg', null, null, '8.7', null, null, '法式小清新。 ', null, null);
INSERT INTO `movies` VALUES ('5', null, '美丽人生', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p510861873.jpg', null, null, '9.5', null, null, '最美的谎言。', null, null);
INSERT INTO `movies` VALUES ('50', null, '情书', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p449897379.jpg', null, null, '8.8', null, null, '暗恋的极致。', null, null);
INSERT INTO `movies` VALUES ('51', null, '死亡诗社', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910824340.jpg', null, null, '8.9', null, null, '当一个死水般的体制内出现一个活跃的变数时，所有的腐臭都站在了光明的对面。', null, null);
INSERT INTO `movies` VALUES ('52', null, '美国往事', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p477229647.jpg', null, null, '9.1', null, null, '往事如烟，无处祭奠。', null, null);
INSERT INTO `movies` VALUES ('53', null, '七宗罪', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p457631605.jpg', null, null, '8.7', null, null, '警察抓小偷，老鼠玩死猫。', null, null);
INSERT INTO `movies` VALUES ('54', null, '钢琴家', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792484461.jpg', null, null, '9', null, null, '音乐能化解仇恨。', null, null);
INSERT INTO `movies` VALUES ('55', null, '狮子王', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2277799019.jpg', null, null, '8.9', null, null, '动物版《哈姆雷特》。', null, null);
INSERT INTO `movies` VALUES ('56', null, '勇敢的心', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1374546770.jpg', null, null, '8.8', null, null, '史诗大片的典范。', null, null);
INSERT INTO `movies` VALUES ('57', null, '致命魔术', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480383375.jpg', null, null, '8.8', null, null, '孪生蝙蝠侠大战克隆金刚狼。', null, null);
INSERT INTO `movies` VALUES ('58', null, '被嫌弃的松子的一生', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p453723669.jpg', null, null, '8.9', null, null, '以戏谑来戏谑戏谑。', null, null);
INSERT INTO `movies` VALUES ('59', null, '辩护人', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2158166535.jpg', null, null, '9.1', null, null, '电影的现实意义大过电影本身。', null, null);
INSERT INTO `movies` VALUES ('6', null, '千与千寻', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1910830216.jpg', null, null, '9.2', null, null, '最好的宫崎骏，最好的久石让。 ', null, null);
INSERT INTO `movies` VALUES ('60', null, '剪刀手爱德华', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p480956937.jpg', null, null, '8.7', null, null, '浪漫忧郁的成人童话。', null, null);
INSERT INTO `movies` VALUES ('61', null, '小鞋子', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173580603.jpg', null, null, '9.2', null, null, '奔跑的孩子是天使。', null, null);
INSERT INTO `movies` VALUES ('62', null, '音乐之声', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p453788577.jpg', null, null, '8.9', null, null, '用音乐化解仇恨，让歌声串起美好。', null, null);
INSERT INTO `movies` VALUES ('63', null, '饮食男女', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910899751.jpg', null, null, '9', null, null, '人生不能像做菜，把所有的料都准备好了才下锅。', null, null);
INSERT INTO `movies` VALUES ('64', null, '控方证人', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1505392928.jpg', null, null, '9.6', null, null, '比利·怀德满分作品。', null, null);
INSERT INTO `movies` VALUES ('65', null, '低俗小说', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910902213.jpg', null, null, '8.7', null, null, '故事的高级讲法。', null, null);
INSERT INTO `movies` VALUES ('66', null, '入殓师', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p594972928.jpg', null, null, '8.8', null, null, '死可能是一道门，逝去并不是终结，而是超越，走向下一程。', null, null);
INSERT INTO `movies` VALUES ('67', null, '本杰明·巴顿奇事', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p475749652.jpg', null, null, '8.7', null, null, '在时间之河里感受溺水之苦。', null, null);
INSERT INTO `movies` VALUES ('68', null, '沉默的羔羊', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1593414327.jpg', null, null, '8.7', null, null, '安东尼·霍普金斯的顶级表演。', null, null);
INSERT INTO `movies` VALUES ('69', null, '蝴蝶效应', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1783650111.jpg', null, null, '8.7', null, null, '人的命运被自己瞬间的抉择改变。', null, null);
INSERT INTO `movies` VALUES ('7', null, '辛德勒的名单', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p492406163.jpg', null, null, '9.4', null, null, '拯救一个人，就是拯救整个世界。', null, null);
INSERT INTO `movies` VALUES ('70', null, '黑客帝国', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910908765.jpg', null, null, '8.8', null, null, '视觉革命。', null, null);
INSERT INTO `movies` VALUES ('71', null, '拯救大兵瑞恩', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1014542496.jpg', null, null, '8.8', null, null, '美利坚精神输出大片No1.', null, null);
INSERT INTO `movies` VALUES ('72', null, '玛丽和马克思', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1820615077.jpg', null, null, '8.9', null, null, '你是我最好的朋友，你是我唯一的朋友 。', null, null);
INSERT INTO `movies` VALUES ('73', null, '西西里的美丽传说', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p792400696.jpg', null, null, '8.7', null, null, '美丽无罪。', null, null);
INSERT INTO `movies` VALUES ('74', null, '素媛', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2118532944.jpg', null, null, '9.1', null, null, '受过伤害的人总是笑得最开心，因为他们不愿意让身边的人承受一样的痛苦。', null, null);
INSERT INTO `movies` VALUES ('75', null, '心灵捕手', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480965695.jpg', null, null, '8.7', null, null, '人生中应该拥有这样的一段豁然开朗。', null, null);
INSERT INTO `movies` VALUES ('76', null, '幽灵公主', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1613191025.jpg', null, null, '8.8', null, null, '人与自然的战争史诗。', null, null);
INSERT INTO `movies` VALUES ('77', null, '第六感', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2220184425.jpg', null, null, '8.8', null, null, '深入内心的恐怖，出人意料的结局。', null, null);
INSERT INTO `movies` VALUES ('78', null, '阳光灿烂的日子', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p967457079.jpg', null, null, '8.7', null, null, '一场华丽的意淫。', null, null);
INSERT INTO `movies` VALUES ('79', null, '让子弹飞', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1512562287.jpg', null, null, '8.7', null, null, '你给我翻译翻译，神马叫做TMD的惊喜。', null, null);
INSERT INTO `movies` VALUES ('8', null, '泰坦尼克号', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p457760035.jpg', null, null, '9.2', null, null, '失去的才是永恒的。 ', null, null);
INSERT INTO `movies` VALUES ('80', null, '大鱼', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p692813374.jpg', null, null, '8.7', null, null, '抱着梦想而活着的人是幸福的，怀抱梦想而死去的人是不朽的。', null, null);
INSERT INTO `movies` VALUES ('81', null, '春光乍泄', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p465939041.jpg', null, null, '8.7', null, null, '爱情纠缠，男女一致。', null, null);
INSERT INTO `movies` VALUES ('82', null, '射雕英雄传之东成西就', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1993903133.jpg', null, null, '8.7', null, null, '百看不厌。 ', null, null);
INSERT INTO `movies` VALUES ('83', null, '大闹天宫', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2184505167.jpg', null, null, '9.2', null, null, '经典之作，历久弥新。', null, null);
INSERT INTO `movies` VALUES ('84', null, '阳光姐妹淘', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1374786017.jpg', null, null, '8.8', null, null, '再多各自牛逼的时光，也比不上一起傻逼的岁月。 ', null, null);
INSERT INTO `movies` VALUES ('85', null, '重庆森林', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792381411.jpg', null, null, '8.6', null, null, '寂寞没有期限。', null, null);
INSERT INTO `movies` VALUES ('86', null, '上帝之城', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455677490.jpg', null, null, '8.9', null, null, '被上帝抛弃了的上帝之城。', null, null);
INSERT INTO `movies` VALUES ('87', null, '禁闭岛', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1832875827.jpg', null, null, '8.6', null, null, '昔日翩翩少年，今日大腹便便。', null, null);
INSERT INTO `movies` VALUES ('88', null, '甜蜜蜜', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2223011274.jpg', null, null, '8.7', null, null, '相逢只要一瞬间，等待却像是一辈子。', null, null);
INSERT INTO `movies` VALUES ('89', null, '致命ID', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p453720880.jpg', null, null, '8.6', null, null, '最不可能的那个人永远是最可能的。', null, null);
INSERT INTO `movies` VALUES ('9', null, '盗梦空间', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p513344864.jpg', null, null, '9.2', null, null, '诺兰给了我们一场无法盗取的梦。', null, null);
INSERT INTO `movies` VALUES ('90', null, '告白', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p689520756.jpg', null, null, '8.6', null, null, '没有一人完全善，也没有一人完全恶。', null, null);
INSERT INTO `movies` VALUES ('91', null, '一一', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2119675128.jpg', null, null, '8.9', null, null, '我们都曾经是一一。', null, null);
INSERT INTO `movies` VALUES ('92', null, '加勒比海盗', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1596085504.jpg', null, null, '8.6', null, null, '约翰尼·德普的独角戏。', null, null);
INSERT INTO `movies` VALUES ('93', null, '爱在黎明破晓前', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1486234122.jpg', null, null, '8.7', null, null, '缘分是个连绵词，最美不过一瞬。', null, null);
INSERT INTO `movies` VALUES ('94', null, '阿凡达', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p492458287.jpg', null, null, '8.6', null, null, '绝对意义上的美轮美奂。', null, null);
INSERT INTO `movies` VALUES ('95', null, '风之谷', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1917567652.jpg', null, null, '8.8', null, null, '动画片的圣经。', null, null);
INSERT INTO `movies` VALUES ('96', null, '萤火虫之墓', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1157334208.jpg', null, null, '8.7', null, null, '幸福是生生不息，却难以触及的远。 ', null, null);
INSERT INTO `movies` VALUES ('97', null, '布达佩斯大饭店', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2178872593.jpg', null, null, '8.7', null, null, '小清新的故事里注入了大历史的情怀。', null, null);
INSERT INTO `movies` VALUES ('98', null, '狩猎', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1546987967.jpg', null, null, '9', null, null, '人言可畏。', null, null);
INSERT INTO `movies` VALUES ('99', null, '断背山', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p513535588.jpg', null, null, '8.6', null, null, '每个人心中都有一座断背山。', null, null);

-- ----------------------------
-- Table structure for `movies_peoples`
-- ----------------------------
DROP TABLE IF EXISTS `movies_peoples`;
CREATE TABLE `movies_peoples` (
  `movie_id` char(64) NOT NULL,
  `people_id` char(64) NOT NULL,
  `type` char(32) DEFAULT NULL COMMENT '人种类- 导演 演员 编剧',
  PRIMARY KEY (`movie_id`,`people_id`),
  KEY `movies_peoples_writer_id_famouspeoples_foreignkey` (`people_id`),
  CONSTRAINT `movies_peoples_movie_id_movies_foreignkey` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movies_peoples_writer_id_famouspeoples_foreignkey` FOREIGN KEY (`people_id`) REFERENCES `famouspeoples` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movies_peoples
-- ----------------------------

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
INSERT INTO `movies_spider_assignment` VALUES ('27', '熔炉', '27', 'https://movie.douban.com/subject/5912992/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1363250216.jpg', '9.2', '我们一路奋战不是为了改变世界，而是为了不让世界改变我们。');
INSERT INTO `movies_spider_assignment` VALUES ('28', '怦然心动', '28', 'https://movie.douban.com/subject/3319755/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p663036666.jpg', '8.9', '真正的幸福是来自内心深处。');
INSERT INTO `movies_spider_assignment` VALUES ('29', '罗马假日', '29', 'https://movie.douban.com/subject/1293839/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2189265085.jpg', '8.9', '爱情哪怕只有一天。');
INSERT INTO `movies_spider_assignment` VALUES ('30', '天空之城', '30', 'https://movie.douban.com/subject/1291583/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1446261379.jpg', '9.0', '对天空的追逐，永不停止。 ');
INSERT INTO `movies_spider_assignment` VALUES ('31', '少年派的奇幻漂流', '31', 'https://movie.douban.com/subject/1929463/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1784592701.jpg', '9.0', '瑰丽壮观、无人能及的冒险之旅。');
INSERT INTO `movies_spider_assignment` VALUES ('32', '大话西游之月光宝盒', '32', 'https://movie.douban.com/subject/1299398/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1280323646.jpg', '8.9', '旷古烁今。');
INSERT INTO `movies_spider_assignment` VALUES ('33', '鬼子来了', '33', 'https://movie.douban.com/subject/1291858/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1181775734.jpg', '9.1', '对敌人的仁慈，就是对自己残忍。');
INSERT INTO `movies_spider_assignment` VALUES ('34', '两杆大烟枪', '34', 'https://movie.douban.com/subject/1293350/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792443418.jpg', '9.0', '4个臭皮匠顶个诸葛亮，盖·里奇果然不是盖的。');
INSERT INTO `movies_spider_assignment` VALUES ('35', '蝙蝠侠：黑暗骑士', '35', 'https://movie.douban.com/subject/1851857/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p462657443.jpg', '9.0', '无尽的黑暗。');
INSERT INTO `movies_spider_assignment` VALUES ('36', '飞屋环游记', '36', 'https://movie.douban.com/subject/2129039/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p465583562.jpg', '8.9', '最后那些最无聊的事情，才是最值得怀念的。 ');
INSERT INTO `movies_spider_assignment` VALUES ('37', '星际穿越', '37', 'https://movie.douban.com/subject/1889243/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2206088801.jpg', '9.1', '爱是一种力量，让我们超越时空感知它的存在。');
INSERT INTO `movies_spider_assignment` VALUES ('38', '飞越疯人院', '38', 'https://movie.douban.com/subject/1292224/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792238287.jpg', '9.0', '自由万岁。');
INSERT INTO `movies_spider_assignment` VALUES ('39', '窃听风暴', '39', 'https://movie.douban.com/subject/1900841/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1808872109.jpg', '9.1', '别样人生。');
INSERT INTO `movies_spider_assignment` VALUES ('40', '活着', '40', 'https://movie.douban.com/subject/1292365/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173575484.jpg', '9.0', '张艺谋最好的电影。');
INSERT INTO `movies_spider_assignment` VALUES ('41', '海豚湾', '41', 'https://movie.douban.com/subject/3442220/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455222172.jpg', '9.3', '海豚的微笑，是世界上最高明的伪装。');
INSERT INTO `movies_spider_assignment` VALUES ('42', '闻香识女人', '42', 'https://movie.douban.com/subject/1298624/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p925123037.jpg', '8.9', '史上最美的探戈。');
INSERT INTO `movies_spider_assignment` VALUES ('43', 'V字仇杀队', '43', 'https://movie.douban.com/subject/1309046/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1465235231.jpg', '8.8', '一张面具背后的理想与革命。');
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
INSERT INTO `movies_spider_assignment` VALUES ('59', '辩护人', '59', 'https://movie.douban.com/subject/21937445/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2158166535.jpg', '9.1', '电影的现实意义大过电影本身。');
INSERT INTO `movies_spider_assignment` VALUES ('60', '剪刀手爱德华', '60', 'https://movie.douban.com/subject/1292370/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p480956937.jpg', '8.7', '浪漫忧郁的成人童话。');
INSERT INTO `movies_spider_assignment` VALUES ('61', '小鞋子', '61', 'https://movie.douban.com/subject/1303021/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173580603.jpg', '9.2', '奔跑的孩子是天使。');
INSERT INTO `movies_spider_assignment` VALUES ('62', '音乐之声', '62', 'https://movie.douban.com/subject/1294408/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p453788577.jpg', '8.9', '用音乐化解仇恨，让歌声串起美好。');
INSERT INTO `movies_spider_assignment` VALUES ('63', '饮食男女', '63', 'https://movie.douban.com/subject/1291818/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910899751.jpg', '9.0', '人生不能像做菜，把所有的料都准备好了才下锅。');
INSERT INTO `movies_spider_assignment` VALUES ('64', '控方证人', '64', 'https://movie.douban.com/subject/1296141/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1505392928.jpg', '9.6', '比利·怀德满分作品。');
INSERT INTO `movies_spider_assignment` VALUES ('65', '低俗小说', '65', 'https://movie.douban.com/subject/1291832/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910902213.jpg', '8.7', '故事的高级讲法。');
INSERT INTO `movies_spider_assignment` VALUES ('66', '入殓师', '66', 'https://movie.douban.com/subject/2149806/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p594972928.jpg', '8.8', '死可能是一道门，逝去并不是终结，而是超越，走向下一程。');
INSERT INTO `movies_spider_assignment` VALUES ('67', '本杰明·巴顿奇事', '67', 'https://movie.douban.com/subject/1485260/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p475749652.jpg', '8.7', '在时间之河里感受溺水之苦。');
INSERT INTO `movies_spider_assignment` VALUES ('68', '沉默的羔羊', '68', 'https://movie.douban.com/subject/1293544/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1593414327.jpg', '8.7', '安东尼·霍普金斯的顶级表演。');
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
INSERT INTO `movies_spider_assignment` VALUES ('94', '阿凡达', '94', 'https://movie.douban.com/subject/1652587/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p492458287.jpg', '8.6', '绝对意义上的美轮美奂。');
INSERT INTO `movies_spider_assignment` VALUES ('95', '风之谷', '95', 'https://movie.douban.com/subject/1291585/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1917567652.jpg', '8.8', '动画片的圣经。');
INSERT INTO `movies_spider_assignment` VALUES ('96', '萤火虫之墓', '96', 'https://movie.douban.com/subject/1293318/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1157334208.jpg', '8.7', '幸福是生生不息，却难以触及的远。 ');
INSERT INTO `movies_spider_assignment` VALUES ('97', '布达佩斯大饭店', '97', 'https://movie.douban.com/subject/11525673/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2178872593.jpg', '8.7', '小清新的故事里注入了大历史的情怀。');
INSERT INTO `movies_spider_assignment` VALUES ('98', '狩猎', '98', 'https://movie.douban.com/subject/6985810/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1546987967.jpg', '9.0', '人言可畏。');
INSERT INTO `movies_spider_assignment` VALUES ('99', '断背山', '99', 'https://movie.douban.com/subject/1418834/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p513535588.jpg', '8.6', '每个人心中都有一座断背山。');
INSERT INTO `movies_spider_assignment` VALUES ('100', '爱在日落黄昏时', '100', 'https://movie.douban.com/subject/1291990/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910924055.jpg', '8.7', '九年后的重逢是世俗和责任的交叠，没了悸动和青涩，沧桑而温暖。');
INSERT INTO `movies_spider_assignment` VALUES ('101', '猫鼠游戏', '101', 'https://movie.douban.com/subject/1305487/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p453924541.jpg', '8.7', '骗子大师和执著警探的你追我跑故事。 ');
INSERT INTO `movies_spider_assignment` VALUES ('102', '侧耳倾听', '102', 'https://movie.douban.com/subject/1297052/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456692072.jpg', '8.8', '少女情怀总是诗。');
INSERT INTO `movies_spider_assignment` VALUES ('103', '摩登时代', '103', 'https://movie.douban.com/subject/1294371/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2173707976.jpg', '9.2', '大时代中的人生，小人物的悲喜。');
INSERT INTO `movies_spider_assignment` VALUES ('104', '驯龙高手', '104', 'https://movie.douban.com/subject/2353023/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p450042258.jpg', '8.7', '和谐的生活离不开摸头与被摸头。');
INSERT INTO `movies_spider_assignment` VALUES ('105', '末代皇帝', '105', 'https://movie.douban.com/subject/1293172/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p452088641.jpg', '8.8', '“不要跟我比惨，我比你更惨”再适合这部电影不过了。');
INSERT INTO `movies_spider_assignment` VALUES ('106', '哈利·波特与魔法石', '106', 'https://movie.douban.com/subject/1295038/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p804947166.jpg', '8.6', '童话世界的开端。');
INSERT INTO `movies_spider_assignment` VALUES ('107', '超脱', '107', 'https://movie.douban.com/subject/5322596/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1305562621.jpg', '8.7', '穷尽一生，我们要学会的，不过是彼此拥抱。');
INSERT INTO `movies_spider_assignment` VALUES ('108', '海洋', '108', 'https://movie.douban.com/subject/3443389/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p497010372.jpg', '9.0', '大海啊，不全是水。');
INSERT INTO `movies_spider_assignment` VALUES ('109', '幸福终点站', '109', 'https://movie.douban.com/subject/1292274/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p854757687.jpg', '8.6', '有时候幸福需要等一等。 ');
INSERT INTO `movies_spider_assignment` VALUES ('110', '燃情岁月', '110', 'https://movie.douban.com/subject/1295865/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1023654037.jpg', '8.8', '传奇，不是每个人都可以拥有。');
INSERT INTO `movies_spider_assignment` VALUES ('111', '穿条纹睡衣的男孩', '111', 'https://movie.douban.com/subject/3008247/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1473670352.jpg', '8.8', '尽管有些不切实际的幻想，这部电影依旧是一部感人肺腑的佳作。');
INSERT INTO `movies_spider_assignment` VALUES ('112', '谍影重重3', '112', 'https://movie.douban.com/subject/1578507/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792223507.jpg', '8.7', '像吃了苏打饼一样干脆的电影。');
INSERT INTO `movies_spider_assignment` VALUES ('113', '菊次郎的夏天', '113', 'https://movie.douban.com/subject/1293359/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p751835224.jpg', '8.7', '从没见过那么流氓的温柔，从没见过那么温柔的流氓。');
INSERT INTO `movies_spider_assignment` VALUES ('114', '电锯惊魂', '114', 'https://movie.douban.com/subject/1417598/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2163771304.jpg', '8.6', '真相就在眼前。');
INSERT INTO `movies_spider_assignment` VALUES ('115', '神偷奶爸', '115', 'https://movie.douban.com/subject/3287562/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792776858.jpg', '8.5', 'Mr. I Don\'t Care其实也有Care的时候。');
INSERT INTO `movies_spider_assignment` VALUES ('116', '真爱至上', '116', 'https://movie.douban.com/subject/1292401/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p475600770.jpg', '8.5', '爱，是个动词。');
INSERT INTO `movies_spider_assignment` VALUES ('117', '借东西的小人阿莉埃蒂', '117', 'https://movie.douban.com/subject/4202302/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p617533616.jpg', '8.7', '曾经的那段美好会沉淀为一辈子的记忆。');
INSERT INTO `movies_spider_assignment` VALUES ('118', '倩女幽魂', '118', 'https://movie.douban.com/subject/1297447/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2347277555.jpg', '8.6', '两张绝世的脸。 ');
INSERT INTO `movies_spider_assignment` VALUES ('119', '岁月神偷', '119', 'https://movie.douban.com/subject/3792799/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456666151.jpg', '8.6', '岁月流逝，来日可追。');
INSERT INTO `movies_spider_assignment` VALUES ('120', '虎口脱险', '120', 'https://movie.douban.com/subject/1296909/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2399597512.jpg', '8.9', '永远看不腻的喜剧。');
INSERT INTO `movies_spider_assignment` VALUES ('121', '雨人', '121', 'https://movie.douban.com/subject/1291870/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p942376281.jpg', '8.6', '生活在自己的世界里，也可以让周围的人显得可笑和渺小。');
INSERT INTO `movies_spider_assignment` VALUES ('122', '消失的爱人', '122', 'https://movie.douban.com/subject/21318488/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2221768894.jpg', '8.7', '');
INSERT INTO `movies_spider_assignment` VALUES ('123', '七武士', '123', 'https://movie.douban.com/subject/1295399/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p647099823.jpg', '9.1', '时代悲歌。');
INSERT INTO `movies_spider_assignment` VALUES ('124', '贫民窟的百万富翁', '124', 'https://movie.douban.com/subject/2209573/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p470476887.jpg', '8.5', '上帝之城+猜火车+阿甘正传+开心辞典=山寨富翁');
INSERT INTO `movies_spider_assignment` VALUES ('125', '恐怖直播', '125', 'https://movie.douban.com/subject/21360417/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2016930906.jpg', '8.7', '恐怖分子的“秋菊打官司”。');
INSERT INTO `movies_spider_assignment` VALUES ('126', '记忆碎片', '126', 'https://movie.douban.com/subject/1304447/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p641688453.jpg', '8.5', '一个针管引发的血案。');
INSERT INTO `movies_spider_assignment` VALUES ('127', '东邪西毒', '127', 'https://movie.douban.com/subject/1292328/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1982176012.jpg', '8.6', '电影诗。');
INSERT INTO `movies_spider_assignment` VALUES ('128', '疯狂原始人', '128', 'https://movie.douban.com/subject/1907966/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1867084027.jpg', '8.7', '老少皆宜，这就是好莱坞动画的魅力。');
INSERT INTO `movies_spider_assignment` VALUES ('129', '怪兽电力公司', '129', 'https://movie.douban.com/subject/1291579/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1805127697.jpg', '8.6', '不要给它起名字，起了名字就有感情了。');
INSERT INTO `movies_spider_assignment` VALUES ('130', '杀人回忆', '130', 'https://movie.douban.com/subject/1300299/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p480225538.jpg', '8.6', '关于连环杀人悬案的集体回忆。');
INSERT INTO `movies_spider_assignment` VALUES ('131', '红辣椒', '131', 'https://movie.douban.com/subject/1865703/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p672363704.jpg', '8.8', '梦的勾结。');
INSERT INTO `movies_spider_assignment` VALUES ('132', '卢旺达饭店', '132', 'https://movie.douban.com/subject/1291822/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2159368352.jpg', '8.8', '当这个世界闭上双眼，他却敞开了怀抱。');
INSERT INTO `movies_spider_assignment` VALUES ('133', '穿越时空的少女', '133', 'https://movie.douban.com/subject/1937946/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2079334286.jpg', '8.6', '爱上未来的你。 ');
INSERT INTO `movies_spider_assignment` VALUES ('134', '魂断蓝桥', '134', 'https://movie.douban.com/subject/1293964/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2351134499.jpg', '8.8', '中国式内在的美国电影。');
INSERT INTO `movies_spider_assignment` VALUES ('135', '黑天鹅', '135', 'https://movie.douban.com/subject/1978709/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p719282906.jpg', '8.5', '黑暗之美。');
INSERT INTO `movies_spider_assignment` VALUES ('136', '恋恋笔记本', '136', 'https://movie.douban.com/subject/1309163/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p483604864.jpg', '8.5', '爱情没有那么多借口，如果不能圆满，只能说明爱的不够。 ');
INSERT INTO `movies_spider_assignment` VALUES ('137', '猜火车', '137', 'https://movie.douban.com/subject/1292528/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p513567548.jpg', '8.5', '不可猜的青春迷笛。 ');
INSERT INTO `movies_spider_assignment` VALUES ('138', '喜宴', '138', 'https://movie.douban.com/subject/1303037/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p2173713676.jpg', '8.8', '中国家庭的喜怒哀乐忍。');
INSERT INTO `movies_spider_assignment` VALUES ('139', '英雄本色', '139', 'https://movie.douban.com/subject/1297574/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2157672975.jpg', '8.7', '英雄泪短，兄弟情长。 ');
INSERT INTO `movies_spider_assignment` VALUES ('140', '傲慢与偏见', '140', 'https://movie.douban.com/subject/1418200/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p452005185.jpg', '8.4', '爱是摈弃傲慢与偏见之后的曙光。');
INSERT INTO `movies_spider_assignment` VALUES ('141', '教父3', '141', 'https://movie.douban.com/subject/1294240/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2169664351.jpg', '8.7', '任何信念的力量，都无法改变命运。');
INSERT INTO `movies_spider_assignment` VALUES ('142', '雨中曲', '142', 'https://movie.douban.com/subject/1293460/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1612355875.jpg', '8.9', '骨灰级歌舞片。');
INSERT INTO `movies_spider_assignment` VALUES ('143', '完美的世界', '143', 'https://movie.douban.com/subject/1300992/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792403691.jpg', '9.0', '坏人的好总是比好人的好来得更感人。');
INSERT INTO `movies_spider_assignment` VALUES ('144', '玩具总动员3', '144', 'https://movie.douban.com/subject/1858711/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1283675359.jpg', '8.7', '跨度十五年的欢乐与泪水。');
INSERT INTO `movies_spider_assignment` VALUES ('145', '小森林 夏秋篇', '145', 'https://movie.douban.com/subject/25814705/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2221319641.jpg', '8.9', '');
INSERT INTO `movies_spider_assignment` VALUES ('146', '纵横四海', '146', 'https://movie.douban.com/subject/1295409/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p933122297.jpg', '8.7', '香港浪漫主义警匪动作片的巅峰之作。');
INSERT INTO `movies_spider_assignment` VALUES ('147', '喜剧之王', '147', 'https://movie.douban.com/subject/1302425/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1043597424.jpg', '8.4', '我是一个演员。');
INSERT INTO `movies_spider_assignment` VALUES ('148', '人工智能', '148', 'https://movie.douban.com/subject/1302827/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p792257137.jpg', '8.6', '对爱的执着，可以超越一切。');
INSERT INTO `movies_spider_assignment` VALUES ('149', '萤火之森', '149', 'https://movie.douban.com/subject/5989818/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1272904657.jpg', '8.7', '触不到的恋人。');
INSERT INTO `movies_spider_assignment` VALUES ('150', '我是山姆', '150', 'https://movie.douban.com/subject/1306861/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p652417775.jpg', '8.8', '爱并不需要智商 。');
INSERT INTO `movies_spider_assignment` VALUES ('151', '香水', '151', 'https://movie.douban.com/subject/1760622/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p470006658.jpg', '8.4', '一个单凭体香达到高潮的男人。');
INSERT INTO `movies_spider_assignment` VALUES ('152', '冰川时代', '152', 'https://movie.douban.com/subject/1291578/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910895719.jpg', '8.4', '松鼠才是角儿。');
INSERT INTO `movies_spider_assignment` VALUES ('153', '浪潮', '153', 'https://movie.douban.com/subject/2297265/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1344888983.jpg', '8.7', '世界离独裁只有五天。');
INSERT INTO `movies_spider_assignment` VALUES ('154', '撞车', '154', 'https://movie.douban.com/subject/1388216/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2075132390.jpg', '8.6', '天使与魔鬼的冲撞。');
INSERT INTO `movies_spider_assignment` VALUES ('155', '7号房的礼物', '155', 'https://movie.douban.com/subject/10777687/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1816276065.jpg', '8.6', '《我是山姆》的《美丽人生》。');
INSERT INTO `movies_spider_assignment` VALUES ('156', '哈利·波特与死亡圣器(下)', '156', 'https://movie.douban.com/subject/3011235/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p917846733.jpg', '8.6', '10年的完美句点。');
INSERT INTO `movies_spider_assignment` VALUES ('157', '朗读者', '157', 'https://movie.douban.com/subject/2213597/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1140984198.jpg', '8.5', '当爱情跨越年龄的界限，它似乎能变得更久远一点，成为一种责任，一种水到渠成的相濡以沫。 ');
INSERT INTO `movies_spider_assignment` VALUES ('158', '花样年华', '158', 'https://movie.douban.com/subject/1291557/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1910828286.jpg', '8.4', '偷情本没有这样美。');
INSERT INTO `movies_spider_assignment` VALUES ('159', '追随', '159', 'https://movie.douban.com/subject/1397546/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2074443514.jpg', '9.0', '诺兰的牛逼来源于内心散发出的恐惧。');
INSERT INTO `movies_spider_assignment` VALUES ('160', '秒速5厘米', '160', 'https://movie.douban.com/subject/2043546/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p982896012.jpg', '8.4', '青春就是放弃和怀念。');
INSERT INTO `movies_spider_assignment` VALUES ('161', '碧海蓝天', '161', 'https://movie.douban.com/subject/1300960/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p455724599.jpg', '8.7', '在那片深蓝中，感受来自大海的忧伤寂寞与美丽自由。');
INSERT INTO `movies_spider_assignment` VALUES ('162', '疯狂动物城', '162', 'https://movie.douban.com/subject/25662329/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2315672647.jpg', '9.2', '');
INSERT INTO `movies_spider_assignment` VALUES ('163', '罗生门', '163', 'https://movie.douban.com/subject/1291879/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1864872647.jpg', '8.7', '人生的N种可能性。');
INSERT INTO `movies_spider_assignment` VALUES ('164', '梦之安魂曲', '164', 'https://movie.douban.com/subject/1292270/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p884936202.jpg', '8.7', '一场没有春天的噩梦。');
INSERT INTO `movies_spider_assignment` VALUES ('165', '战争之王', '165', 'https://movie.douban.com/subject/1419936/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p453719066.jpg', '8.5', '做一颗让别人需要你的棋子。');
INSERT INTO `movies_spider_assignment` VALUES ('166', '可可西里', '166', 'https://movie.douban.com/subject/1308857/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2363208684.jpg', '8.6', '坚硬的信仰。');
INSERT INTO `movies_spider_assignment` VALUES ('167', '一次别离', '167', 'https://movie.douban.com/subject/5964718/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2189835254.jpg', '8.7', '只有有信仰的人才能说出事实真相。');
INSERT INTO `movies_spider_assignment` VALUES ('168', '心迷宫', '168', 'https://movie.douban.com/subject/25917973/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2275298525.jpg', '8.6', '');
INSERT INTO `movies_spider_assignment` VALUES ('169', '海盗电台', '169', 'https://movie.douban.com/subject/3007773/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p769608791.jpg', '8.6', '生命不止，摇滚不死。');
INSERT INTO `movies_spider_assignment` VALUES ('170', '超能陆战队', '170', 'https://movie.douban.com/subject/11026735/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2224568669.jpg', '8.6', '');
INSERT INTO `movies_spider_assignment` VALUES ('171', '唐伯虎点秋香', '171', 'https://movie.douban.com/subject/1306249/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1946455272.jpg', '8.3', '华太师是黄霑，吴镇宇四大才子之一。');
INSERT INTO `movies_spider_assignment` VALUES ('172', '时空恋旅人', '172', 'https://movie.douban.com/subject/10577869/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2070153774.jpg', '8.6', '把每天当作最后一天般珍惜度过，积极拥抱生活，就是幸福。');
INSERT INTO `movies_spider_assignment` VALUES ('173', '谍影重重2', '173', 'https://movie.douban.com/subject/1308767/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p667644866.jpg', '8.5', '谁说王家卫镜头很晃？');
INSERT INTO `movies_spider_assignment` VALUES ('174', '谍影重重', '174', 'https://movie.douban.com/subject/1304102/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1597183981.jpg', '8.5', '哗啦啦啦啦，天在下雨，哗啦啦啦啦，云在哭泣……找自己。');
INSERT INTO `movies_spider_assignment` VALUES ('175', '蝙蝠侠：黑暗骑士崛起', '175', 'https://movie.douban.com/subject/3395373/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1706428744.jpg', '8.5', '诺兰就是保证。');
INSERT INTO `movies_spider_assignment` VALUES ('176', '地球上的星星', '176', 'https://movie.douban.com/subject/2363506/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1973489335.jpg', '8.8', '天使保护事件始末。');
INSERT INTO `movies_spider_assignment` VALUES ('177', '迁徙的鸟', '177', 'https://movie.douban.com/subject/1292281/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2238274168.jpg', '9.1', '最美的飞翔。');
INSERT INTO `movies_spider_assignment` VALUES ('178', '荒野生存', '178', 'https://movie.douban.com/subject/1905462/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p465687407.jpg', '8.6', '出门必备：本草纲目。');
INSERT INTO `movies_spider_assignment` VALUES ('179', '阿飞正传', '179', 'https://movie.douban.com/subject/1305690/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p924558512.jpg', '8.5', '王家卫是一种风格，张国荣是一个代表。');
INSERT INTO `movies_spider_assignment` VALUES ('180', '绿里奇迹', '180', 'https://movie.douban.com/subject/1300374/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p767586451.jpg', '8.7', '天使暂时离开。');
INSERT INTO `movies_spider_assignment` VALUES ('181', '勇闯夺命岛', '181', 'https://movie.douban.com/subject/1292728/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p636048104.jpg', '8.5', '类型片的极致。 ');
INSERT INTO `movies_spider_assignment` VALUES ('182', '荒蛮故事', '182', 'https://movie.douban.com/subject/24750126/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2192834364.jpg', '8.7', '');
INSERT INTO `movies_spider_assignment` VALUES ('183', '恐怖游轮', '183', 'https://movie.douban.com/subject/3011051/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p462470694.jpg', '8.3', '不要企图在重复中寻找已经失去的爱。');
INSERT INTO `movies_spider_assignment` VALUES ('184', '惊魂记', '184', 'https://movie.douban.com/subject/1293181/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1021883305.jpg', '8.8', '故事的反转与反转，分裂电影的始祖。');
INSERT INTO `movies_spider_assignment` VALUES ('185', '燕尾蝶', '185', 'https://movie.douban.com/subject/1307793/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p532195562.jpg', '8.6', '现实与童话交相辉映的旅程。');
INSERT INTO `movies_spider_assignment` VALUES ('186', '小森林 冬春篇', '186', 'https://movie.douban.com/subject/25814707/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2215147728.jpg', '8.9', '');
INSERT INTO `movies_spider_assignment` VALUES ('187', '魔女宅急便', '187', 'https://movie.douban.com/subject/1307811/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p456676352.jpg', '8.4', '宫崎骏的电影总让人感觉世界是美好的，阳光明媚的。');
INSERT INTO `movies_spider_assignment` VALUES ('188', '卡萨布兰卡', '188', 'https://movie.douban.com/subject/1296753/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1244791866.jpg', '8.6', '与同名歌曲无关。');
INSERT INTO `movies_spider_assignment` VALUES ('189', '达拉斯买家俱乐部', '189', 'https://movie.douban.com/subject/1793929/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2166160837.jpg', '8.6', 'Jared Leto的腿比女人还美！');
INSERT INTO `movies_spider_assignment` VALUES ('190', '再次出发之纽约遇见你', '190', 'https://movie.douban.com/subject/6874403/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2250287733.jpg', '8.5', '爱我就给我看你的播放列表。');
INSERT INTO `movies_spider_assignment` VALUES ('191', '英国病人', '191', 'https://movie.douban.com/subject/1291853/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2408623752.jpg', '8.4', 'In memory, love lives forever...');
INSERT INTO `movies_spider_assignment` VALUES ('192', '这个男人来自地球', '192', 'https://movie.douban.com/subject/2300586/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p513303986.jpg', '8.5', '科幻真正的魅力不是视觉效果能取代的。 ');
INSERT INTO `movies_spider_assignment` VALUES ('193', '变脸', '193', 'https://movie.douban.com/subject/1292659/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173855883.jpg', '8.4', '当发哥的风衣、墨镜出现在了凯奇身上⋯⋯');
INSERT INTO `movies_spider_assignment` VALUES ('194', '未麻的部屋', '194', 'https://movie.douban.com/subject/1395091/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1351050722.jpg', '8.8', '好的剧本是，就算你猜到了结局也猜不到全部。');
INSERT INTO `movies_spider_assignment` VALUES ('195', '东京物语', '195', 'https://movie.douban.com/subject/1291568/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910832390.jpg', '9.2', '东京那么大，如果有一天走失了，恐怕一辈子不能再相见。');
INSERT INTO `movies_spider_assignment` VALUES ('196', '爆裂鼓手', '196', 'https://movie.douban.com/subject/25773932/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2220776342.jpg', '8.6', '');
INSERT INTO `movies_spider_assignment` VALUES ('197', '终结者2：审判日', '197', 'https://movie.douban.com/subject/1291844/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910909085.jpg', '8.5', '少见的超越首部的续集，动作片中的经典。');
INSERT INTO `movies_spider_assignment` VALUES ('198', '被解救的姜戈', '198', 'https://movie.douban.com/subject/6307447/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1959232369.jpg', '8.5', '热血沸腾，那个低俗、性感的无耻混蛋又来了。');
INSERT INTO `movies_spider_assignment` VALUES ('199', '叫我第一名', '199', 'https://movie.douban.com/subject/4798888/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p496133870.jpg', '8.6', '乐观比一切都有力量。');
INSERT INTO `movies_spider_assignment` VALUES ('200', '牯岭街少年杀人事件', '200', 'https://movie.douban.com/subject/1292329/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p848381236.jpg', '8.7', '弱者送给弱者的一刀。');
INSERT INTO `movies_spider_assignment` VALUES ('201', 'E.T. 外星人', '201', 'https://movie.douban.com/subject/1294638/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p984732992.jpg', '8.5', '生病的E.T.皮肤的颜色就像柿子饼。');
INSERT INTO `movies_spider_assignment` VALUES ('202', '末路狂花', '202', 'https://movie.douban.com/subject/1291992/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p794583044.jpg', '8.7', '没有了退路，只好飞向自由。');
INSERT INTO `movies_spider_assignment` VALUES ('203', '忠犬八公物语', '203', 'https://movie.douban.com/subject/1959195/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2297934945.jpg', '9.0', '养狗三日，便会对你终其一生。');
INSERT INTO `movies_spider_assignment` VALUES ('204', '哪吒闹海', '204', 'https://movie.douban.com/subject/1307315/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2163636038.jpg', '8.8', '想你时你在闹海。');
INSERT INTO `movies_spider_assignment` VALUES ('205', '发条橙', '205', 'https://movie.douban.com/subject/1292233/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p529908155.jpg', '8.4', '我完全康复了。');
INSERT INTO `movies_spider_assignment` VALUES ('206', '穆赫兰道', '206', 'https://movie.douban.com/subject/1292217/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p792248233.jpg', '8.3', '大卫·林奇的梦境迷宫。');
INSERT INTO `movies_spider_assignment` VALUES ('207', '源代码', '207', 'https://movie.douban.com/subject/3075287/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p988260245.jpg', '8.3', '邓肯·琼斯继《月球》之后再度奉献出一部精彩绝伦的科幻佳作。');
INSERT INTO `movies_spider_assignment` VALUES ('208', '黑客帝国3：矩阵革命', '208', 'https://movie.douban.com/subject/1302467/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p443461818.jpg', '8.5', '不得不说，《黑客帝国》系列是商业片与科幻、哲学完美结合的典范。');
INSERT INTO `movies_spider_assignment` VALUES ('209', '青蛇', '209', 'https://movie.douban.com/subject/1303394/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p584021784.jpg', '8.4', '人生如此，浮生如斯。谁人言，花彼岸，此生情长意短。谁都是不懂爱的罢了。');
INSERT INTO `movies_spider_assignment` VALUES ('210', '非常嫌疑犯', '210', 'https://movie.douban.com/subject/1292214/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p470383576.jpg', '8.6', '我不信仰上帝，但我敬畏上帝。');
INSERT INTO `movies_spider_assignment` VALUES ('211', '美国丽人', '211', 'https://movie.douban.com/subject/1292062/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p571671715.jpg', '8.4', '每个人的内心都是深不可测的大海。 ');
INSERT INTO `movies_spider_assignment` VALUES ('212', '新龙门客栈', '212', 'https://movie.douban.com/subject/1292287/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1421018669.jpg', '8.4', '嬉笑怒骂，调风动月。');
INSERT INTO `movies_spider_assignment` VALUES ('213', '黄金三镖客', '213', 'https://movie.douban.com/subject/1401118/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2101693489.jpg', '9.1', '最棒的西部片。');
INSERT INTO `movies_spider_assignment` VALUES ('214', '上帝也疯狂', '214', 'https://movie.douban.com/subject/1297478/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2173719647.jpg', '8.6', '纯净原始的笑与感动。');
INSERT INTO `movies_spider_assignment` VALUES ('215', '无耻混蛋', '215', 'https://movie.douban.com/subject/1438652/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p770734475.jpg', '8.4', '昆汀同学越来越变态了，比北野武还杜琪峰。');
INSERT INTO `movies_spider_assignment` VALUES ('216', '城市之光', '216', 'https://movie.douban.com/subject/1293908/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2099815842.jpg', '9.2', '永远的小人物，伟大的卓别林。');
INSERT INTO `movies_spider_assignment` VALUES ('217', '爱·回家', '217', 'https://movie.douban.com/subject/1299361/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2107418134.jpg', '9.0', '献给所有外婆的电影。');
INSERT INTO `movies_spider_assignment` VALUES ('218', '勇士', '218', 'https://movie.douban.com/subject/3217169/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1145536386.jpg', '8.9', '热血沸腾，相当完美的娱乐拳击大餐。');
INSERT INTO `movies_spider_assignment` VALUES ('219', '初恋这件小事', '219', 'https://movie.douban.com/subject/4739952/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1505312273.jpg', '8.2', '黑小鸭速效美白记。');
INSERT INTO `movies_spider_assignment` VALUES ('220', '曾经', '220', 'https://movie.douban.com/subject/2053515/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173720203.jpg', '8.3', '有些幸福无关爱情。');
INSERT INTO `movies_spider_assignment` VALUES ('221', '蓝色大门', '221', 'https://movie.douban.com/subject/1308575/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p584822570.jpg', '8.2', '青春的窃窃私语。 ');
INSERT INTO `movies_spider_assignment` VALUES ('222', '麦兜故事', '222', 'https://movie.douban.com/subject/1302476/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p804938713.jpg', '8.5', '麦兜是一只很哲学的猪。 ');
INSERT INTO `movies_spider_assignment` VALUES ('223', '暖暖内含光', '223', 'https://movie.douban.com/subject/1308777/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p479565065.jpg', '8.4', '恋爱是一次神经的冒险。就算失去记忆，也会爱上你。');
INSERT INTO `movies_spider_assignment` VALUES ('224', '无敌破坏王', '224', 'https://movie.douban.com/subject/6534248/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1735642656.jpg', '8.6', '迪士尼和皮克斯拿错剧本的产物。');
INSERT INTO `movies_spider_assignment` VALUES ('225', '蝴蝶', '225', 'https://movie.douban.com/subject/1292056/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1451436171.jpg', '8.6', '我们长途跋涉寻找的东西，有可能一直就在身边。 ');
INSERT INTO `movies_spider_assignment` VALUES ('226', '与狼共舞', '226', 'https://movie.douban.com/subject/1293764/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p499158228.jpg', '8.9', '充满诗意与情怀的史诗作品。 ');
INSERT INTO `movies_spider_assignment` VALUES ('227', '大卫·戈尔的一生', '227', 'https://movie.douban.com/subject/1305725/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2186861098.jpg', '8.7', '捍卫人权只是信仰，一点不妨碍其行为的残忍。');
INSERT INTO `movies_spider_assignment` VALUES ('228', '巴黎淘气帮', '228', 'https://movie.douban.com/subject/3157605/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p465446537.jpg', '8.6', '四百击的反面。');
INSERT INTO `movies_spider_assignment` VALUES ('229', '遗愿清单', '229', 'https://movie.douban.com/subject/1867345/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p708613284.jpg', '8.5', '用剩余不多的时间，去燃烧整个生命。');
INSERT INTO `movies_spider_assignment` VALUES ('230', '国王的演讲', '230', 'https://movie.douban.com/subject/4023638/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p768879237.jpg', '8.3', '皇上无话儿。');
INSERT INTO `movies_spider_assignment` VALUES ('231', '血钻', '231', 'https://movie.douban.com/subject/1428175/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p554741987.jpg', '8.5', '每个美丽事物背后都是滴血的现实。');
INSERT INTO `movies_spider_assignment` VALUES ('232', '夜访吸血鬼', '232', 'https://movie.douban.com/subject/1299327/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1353910572.jpg', '8.3', '弥漫淡淡血腥气的优雅。');
INSERT INTO `movies_spider_assignment` VALUES ('233', '模仿游戏', '233', 'https://movie.douban.com/subject/10463953/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2255040492.jpg', '8.5', '');
INSERT INTO `movies_spider_assignment` VALUES ('234', '偷拐抢骗', '234', 'https://movie.douban.com/subject/1301171/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p616753227.jpg', '8.5', '典型盖·里奇式的英国黑色幽默黑帮片。');
INSERT INTO `movies_spider_assignment` VALUES ('235', '荒岛余生', '235', 'https://movie.douban.com/subject/1298653/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1341248319.jpg', '8.4', '一个人的独角戏。');
INSERT INTO `movies_spider_assignment` VALUES ('236', '爱在暹罗', '236', 'https://movie.douban.com/subject/2365260/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1024585648.jpg', '8.3', '把爱放在心底，有爱就有希望。');
INSERT INTO `movies_spider_assignment` VALUES ('237', '中央车站', '237', 'https://movie.douban.com/subject/1292218/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2239441575.jpg', '8.7', '心灵救赎。');
INSERT INTO `movies_spider_assignment` VALUES ('238', '两小无猜', '238', 'https://movie.douban.com/subject/1308817/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p455472580.jpg', '8.1', 'Love me, if you dare. ');
INSERT INTO `movies_spider_assignment` VALUES ('239', '千钧一发', '239', 'https://movie.douban.com/subject/1300117/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2195672555.jpg', '8.7', '一部能引人思考的科幻励志片。');
INSERT INTO `movies_spider_assignment` VALUES ('240', '月球', '240', 'https://movie.douban.com/subject/3073124/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p449399746.jpg', '8.5', '2009媲美《第九区》的又一部科幻神作。');
INSERT INTO `movies_spider_assignment` VALUES ('241', '疯狂的石头', '241', 'https://movie.douban.com/subject/1862151/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p712241453.jpg', '8.2', '中国版《两杆大烟枪》。');
INSERT INTO `movies_spider_assignment` VALUES ('242', '枪火', '242', 'https://movie.douban.com/subject/1300741/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1538646661.jpg', '8.6', '一群演技精湛的戏骨，奉献出一个精致的黑帮小品，成就杜琪峰群戏的巅峰之作。');
INSERT INTO `movies_spider_assignment` VALUES ('243', '罪恶之城', '243', 'https://movie.douban.com/subject/1309027/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2173716829.jpg', '8.4', '权力不是来自枪和子弹，权力来自谎言。');
INSERT INTO `movies_spider_assignment` VALUES ('244', '寿司之神', '244', 'https://movie.douban.com/subject/6146955/', 'https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1528763106.jpg', '8.8', '仪式主义的狂欢，偏执狂的完胜。');
INSERT INTO `movies_spider_assignment` VALUES ('245', '爱在午夜降临前', '245', 'https://movie.douban.com/subject/10808442/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2001069785.jpg', '8.7', '所谓爱情，就是话唠一路，都不会心生腻烦，彼此嫌弃。');
INSERT INTO `movies_spider_assignment` VALUES ('246', '我爱你', '246', 'https://movie.douban.com/subject/5908478/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1075591188.jpg', '9.0', '你要相信，这世上真的有爱存在，不管在什么年纪 ');
INSERT INTO `movies_spider_assignment` VALUES ('247', '廊桥遗梦', '247', 'https://movie.douban.com/subject/1293929/', 'https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p2190558219.jpg', '8.5', '这样确切的爱，一生只有一次。');
INSERT INTO `movies_spider_assignment` VALUES ('248', '角斗士', '248', 'https://movie.douban.com/subject/1293530/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2268656540.jpg', '8.4', '罗马斗兽场的鸦雀无声，久久停留在这样的肃穆中。');
INSERT INTO `movies_spider_assignment` VALUES ('249', '假如爱有天意', '249', 'https://movie.douban.com/subject/1304073/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p479746811.jpg', '8.2', '琼瑶阿姨在韩国的深刻版。');
INSERT INTO `movies_spider_assignment` VALUES ('250', '黑鹰坠落', '250', 'https://movie.douban.com/subject/1291824/', 'https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910900710.jpg', '8.5', '还原真实而残酷的战争。');

-- ----------------------------
-- Table structure for `movie_comment_impressions`
-- ----------------------------
DROP TABLE IF EXISTS `movie_comment_impressions`;
CREATE TABLE `movie_comment_impressions` (
  `movie_comment_id` char(64) NOT NULL,
  `userid` char(64) NOT NULL,
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

-- ----------------------------
-- Table structure for `movie_picture`
-- ----------------------------
DROP TABLE IF EXISTS `movie_picture`;
CREATE TABLE `movie_picture` (
  `movieid` char(64) NOT NULL,
  `imguri` varchar(255) NOT NULL COMMENT '图片地址 可本地 可url',
  PRIMARY KEY (`movieid`,`imguri`),
  CONSTRAINT `moviepicture_movieid_movies_foreignkey` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `movie_tag`
-- ----------------------------
DROP TABLE IF EXISTS `movie_tag`;
CREATE TABLE `movie_tag` (
  `userid` char(64) NOT NULL,
  `movieid` char(64) NOT NULL,
  `tagid` char(64) NOT NULL,
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

-- ----------------------------
-- Table structure for `tag_meta`
-- ----------------------------
DROP TABLE IF EXISTS `tag_meta`;
CREATE TABLE `tag_meta` (
  `id` char(64) NOT NULL,
  `tagname` varchar(255) DEFAULT NULL COMMENT '标签名字',
  `type` varchar(32) DEFAULT NULL COMMENT '电影 人 等的tag',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag_meta
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` char(64) NOT NULL COMMENT '依赖与user表 如果在user表中没有则不允许插入',
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

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` char(64) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL COMMENT '加密后的密码',
  `salt` varchar(64) DEFAULT NULL,
  `authid` char(64) DEFAULT NULL COMMENT '用于登陆验证，与id配合，作为登陆凭证',
  `permission` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('32058959-6d95-4ccd-b066-4f0a389352ac', 'test', 'test', null, null, '1', '2017-04-13 19:11:52', '2017-04-13 19:11:52');
INSERT INTO `users` VALUES ('bb5e7ceb-4ef3-44f5-94d2-9dd61516d957', 'root', 'toor', null, null, '9', '2017-03-29 11:03:13', '2017-03-29 11:03:13');

-- ----------------------------
-- Table structure for `user_movie_impressions`
-- ----------------------------
DROP TABLE IF EXISTS `user_movie_impressions`;
CREATE TABLE `user_movie_impressions` (
  `id` char(64) NOT NULL,
  `userid` char(64) DEFAULT NULL,
  `movieid` char(64) DEFAULT NULL,
  `score` float(16,0) DEFAULT NULL,
  `hadsaw_wanted` varchar(8) DEFAULT NULL COMMENT 'hadsaw or want',
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
INSERT INTO `user_movie_impressions` VALUES ('d14f3817-8607-4537-b055-41fb1508bddb', '32058959-6d95-4ccd-b066-4f0a389352ac', '1', null, 'hadsaw', null, null);
INSERT INTO `user_movie_impressions` VALUES ('fae02383-5bad-4a07-9760-3525aafd53db', '32058959-6d95-4ccd-b066-4f0a389352ac', '1', null, 'want', null, null);
