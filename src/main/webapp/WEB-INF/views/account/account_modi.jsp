<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/16
  Time: 16:32
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
            var $oldPass,$newPwd;
            $("#goAccountUpdate").click(function () {
               if($oldPass == '1' ){
                   alert("旧密码输入错误");
                   return;
               }
               if($newPwd == '1'){
                   alert("两次密码输入不一致");
                   return;
               }
               $("#loginForm").submit();
            });
            $("#oldPwd").blur(function () {
                var $oldPwd=$("#oldPwd").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/account/oldPwd",
                    type:"post",
                    data:{
                        "acc_id":${account.acc_id},
                        "acc_pass":$oldPwd
                    },
                    dataType:"json",
                    success:function(data){
                        if(data.code == "0000"){
                            $("#msg1").html("√");
                            $oldPass = '0';
                            return;
                        }
                        $("#msg1").html("<font style='color:red;'>密码输入不正确</font>");
                        $oldPass = '1';
                    }
                })
            });
            $("#second_newPwd").blur(function () {
                var $first_newPwd=$("#first_newPwd").val();
                var $second_newPwd=$("#second_newPwd").val();
                if($first_newPwd!=$second_newPwd){
                    $("#msg3").html("<font style='color:red;'>两次输入的密码不一致</font>");
                    $newPwd = '1';
                }
                if($first_newPwd == $second_newPwd && $first_newPwd!=""){
                    $("#msg2").html("√");
                    $("#msg3").html("√");
                    $newPwd = '0';
                }
            });
        });
        //保存成功的提示信息
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

        //显示修改密码的信息项
        function showPwd(chkObj) {
            if (chkObj.checked)
                document.getElementById("divPwds").style.display = "block";
            else
                document.getElementById("divPwds").style.display = "none";
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
                <c:when test="${url.pclass=='account'}">
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
    <!--保存成功或者失败的提示消息-->
    <div id="save_result_info" class="save_fail"></div>
    <form action="<%=request.getContextPath()%>/account/accountUpdate" method="post" class="main_form" id="loginForm">
        <!--必填项-->
        <div class="text_info clearfix"><span>账务账号ID：</span></div>
        <div class="input_info">
            <input type="text" value="${account.acc_id}" readonly class="readonly" name="acc_id"/>
        </div>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text" value="${account.acc_name}" name="acc_name"/>
            <span class="required">*</span>
            <div class="validate_msg_long "></div>
        </div>
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input type="text" value="${account.acc_id_card}" readonly class="readonly" name="acc_id_card"/>
        </div>
        <div class="text_info clearfix"><span>登录账号：</span></div>
        <div class="input_info">
            <input type="text" value="${account.login_account}" readonly class="readonly" name="login_account" />
            <div class="change_pwd">
                <input id="chkModiPwd" type="checkbox" onclick="showPwd(this);" />
                <label for="chkModiPwd">修改密码</label>
            </div>
        </div>
        <!--修改密码部分-->
        <div id="divPwds">
            <div class="text_info clearfix"><span>旧密码：</span></div>
            <div class="input_info">
                <input type="password"  id="oldPwd"/>
                <span class="required">*</span>
                <div class="validate_msg_long" id="msg1"></div>
            </div>
            <div class="text_info clearfix"><span>新密码：</span></div>
            <div class="input_info">
                <input type="password"  id="first_newPwd" name="acc_pass"/>
                <span class="required">*</span>
                <div class="validate_msg_long" id="msg2"></div>
            </div>
            <div class="text_info clearfix"><span>重复新密码：</span></div>
            <div class="input_info">
                <input type="password"  id="second_newPwd"/>
                <span class="required">*</span>
                <div class="validate_msg_long" id="msg3"></div>
            </div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" value="${account.acc_tel}" name="acc_tel"/>
            <span class="required">*</span>
            <div class="validate_msg_medium "></div>
        </div>
        <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
        <div class="input_info">
            <input type="text" value="${account.recomm_id_card}" name="recomm_id_card"/>
            <div class="validate_msg_long error_msgs"></div>
        </div>
        <div class="text_info clearfix"><span>生日：</span></div>
        <div class="input_info">
            <input type="text" value="${account.acc_birth}" readonly class="readonly" name="acc_birth"/>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" value="${account.acc_email}" name="acc_email"/>
            <div class="validate_msg_medium"></div>
        </div>
        <div class="text_info clearfix"><span>职业：</span></div>
        <div class="input_info">
            <select name="profession">
                <option <c:if test="${account.profession == 0}">selected</c:if> value="0">干部</option>
                <option <c:if test="${account.profession == 1}">selected</c:if> value="1">学生</option>
                <option <c:if test="${account.profession == 2}">selected</c:if> value="2">技术人员</option>
                <option <c:if test="${account.profession == 3}">selected</c:if> value="3">其他</option>
            </select>
        </div>
        <div class="text_info clearfix"><span>性别：</span></div>
        <div class="input_info fee_type">
            <input type="radio" name="acc_sex"  id="female"
                   <c:if test="${account.acc_sex == 1}">checked</c:if> value="1"/>
            <label for="female">女</label>
            <input type="radio" name="acc_sex" id="male"
                   <c:if test="${account.acc_sex == 0}">checked</c:if> value="0"/>
            <label for="male">男</label>
        </div>
        <div class="text_info clearfix"><span>通信地址：</span></div>
        <div class="input_info">
            <input type="text" class="width350" value="${account.acc_address}" name="acc_address"/>
            <div class="validate_msg_tiny"></div>
        </div>
        <div class="text_info clearfix"><span>邮编：</span></div>
        <div class="input_info">
            <input type="text" value="${account.acc_code}" name="acc_code"/>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>QQ：</span></div>
        <div class="input_info">
            <input type="text" value="${account.acc_qq}" name="acc_qq"/>
            <div class="validate_msg_long"></div>
        </div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" id="goAccountUpdate" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>


