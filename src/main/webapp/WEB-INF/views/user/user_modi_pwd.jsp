<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/19
  Time: 18:00
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
    <script type="text/javascript">
        $(function () {
            $("input[value='取消']").click(function () {
                $("#oldPwd").val("");
                $("#first_newPwd").val("");
                $("#second_newPwd").val("");
            });
            $("#goUpdatePwd").click(function () {
                var $first_newPwd=$("#first_newPwd").val();
                var $second_newPwd=$("#second_newPwd").val();
                var $oldPwd=$("#oldPwd").val();
                if("${admin1.apassword}"!=$oldPwd){
                    $("#validate_msg_medium1").html("旧密码错误");
                }else if(""==$second_newPwd){
                    $("#validate_msg_medium3").html("密码不能为空");
                }else{
                    $("#loginForm").submit();

                }
            })
            $("#oldPwd").blur(function () {
                var $oldPwd=$("#oldPwd").val();
                if("${admin1.apassword}"!=$oldPwd){
                    $("#validate_msg_medium1").html("旧密码错误");
                }else{
                    $("#validate_msg_medium1").html("√");
                }
            })
            $("#second_newPwd").blur(function () {
                var $first_newPwd=$("#first_newPwd").val();
                var $second_newPwd=$("#second_newPwd").val();
                if($first_newPwd!=$second_newPwd){
                    $("#validate_msg_medium3").html("两次输入的密码不一致");
                }if($first_newPwd==$second_newPwd && $first_newPwd!=""){
                    $("#validate_msg_medium2").html("√");
                    $("#validate_msg_medium3").html("√");
                }
            })
            if("${update_pwd_s_msg}"=="2"){
                $("#save_result_info").html("保存成功");
                showResult();
            }
            if("${update_pwd_f_msg}"=="3"){
                $("#save_result_info").attr("class","save_fail");
                $("#save_result_info").html("保存失败");
                showResult();
            }

        });
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
        if(session.getAttribute("update_pwd_s_msg")!=null){
            session.removeAttribute("update_pwd_s_msg");
        }
        if(session.getAttribute("update_pwd_f_msg")!=null){
            session.removeAttribute("update_pwd_f_msg");
        }
    %>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
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
            <li><a href="${pageContext.request.contextPath}${url.purl}" class="${url.pclass}_off"></a></li>
        </c:forEach>
        <li><a href="<%=request.getContextPath()%>/user/go_user_info" class="information_off"></a></li>
        <li><a href="<%=request.getContextPath()%>/user/go_user_modi_pwd" class="password_on"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success"></div><!--保存失败，旧密码错误！-->
    <form action="<%=request.getContextPath()%>/user/updatePwd" method="post" class="main_form" id="loginForm">
        <div class="text_info clearfix"><span>旧密码：</span></div>
        <div class="input_info">
            <input type="password" class="width200"  name="oldPwd" id="oldPwd"/><span class="required">*</span>
            <div class="validate_msg_medium" id="validate_msg_medium1"></div>
        </div>
        <div class="text_info clearfix"><span>新密码：</span></div>
        <div class="input_info">
            <input type="password"  class="width200" name="first_newPwd" id="first_newPwd"/><span class="required">*</span>
            <div class="validate_msg_medium" id="validate_msg_medium2"></div>
        </div>
        <div class="text_info clearfix"><span>重复新密码：</span></div>
        <div class="input_info">
            <input type="password" class="width200"  name="second_newPwd" id="second_newPwd"/><span class="required">*</span>
            <div class="validate_msg_medium" id="validate_msg_medium3"></div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save"  id="goUpdatePwd"/>
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>
