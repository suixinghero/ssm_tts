<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/18
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title></title>
  <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global.css" />
  <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global_color.css" />
</head>
<body class="index">
<div style=" width: 960px;margin: 0px auto; text-align: right;height: 61px;">
  <img src="${admin1.aimage}" class="user_img" />
  <span  class="user_span">${admin1.auname}</span>
  <a href="<%=request.getContextPath()%>/login/exit"  class="user_a" style="color: #FFFFFF">[退出]</a>
</div>
<!--导航区域开始-->
<div id="index_navi">
  <ul id="menu">
    <li><a href="<%=request.getContextPath()%>/login/loginIndex" class="index_on"></a></li>
    <c:forEach items="${admin1.powerList}" var="url">
      <li><a href="${pageContext.request.contextPath}${url.purl}" class="${url.pclass}_off"></a></li>
    </c:forEach>
    <li><a href="<%=request.getContextPath()%>/user/go_user_info" class="information_off"></a></li>
    <li><a href="<%=request.getContextPath()%>/user/go_user_modi_pwd" class="password_off"></a></li>
  </ul>
</div>

</body>
</html>



