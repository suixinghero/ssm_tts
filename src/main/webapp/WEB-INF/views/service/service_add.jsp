<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/18
  Time: 14:57
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
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#goServiceSave").click(function () {
                $("#loginForm").submit();
            });
           $("#btn_search_large").click(function () {
               $.ajax({
                   url:"${pageContext.request.contextPath}/service/serviceIsExists?login_account="+$("#login_account").val(),
                   type:"get",
                   dataType:"json",
                   success:function(result){
                       if(result.code == "0000"){
                           $("#s_id_card").val(result.data.acc_id_card);
                           $("#acc_id").val(result.data.acc_id);
                           $("#s_name").val(result.data.acc_name);
                           $("#msg1").html("");
                           return;
                       }
                       $("#msg1").html("<font style='color:red;'>"+result.msg+"</font>")
                   }
               })
           });
            if("${insert_service_s_msg}"=="35"){
                $("#save_result_info").html("添加成功");
                showResult();
            }
            if("${insert_service_f_msg}"=="36"){
                $("#save_result_info").attr("class","save_fail");
                $("#save_result_info").html("添加失败");
                showResult();
            }
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

        //自动查询账务账号
        function searchAccounts(txtObj) {
            //document.getElementById("a1").innerHTML = txtObj.value;
        }
    </script>
    <c:if test="${insert_service_s_msg != null}">
        <c:remove var="insert_service_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${insert_service_f_msg != null}">
        <c:remove var="insert_service_f_msg" scope="session"></c:remove>
    </c:if>
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
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <!--保存操作的提示信息-->
    <div id="save_result_info" class="save_success"></div>
    <form action="${pageContext.request.contextPath}/service/serviceSave" method="post" class="main_form" id="loginForm">
        <!--内容项-->
        <div class="text_info clearfix"><span>账务账号：</span></div>
        <div class="input_info">
            <input type="text"  class="width180" name="login_account" id="login_account"/>
            <input type="button" value="查询账务账号" class="btn_search_large" id="btn_search_large"/>
            <span class="required">*</span>
            <div class="validate_msg_short" id="msg1"></div>
        </div>
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input type="text"  readonly class="readonly" name="s_id_card" id="s_id_card"/>
            <input type="hidden"   name="acc_id" id="acc_id"/>
            <input type="hidden"   name="s_name" id="s_name"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info">
            <select name="f_id">
                <c:forEach items="${feeList}" var="fee">
                    <option value="${fee.id}">${fee.ac_name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="text_info clearfix"><span>服务器 IP：</span></div>
        <div class="input_info">
            <input type="text" name="s_ip"  />
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
        <div class="input_info">
            <input type="text" name="s_os"  />
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input type="password"  name="s_pass"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input type="password"  />
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" id="goServiceSave" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

