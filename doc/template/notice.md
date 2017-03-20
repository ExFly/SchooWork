# 项目组注意事项


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
