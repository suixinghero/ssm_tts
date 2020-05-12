# ssm_tts
基于ssm框架的电信资费系统

1.该系统主要用于电信营业厅对用户进行管理，系统后台主要由数据采集系统和数据整合系统提供支持,主要实现角色管理。由登录模块、主页模块、角色模块、管理员模块、
资费模块、账务账号模块、业务模块、账单管理模块、报表模块、个人信息模块、修改密码模块组成。

2.后端的主要技术架构是：SSM+MYSQL+Tomcat+Maven+Jersey+ActiveMQ+Druid+Pagehelper+JDK1.8

3.前端使用的技术是:JSP+HTML+JS+JQuery

4.本系统中使用了Jersey+Commons技术把用户头像存储到Tomcat服务器中，使用了MD5对用户的密码进行加密，使用ActiveMQ对用户需要进行变更的资费套餐进行异步修改， 使用Pagehelper进行数据的分页
