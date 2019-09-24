<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/22
  Time: 14:27
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
                $("#roleName").val("");
            });
            $("#goRoleSave").click(function () {
                $("#loginForm").submit();
            });
            if("${insert_role_s_msg}"=="6"){
                $("#save_result_info").html("保存成功");
                showResult();
            }
            if("${insert_role_f_msg}"=="7"){
                $("#save_result_info").attr("class","save_fail");
                $("#save_result_info").html("保存失败");
                showResult();
            }
        })
        //保存成功的提示消息
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false)", 3000);
        }
        function showResultDiv(fg) {
            if (fg)
                $("#save_result_info").css("display","block");
            else
                $("#save_result_info").css("display","none");
        }
    </script>
    <%
        if(session.getAttribute("insert_role_s_msg")!=null){
            session.removeAttribute("insert_role_s_msg");
        }
        if(session.getAttribute("insert_role_f_msg")!=null){
            session.removeAttribute("insert_role_f_msg");
        }
    %>
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
                <c:when test="${url.pclass=='role'}">
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
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success"></div><!--保存失败，角色名称重复！-->
    <form action="<%=request.getContextPath()%>/role/roleSave" method="post" class="main_form" id="loginForm">
        <div class="text_info clearfix"><span>角色名称：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="roleName" id="roleName"/>
            <span class="required">*</span>
            <div class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>设置权限：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach items="${powerList}" var="power">
                    <li><input type="checkbox" value="${power.pid}" name="power"/>${power.by1}</li>
                    </c:forEach>
                </ul>
            </div>
            <span class="required">*</span>
            <div class="validate_msg_tiny"></div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" id="goRoleSave" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

