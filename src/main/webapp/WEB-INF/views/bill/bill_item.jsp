<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/19
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global_color.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
</head>
<body onload="initialYearAndMonth();">
<!--Logo区域开始-->
<div id="header" >
    <img src="${admin1.aimage}" class="user_img" />
    <span  class="user_span">${admin1.auname}</span>
    <img src="<%=request.getContextPath()%>/images/logo.png" alt="logo" class="left"/>
    <a href="<%=request.getContextPath()%>/login/exit"  class="user_a">[退出]</a>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <ul id="menu">
        <li><a href="<%=request.getContextPath()%>/login/loginIndex" class="index_off"></a></li>
        <c:forEach items="${admin1.powerList}" var="url">
            <c:choose>
                <c:when test="${url.pclass=='bill'}">
                    <li><a href="${pageContext.request.contextPath}${url.purl}" class="${url.pclass}_on"></a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}${url.purl}" class="${url.pclass}_off"></a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <li><a href="<%=request.getContextPath()%>/user/go_user_info" class="information_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/user/go_user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <div>账务账号：<span class="readonly width70">${account.login_account}</span></div>
            <div>身份证：<span class="readonly width150">${account.acc_id_card}</span></div>
            <div>姓名：<span class="readonly width70">${account.acc_name}</span></div>
            <div>计费时间：
                <span class="readonly width70">
                <fmt:parseDate value="${account.createtime}" pattern="yyyy-MM-dd HH:mm:ss" var="createtime"/>
                <fmt:formatDate value="${createtime}" pattern="yyyy-MM-dd"/>
                </span>
            </div>
            <div>总费用：<span class="readonly width70">${account.bill.b_cost}</span></div>
            <input type="button" value="返回" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/bill/billList/1';" />
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="width70">账单明细ID</th>
                    <th class="width150">OS 账号</th>
                    <th class="width150">服务器 IP</th>
                    <th class="width70">账务账号ID</th>
                    <th class="width150">时长</th>
                    <th>费用</th>
                    <th class="width150">资费</th>
                    <th class="width50"></th>
                </tr>
                <c:forEach items="${serviceList}" var="service">
                    <tr>
                        <td>${service.bd.bd_id}</td>
                        <td>${service.s_os}</td>
                        <td>${service.s_ip}</td>
                        <td>${service.acc_id}</td>
                        <td><fmt:parseNumber integerOnly="true" value="${service.bd.bd_duration/3600}" />小时</td>
                        <td>${service.bd.bd_cost}元</td>
                        <td>${service.fee.ac_name}</td>
                        <td><a href="${pageContext.request.contextPath}/bill/billServiceDetail/1/${service.bd.bd_id}" title="业务详单">详单</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!--分页-->
        <div id="pages">
           ${bar}
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

