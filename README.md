# MovieShare

* 大三下信息系统分析与设计2课程设计
* 想借课程设计机会搭建一个电影推荐网站。网站包括基本的推荐功能，暂打算实现基本的基于用户的协同过滤推荐(User-based Collaborative Filtering Recommendation)系统
* 基本部署方法见README-dev.md
* mysql + jsp + servlet + javabean 按照自己的思路实现的mvc模式、超级简约的电影推荐平台

## 使用方法

* 将依赖加入path中 (path: WebContent\WEB-INF\lib)
* 修改src/config.properties中的数据库名 用户名 密码
* 运行src/org/exfly/tools/InitDatabase.java 创建数据库
* 链接数据库，运行doc/database/movieshare_plus.2017-04-30.sql 创建表
* 启动tomcat便可以看到效果了

## 依赖
* jstl
* log4j
* mysql-connector-java-5.1.40-bin
* standard

## 注
* 当项目完成时，将README-dev.md文件合并到此文件中
* doc/report 下的文件为上课演讲内容
