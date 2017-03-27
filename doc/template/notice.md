# 项目组注意事项


## 17.03.27

* 数据库的创建: 数据库使用utf-8，直接使用navcat创建会出问题，所以创建了一个创建数据库的java文件(src.org.exfly.tools.initDatabase.java)。执行这个文件会创建数据库。创建好数据库后，即可执行sql文件中的sql语句，创建表。
* 日志 在test.org.exfly.logger中有使用的例子
* 数据库连接 使用src.org.exfly.DBConnector中的getConect方法获得数据库连接，(整个方法中包含了对于数据库链接的配置文件读取操作。这样整合到一起，方便未来加连接池，提高性能)
* 配置文件 配置文件src.config.properties 中保存了公共的配置文件，可以通过在这里配置静态不可更改的配置项，方便配置管理。使用方法Config configer = Config.getConfiger();这是一个单利模式实现的类。用configer.getItem();取一项配置项；
* 数据库主键 uuid: 数据库主键为uuid生成的字符串，这样方便系统的扩展。所以插入数据时候，主键必须通过获得uuid生成。生成方法 String DBStaticTools.getUUID();

## 17.03.20
* 每个人的样式文件以自己的姓名首字母命名，比如zhf的样式文件为style-f.css,文件里的class为.f-container{}
* 项目模板改成[dash](https://github.com/ExFly/SchooWork/tree/MovieShare-javaee/doc/template/dash)，之前的[exfly](https://github.com/ExFly/SchooWork/tree/MovieShare-javaee/doc/template/exfly)已经废弃了
* 项目使用[bootstrap](http://v3.bootcss.com/)作为前端框架，因为依赖[dash](http://gridgum.com/themes/dashgum-bootstrap-dashboard/)所以使用的版本为[dash](http://gridgum.com/themes/dashgum-bootstrap-dashboard/)依赖的版本，如果出问题，可以直接改代码，毕竟代码已经在我们这里了
* 项目使用的的bootstrap的版本为3.2，位置在[这里](https://github.com/ExFly/SchooWork/tree/MovieShare-javaee/doc/template/dash/assets)的css和js中
* 需要修改的部分(也即各自的任务),****container****的内容为各自需要修改的内容，在自己的内容部分，需要加一个整体的div，class为row
```
<!-- 这里是任务源代码 -->
<!--main content start-->
  <section id="main-content">
          <section class="wrapper">
          ****container****
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="index.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
```
如下为自己加的内容，一定注意上下的区别，防止与整体冲突
```
<section id="main-content">
          <section class="wrapper">
          <!-- ****container**** -->
	          <div class="row">
	          我加的内容。。。
	          </div>
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="index.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
```

* [bootstrap的中文文档](http://v3.bootcss.com/)，一定要看一遍
