# notice
* 数据通过tools中的spider2脚本爬来
* 一些数据的整合通过tools.spider.img整合 比如图片
# 基本表以及其作用

filmtype_meta 电影种类元数据
tag_meta	标签种类 元数据 包括电影标签以及人的标签等
users 用户账号密码集合
userinfo 存储user信息
famouspeoples 导演 演员 编剧等人的信息
movies 	电影信息
movie_picture 电影相关图片
movie_tag 用户给电影标记的标签
filmtype 某个电影的类型 比如 金刚狼3 科幻
movies_peoples 存放人在拍摄电影过程中扮演的角色 如导演 编剧 主演
user_movie_impressions 用户对电影的评分 and (想看 看过)二选一
movie_comment_impressions 记录某用户由于其他某个评论是否赞同
friends 用户的朋友

# 基本数据读取方法


## 电影信息
* 名字
* 海报
* 导演
* 编剧
* 主演
* 类型
* 制片国家/地区
* 语言
* 上映时间
* 片长
* IMDb链接
* 评分
* 电影标签
