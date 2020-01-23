<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/18
  Time: 16:57
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
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
                <c:when test="${url.pclass=='service'}">
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
</div>>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="" class="main_form">
        <!--必填项-->
        <div class="text_info clearfix"><span>业务账号ID：</span></div>
        <div class="input_info"><input type="text" value="${service.s_id}" readonly class="readonly" /></div>
        <div class="text_info clearfix"><span>账务账号ID：</span></div>
        <div class="input_info"><input type="text" value="${service.acc_id}" readonly class="readonly" /></div>
        <div class="text_info clearfix"><span>客户姓名：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="${service.s_name}" /></div>
        <div class="text_info clearfix"><span>身份证号码：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="${service.s_id_card}" /></div>
        <div class="text_info clearfix"><span>服务器 IP：</span></div>
        <div class="input_info"><input type="text" value="${service.s_ip}" readonly class="readonly" /></div>
        <div class="text_info clearfix"><span>OS 账号：</span></div>
        <div class="input_info"><input type="text" value="${service.s_os}" readonly class="readonly" /></div>
        <div class="text_info clearfix"><span>状态：</span></div>
        <div class="input_info">
            <select disabled>
                <option <c:if test="${service.s_status == 1}">selected</c:if> >开通</option>
                <option <c:if test="${service.s_status == 0}">selected</c:if> >暂停</option>
                <option <c:if test="${service.s_status == 2}">selected</c:if> >删除</option>
            </select>
        </div>
        <div class="text_info clearfix"><span>开通时间：</span></div>
        <div class="input_info"><input type="text" readonly class="readonly" value="${service.createtime}"/></div>
        <div class="text_info clearfix"><span>资费 ID：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="${service.f_id}"/></div>
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info"><input type="text" readonly class="width200 readonly" value="${service.fee.ac_name}"/></div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
            <textarea class="width300 height70 readonly" readonly>${service.fee.ac_desc}</textarea>
        </div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/service/serviceList/1';" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

