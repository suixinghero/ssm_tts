<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/26
  Time: 19:08
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
                $("#auname").val("");
                $("#first_pwd").val("");
                $("#second_pwd").val("");
                $("#atel").val("");
                $("#aemail").val("");
            });
            $("#goAdminSave").click(function () {
                var $aname=$("#aname").val();
                var $length=$("input:checked").length;
                var $auname=$("#auname").val();
                var $second_pwd=$("#second_pwd").val();
                var $atel=$("#atel").val();
                var $aemail=$("#aemail").val();
                if($length==0){
                    alert("请赋予角色")
                } else if(""==$aname){
                    $("#validate_msg_long1").html("名字不能为空");
                }else if(""==$auname){
                    $("#validate_msg_long2").html("用户名不能为空");
                }else if(""==$second_pwd){
                    $("#validate_msg_long4").html("密码不能为空");
                }else if(""==$atel){
                    $("#validate_msg_long5").html("电话不能为空");
                }else if(""==$aemail) {
                    $("#validate_msg_long6").html("邮箱不能为空");
                } else{
                    $("#loginForm").submit();

                }
            });
            $("#second_pwd").blur(function () {
                var $first_pwd=$("#first_pwd").val();
                var $second_pwd=$("#second_pwd").val();
                if($first_pwd!=$second_pwd){
                    $("#validate_msg_long3").html("两次输入的密码不一致");
                }else if($first_pwd==$second_pwd && $first_pwd!=""){
                    $("#validate_msg_long3").html("√");
                    $("#validate_msg_long4").html("√");
                }
            });
            $("#aemail").blur(function () {
                var mail = $("#aemail").val();
                var reg=/^\w+@\w+.(\w{2,3}){1,}.(\w{2,3})?$/;
                if(!reg.test(mail)){
                    $("#validate_msg_long6").html("邮箱格式不正确");
                }else {
                    $("#validate_msg_long6").html("√");
                }
            });
            if("${insert_admin_s_msg}"=="12"){
                $("#save_result_info").html("保存成功");
                showResult();
            }
            if("${insert_admin_f_msg}"=="13"){
                $("#save_result_info").attr("class","save_fail");
                $("#save_result_info").html("保存失败");
                showResult();
            }
        });
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
    <%
        if(session.getAttribute("insert_admin_s_msg")!=null){
            session.removeAttribute("insert_admin_s_msg");
        }
        if(session.getAttribute("insert_admin_f_msg")!=null){
            session.removeAttribute("insert_admin_f_msg");
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
    <form action="<%=request.getContextPath()%>/admin/adminSave" method="post" class="main_form" id="loginForm">
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" name="aname" id="aname"/>
            <span class="required">*</span>
            <div class="validate_msg_long" id="validate_msg_long1"></div>
        </div>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info">
            <input type="text"  name="auname" id="auname"/>
            <span class="required">*</span>
            <div class="validate_msg_long" id="validate_msg_long2"></div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input type="password"  name="apassword" id="first_pwd"/>
            <span class="required">*</span>
            <div class="validate_msg_long" id="validate_msg_long3"></div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input type="password"  id="second_pwd"/>
            <span class="required">*</span>
            <div class="validate_msg_long" id="validate_msg_long4"></div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="atel" id="atel"/>
            <span class="required">*</span>
            <div class="validate_msg_long" id="validate_msg_long5"></div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="aemail" id="aemail"/>
            <span class="required">*</span>
            <div class="validate_msg_long" id="validate_msg_long6"></div>
        </div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <c:forEach items="${roleList}" var="role">
                    <li><input type="checkbox"  value="${role.rid}" name="role"/>${role.rname}</li>
                    </c:forEach>
                </ul>
            </div>
            <span class="required">*</span>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save"  id="goAdminSave" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

