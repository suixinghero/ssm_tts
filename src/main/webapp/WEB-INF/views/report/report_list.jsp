<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/20
  Time: 10:12
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
    <script language="javascript" type="text/javascript">
        function changeTab(e,ulObj) {
            var obj = e.srcElement || e.target;
            if (obj.nodeName == "A") {
                var links = ulObj.getElementsByTagName("a");
                for (var i = 0; i < links.length; i++) {
                    if (links[i].innerHTML == obj.innerHTML) {
                        links[i].className = "tab_on";
                    }
                    else {
                        links[i].className = "tab_out";
                    }
                }
            }
        }
    </script>
</head>
<body>
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
                <c:when test="${url.pclass=='report'}">
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
<div id="report_main">
    <div class="tabs">
        <ul onclick="changeTab(event,this);">
            <li><a href="${pageContext.request.contextPath}/report/reportList/1/1"
                    <c:choose>
                        <c:when test="${sortFlag == 1}">
                            class="tab_on"
                        </c:when>
                        <c:otherwise>
                            class="tab_out"
                        </c:otherwise>
                    </c:choose>
                   title="每位客户每月的累计时长排行">客户使用时长</a></li>
            <li><a href="${pageContext.request.contextPath}/report/reportList/1/2"
                    <c:choose>
                        <c:when test="${sortFlag == 2}">
                            class="tab_on"
                        </c:when>
                        <c:otherwise>
                            class="tab_out"
                        </c:otherwise>
                    </c:choose>
                   title="每位客户每月的花费排行">客户花费金额</a></li>
        </ul>
    </div>
    <div class="report_box">
        <!--数据区域：用表格展示数据-->
        <div id="report_data">
            <c:choose>
                <c:when test="${sortFlag == 1}">
                    <table id="datalist">
                        <tr>
                            <th>账号 ID</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th>电话</th>
                            <th class="width150">月份</th>
                            <th class="width150">累积时长</th>
                        </tr>
                        <c:forEach items="${reportList}" var="report">
                            <tr>
                                <td>${report.re_id}</td>
                                <td>${report.re_account}</td>
                                <td>${report.re_name}</td>
                                <td>${report.re_id_card}</td>
                                <td>${report.re_tel}</td>
                                <td>
                                    <fmt:parseDate value="${report.re_start_time}" pattern="yyyy-MM-dd HH:mm:ss" var="createtime"/>
                                    <fmt:formatDate value="${createtime}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td><fmt:parseNumber integerOnly="true" value="${report.cumulative_duration/3600}" />小时</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
                <c:when test="${sortFlag == 2}">
                    <table id="datalist">
                        <tr>
                            <th>账号 ID</th>
                            <th>账务帐号</th>
                            <th>客户名称</th>
                            <th class="width200">身份证号码</th>
                            <th>电话</th>
                            <th class="width150">月份</th>
                            <th class="width150">累计花费金额</th>
                        </tr>
                        <c:forEach items="${reportList}" var="report">
                            <tr>
                                <td>${report.re_id}</td>
                                <td>${report.re_account}</td>
                                <td>${report.re_name}</td>
                                <td>${report.re_id_card}</td>
                                <td>${report.re_tel}</td>
                                <td>
                                    <fmt:parseDate value="${report.re_start_time}" pattern="yyyy-MM-dd HH:mm:ss" var="createtime"/>
                                    <fmt:formatDate value="${createtime}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td>${report.re_cost}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
            </c:choose>
        </div>
        <!--分页-->
        <div id="pages">
           ${bar}
        </div>

    </div>
</div>
<!--主要区域结束-->
<div id="footer">


</div>
</body>
</html>

