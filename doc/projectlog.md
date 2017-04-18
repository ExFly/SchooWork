# 项目日志
## 17.04.18 
### 10:34
做了2.5个小时的项目，将基本的模块拼接起来，真正实现了一些功能，突然感觉效率低的不行，主要是好多时候在发呆一样，虽然也是在推进，总感觉不够效率。从现在开始，吧随后项目推进的计划写道这里，看看自己到底哪里除了问题吧

### 10.34
项目前端基本整合好了，基本的功能已经实现了，现在需要开始管理端进行设计和实现。
* 基本设施已经完成了，现在需要的是开始设计修改用户信息和电影信息的设施
* 测试一下所有功能是否有问题
* 关服务器的时候出了一个很奇怪的异常，稍后解决
```
Exception in thread "pool-1-thread-1" java.lang.NoClassDefFoundError: org/apache/logging/log4j/message/ParameterizedMessage
	at org.apache.logging.log4j.message.ParameterizedNoReferenceMessageFactory.newMessage(ParameterizedNoReferenceMessageFactory.java:104)
	at org.apache.logging.log4j.message.AbstractMessageFactory.newMessage(AbstractMessageFactory.java:75)
	at org.apache.logging.log4j.spi.AbstractLogger.logMessage(AbstractLogger.java:2010)
	at org.apache.logging.log4j.spi.AbstractLogger.logIfEnabled(AbstractLogger.java:1884)
	at org.apache.logging.log4j.spi.AbstractLogger.error(AbstractLogger.java:793)
	at org.apache.logging.log4j.core.util.DefaultShutdownCallbackRegistry.run(DefaultShutdownCallbackRegistry.java:76)
	at java.lang.Thread.run(Unknown Source)
Caused by: java.lang.ClassNotFoundException: Illegal access: this web application instance has been stopped already. Could not load [org.apache.logging.log4j.message.ParameterizedMessage]. The following stack trace is thrown for debugging purposes as well as to attempt to terminate the thread which caused the illegal access.
	at org.apache.catalina.loader.WebappClassLoaderBase.checkStateForClassLoading(WebappClassLoaderBase.java:1343)
	at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1206)
	at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1167)
	... 7 more
Caused by: java.lang.IllegalStateException: Illegal access: this web application instance has been stopped already. Could not load [org.apache.logging.log4j.message.ParameterizedMessage]. The following stack trace is thrown for debugging purposes as well as to attempt to terminate the thread which caused the illegal access.
	at org.apache.catalina.loader.WebappClassLoaderBase.checkStateForResourceLoading(WebappClassLoaderBase.java:1353)
	at org.apache.catalina.loader.WebappClassLoaderBase.checkStateForClassLoading(WebappClassLoaderBase.java:1341)
	... 9 more

```
* 10:46:02 测试完成，基本功能已经没有问题
* 10:46:26 先从用户信息开始 用户信息暂时只设计对于用户名，密码的修改
* 10:49:54 设计管理用户基础架构
* 10:54:49 她来找我聊天 边聊边写
* 10:56:24 录个动图 同时同步到github
* 12:10:32 莫名奇妙整个项目不能用了，把项目删了重导入就好了，估计是eclipse的bug
* 12:11:20 下午继续
* 13:56:31 下午开始，先把管理基础弄好
* 15:00:32 添加用户管理功能 开始
* 17:14:27 用户信息查看和修改基本完成 开始电影信息的查看和修改
* 17:33:13 admin 电影信息的展示 基本完成，暂时有瑕疵，马山上修改 
* 17:33:47 休息下 + 吃饭 回来继续增加修改电影信息的功能