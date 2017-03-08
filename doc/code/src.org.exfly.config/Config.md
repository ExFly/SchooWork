# Config.java
## 设计思路
因为对于整体的配置来说，全局唯一，使用单例模式

## 接口设计
* static public Config getConfiger(); 获得单例对象
* public String getItem(String baseName); 获得配置项，baseName与配置中的配置项相同
