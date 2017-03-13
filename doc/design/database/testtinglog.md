
# 爬虫导入数据
[爬虫地址](https://github.com/zeeqy/doubanMovieComments)
* 电影的基本信息
* 演员的基本信息
* 用户评分
# 基础数据录入

```
## 创建两个账户，分别为 root和test 密码都为123
INSERT INTO `users` VALUES ('1', 'root', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', '2017-03-08 15:00:36', '2017-03-08 15:00:40');
INSERT INTO `users` VALUES ('2', 'test', 'b35007b31a34cbf504d9bb9962e66ac13755e748', 'evtg9qzC5QdjhsZwn1Of3iUGTB4MHSVl', '2017-03-08 15:01:38', '2017-03-08 15:01:41');

## 电影信息
INSERT INTO `movies` VALUES ('1', 'Wolverine 3', '金刚狼3：殊死一战 Logan', 'https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2431980130.jpg', '00:02:09', '美国', '英语', 'https://movie.douban.com/trailer/212262/#content', '2029年，变种人大幅减少，X战警已经解散。身心疲惫的金刚狼罗根（休·杰克曼 Hugh Jackman 饰）自愈因子逐渐消失，整天饮酒度日，靠当司机养家。他在墨西哥边境隐居，并照顾着饱受病痛折磨的老X教授（帕特里克·斯图尔特 Patrick Stewart 饰）。有一天，一位陌生女子让罗根送一个叫劳拉（达芙妮·金 Dafne Keen 饰）的女孩去加拿大边境，一开始罗根拒绝了，但查尔斯一直在等着这个女孩的出现，劳拉拥有超强的战斗力，而且在许多方面都很像金刚狼。她被一个强大公司的幕后人物所追踪，因为她的DN', '2017-03-03', 'tt3315342');

INSERT INTO `movies` VALUES ('2', 'Wolverine 2', '金刚狼2', 'https://img3.doubanio.com/view/movie_poster_cover/lpst/public/p2431980130.jpg', '00:02:09', '美国', '英语', 'https://movie.douban.com/trailer/212262/#content', '2029年，变种人大幅减少，X战警已经解散。身心疲惫的金刚狼罗根（休·杰克曼 Hugh Jackman 饰）自愈因子逐渐消失，整天饮酒度日，靠当司机养家。他在墨西哥边境隐居，并照顾着饱受病痛折磨的老X教授（帕特里克·斯图尔特 Patrick Stewart 饰）。有一天，一位陌生女子让罗根送一个叫劳拉（达芙妮·金 Dafne Keen 饰）的女孩去加拿大边境，一开始罗根拒绝了，但查尔斯一直在等着这个女孩的出现，劳拉拥有超强的战斗力，而且在许多方面都很像金刚狼。她被一个强大公司的幕后人物所追踪，因为她的DN', '2017-03-03', 'tt3315342');

## 创建电影类别
INSERT INTO `filmtype` VALUES ('1', '1', '1');
INSERT INTO `filmtype` VALUES ('2', '1', '2');
INSERT INTO `filmtype` VALUES ('3', '1', '3');
INSERT INTO `filmtype` VALUES ('4', '2', '3');

## 创建 start 导演 编剧 演员 之类的
INSERT INTO `famouspeoples` VALUES ('0', null, null, null, null, null, null, null, null);
INSERT INTO `famouspeoples` VALUES ('1', 'en詹姆斯·曼高德', '詹姆斯·曼高德', 'man', '2010-02-03', 'birthplace1', '???', 'nm0003506', '詹姆斯·曼高德出生在一个艺术家庭，父母都是著名画家。他曾在加利富尼亚州艺术学院取得电影和表演的学士学位，因为在大学时拍摄了很多短片，21岁的曼高德被迪斯尼公司看中，开始为动画片创作剧本，并为美国广播公司(ABC)拍摄电视电影。后来他进入哥伦比亚大学电影专业就读，并取得了硕士学位。虽然从影至今曼高德只拍摄了5部影片，但部部都以不可小觑的业绩掷地有声。');
INSERT INTO `famouspeoples` VALUES ('3', 'Stephen Merchant', '斯戴芬·莫昌特', 'man', '2010-02-01', 'virthplace3', '???', 'nm0580351', '一位英国的编剧导演制片和演员，主要作品有英剧《办公室》的编剧，《临时演员》的编剧制片导演和演员，等等。2015年参加了真人秀《对口型假唱大赛》');

## 给电影指派导演
INSERT INTO `movies_peoples` VALUES ('1', '1', '导演');
INSERT INTO `movies_peoples` VALUES ('2', '2', '导演');

## 想给电影加标签，需要现有标签才行
INSERT INTO `tag_meta` VALUES ('1', '激情', 'movie');
INSERT INTO `tag_meta` VALUES ('2', '好看', 'movie');
INSERT INTO `tag_meta` VALUES ('3', '无聊', 'people');

## 给电影加标签
INSERT INTO `movie_tag` VALUES ('1', '1', '1');
INSERT INTO `movie_tag` VALUES ('2', '1', '2');


```
# 开始查询
select * from movies, movie_picture, user_movie_impressions
movies movie_picture
movies user_movie_impressions
user_movie_impressions movie_comment_impressions
filmtype filmtype_meta
movie_tag tag_meta
movies_peoples famouspeoples

* 查询movies的所有信息 包括评论 以及评论的评论
	* 通过 电影id搜索电影的信息
	* 相应类别的所有电影 : select id from filmtype_meta where type="科幻"; select movieid from filmtype where filmtype="id";
	* 根据标签搜索电影: select id from tag_meta where tagname="tagname"; select movieid from movie_tag where tagid="id";
	* 根据时间搜索最近电影 : select id from movies order by release desc;
	* 根据评分搜索优质电影 : 
	* 根据评论数 排序，作为热度排行
	* 综合排行

* famous人查询
	* 基本信息 :select * from famouspeoples where id="id";
	* 参与过的电影 :select movie_id from movies_peoples where peoples_id="id";
* 用户信息
	* 用户想看的电影 select movieid from user_mouvi_impressions where userid="id" and hadsaw_wanted="wanted";
	* 用户看过的电影 select movieid from user_mouvi_impressions where userid="id" and hadsaw_wanted="hadsaw";
	* 用户评论过的电影 select movieid from user_mouvi_impressions where userid="id";
	* 用户打过标签的电影 select movieid from movie_tag where userid="id";

# 针对性查询电影
* 根据时间排序电影
* 根据评分查询 select movies.playbill,movies.name_zh, score.mavg from movies, (select AVG(score) mavg, movieid from user_movie_impressions) score where movies.id=score.movieid order by score.mavg limit 6;

select name_zh, playbill, douban_score from movies order by douban_score limit 6;

# 导入数据 
insert into movies(id, name_zh, douban_score,summary) select id,name,score,quote from movies_spider_assignment;

