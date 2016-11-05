![img](https://avatars1.githubusercontent.com/u/22613193?v=3&s=466)
### Author: [ExFly](https://github.com/ExFly)

图书管理系统：软件工程作业,简单可用，简陋

# 目标

* python tornado mysql SQLAlchemy
* 只实现功能，没有session和缓存支持
* 玩具

# 使用方法

```
# 安装环境
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

# 安装数据库 导入测试数据库
python modules/creatdb.py
python help.py

# 启动
python app.py
```
# 测试

# 备注
* 分成5个等级，0普通读者，1普通管理员，5最高权限管理员，234保留

# 资源

* [tornado doc](http://www.tornadoweb.cn/documentation#_5)
* [SQLAlchemy文档-zh](http://www.codexiu.cn/python/SQLAlchemy%E5%9F%BA%E7%A1%80%E6%95%99%E7%A8%8B/529/)
* [SQLAlchemy-Documentation](http://docs.sqlalchemy.org/)
* [图书管理系统 需求分析](https://www.processon.com/tag/%E5%9B%BE%E4%B9%A6%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F)
# log
* 11.01 创建项目，并添加简单登陆功能，接下来设计操作流程，创建数据库表，不断的加入功能。
* 11.03 项目实现部分功能，但借还书后，显示的个人结束记录有问题。明天先把留言功能搞一下
