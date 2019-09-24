<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/19
  Time: 17:59
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
                $("#upload").val("");
            });
            $("#goUpdateAdmin").click(function () {
                $("#loginForm").submit();
            })
            $("#aemail").blur(function () {
                var mail = $("#aemail").val();
                var reg=/^\w+@\w+.(\w{2,3}){1,}.(\w{2,3})?$/;
                if(!reg.test(mail)){
                    $("#aemail_div").html("邮箱格式不正确");
                    return false;
                }
                $("#aemail_div").html("√");
            });
            if("${update_admin_s_msg}"=="4"){
                $("#save_result_info").html("保存成功");
                showResult();
            }
            if("${update_admin_f_msg}"=="5"){
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
        if(session.getAttribute("update_admin_s_msg")!=null){
            session.removeAttribute("update_admin_s_msg");
        }
        if(session.getAttribute("update_admin_f_msg")!=null){
            session.removeAttribute("update_admin_f_msg");
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
            <li><a href="${pageContext.request.contextPath}${url.purl}" class="${url.pclass}_off"></a></li>
        </c:forEach>
        <li><a href="<%=request.getContextPath()%>/user/go_user_info" class="information_on"></a></li>
        <li><a href="<%=request.getContextPath()%>/user/go_user_modi_pwd" class="password_off"></a></li>
    </ul>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_success"></div><!--保存失败，数据并发错误！-->
    <form action="<%=request.getContextPath()%>/user/updateAdmin" method="post" class="main_form" id="loginForm" enctype="multipart/form-data">
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin1.auname}" name="auname"/></div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info">
            <input type="text" readonly="readonly" class="readonly width400" value="${admin1.roleString}" />
        </div>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" value="${admin1.aname}" name="aname" id="aname"/>
            <span class="required">*</span>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" value="${admin1.atel}" name="atel" id="atel"/>
            <div class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" value="${admin1.aemail}" name="aemail" id="aemail" />
            <div class="validate_msg_medium" id="aemail_div"></div>
        </div>
        <div class="text_info clearfix"><span>个人图片：</span></div>
        <div class="input_info">
            <input type="file" class="width200" name="upload" id="upload" />
        </div>
        <div class="text_info clearfix"><span>创建时间：</span></div>
        <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin1.createtime}" name="createtime"/></div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save"  id="goUpdateAdmin"/>
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

