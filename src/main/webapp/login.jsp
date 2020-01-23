<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/18
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
           $("#goLogin").click(function () {
               $("#login").submit();
           });
           $(document).keydown(function(){
               if (event.keyCode == 13) {//回车键的键值为13
                   $("#login").submit();
               }
           });
           if("${login_f_msg}"=="1"){
               $("input[name=auname]").css("border","2px solid red");
               $("input[name=apassword]").css("border","2px solid red");
           }
           $("#imagecode").click(function () {
               var time=new Date().getTime();
               $("#imagecode").attr("src","${pageContext.request.contextPath}/login/getImage?time="+time);
           });
           if("${checkcode_f_msg}"=="0"){
               $("input[name=checkcode]").css("border","2px solid red");
           }
       });
    </script>
    <%
        if(session.getAttribute("login_f_msg")!=null){
            session.removeAttribute("login_f_msg");
        }
        if(session.getAttribute("checkcode_f_msg")!=null){
            session.removeAttribute("checkcode_f_msg");
        }
    %>
</head>
<body class="index">
<div class="login_box">
    <form action="<%=request.getContextPath()%>/login/goIndex" id="login" method="post">
        <table>
            <tr>
                <td class="login_info">账号：</td>
                <td colspan="2"><input name="auname" type="text" class="width150"/></td>
                <td class="login_error_info"><span class="required"></span></td>
            </tr>
            <tr>
                <td class="login_info">密码：</td>
                <td colspan="2"><input name="apassword" type="password" class="width150"/></td>
                <td><span class="required"></span></td>
            </tr>
            <tr>
                <td class="login_info">验证码：</td>
                <td class="width70"><input name="checkcode" type="text" class="width70" /></td>
                <td><img src="<%=request.getContextPath()%>/login/getImage" alt="验证码" title="点击更换" id="imagecode" /></td>
                <td><span class="required"></span></td>
            </tr>
            <tr>
                <td></td>
                <td class="login_button" colspan="2">
                    <a id="goLogin"><img src="<%=request.getContextPath()%>/images/login_btn.png"/></a>
                </td>
                <td><span class="required"></span></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

