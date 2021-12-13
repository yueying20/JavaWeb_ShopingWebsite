
1.2.1开发工具介绍
主要开发工具为IDEA版本、Mysql8.0、Tomcat9.0
主要技术包括：Spring、Spring MVC、MyBatis 
1.2.2系统技术介绍
系统基于B/S模式开发的JAVA EE多层体系结构WEB应用。
主要分为以下几层：视图层、service、DAO层、持久层。业务逻辑层和DAO层都通过接口与其它层进行连接从而减小了各层之间的耦合度，实现高内聚、低耦合的思想。

本系统使用SSM框架实现各个模块,web服务器使用Tomcat9.0,数据库使用的是MYSQL,集成开发环境为IDEA

系统采用加载纯java数据库驱动程序的方式连接MYSQL数据库,
在MYSQL中创建了数据库shop,并在shop中创建9张与系统相关的数据表,
即ausertable、busertable、 carttable 、 goodstable 、goodstype 、orderdetail 、orderbasetable  
