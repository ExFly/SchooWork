* 执行spider2 向临时表中导入数据
* 执行sql insert into movies(id, name_zh, douban_score,summary) select id,name,score,quote from movies_spider_assignment;
向主表中导入相应的数据
* 利用爬虫将临时表中的图片下载下来，同时将地址导入相应的列中

