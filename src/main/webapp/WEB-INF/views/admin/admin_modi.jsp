<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/18
  Time: 19:39
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
    <script language="javascript" type="text/javascript">
        $(function () {
            $("input[value='取消']").click(function () {
                $("#aname").val("");
                $("#atel").val("");
                $("#aemail").val("");
                $("input:checked").removeAttr("checked");
            });
            $("#goUpdateAdmin").click(function () {
                $("#loginForm").submit();
            });
        })
        //保存成功的提示消息
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false);", 3000);
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
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
                <c:when test="${url.pclass=='admin'}">
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
    <div id="save_result_info" class="save_success">保存成功！</div>
    <form action="<%=request.getContextPath()%>/admin/updateAdmin" method="post" class="main_form" id="loginForm">
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" value="${admin2.aname}" name="aname" id="aname"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin2.auname}"  /></div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" value="${admin2.atel}"  name="atel" id="atel"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" value="${admin2.aemail}" name="aemail" id="aemail"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach items="${roleList}" var="role">
                        <li><input type="checkbox" value="${role.rid}" name="role"
                                <c:forEach items="${admin2.ridList}" var="rid">
                                    <c:if test="${role.rid==rid}">
                                        checked
                                    </c:if>
                                </c:forEach>
                        />${role.rname}</li>
                    </c:forEach>
                </ul>
            </div>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="button_info clearfix">
            <input type="hidden" value="${admin2.aid}" name="aid"/>
            <input type="button" value="保存" class="btn_save"  id="goUpdateAdmin" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>
