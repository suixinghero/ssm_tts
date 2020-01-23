<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/11
  Time: 15:17
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
            var $code;
            if("${insert_fee_s_msg}"=="18"){
                $("#save_result_info").html("保存成功");
                showResult();
            }
            if("${insert_fee_f_msg}"=="19"){
                $("#save_result_info").attr("class","save_fail");
                $("#save_result_info").html("保存失败");
                showResult();
            }
            $("#ac_name").blur(function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/fee/isExists?ac_name="+$("#ac_name").val(),
                    type:"get",
                    dataType:"json",
                    success:function(data){
                        if(data.code == "0001"){
                            $code = "0001";
                            $("#msg1").html("<font style='color:red;'>资费名称已存在</font>");
                            return;
                        }
                        $("#msg1").html("");
                        $code = "0000";
                    }
                })
            });
            $("#goFeeSave").click(function () {
                if($code == "0001"){
                    alert("资费名称已存在");
                    return;
                }
                $("#loginForm").submit();
            });
        });
        //保存结果的提示
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

        //切换资费类型
        function feeTypeChange(type) {
            if (type == 1) {
                $("input[name='base_duration']").attr("class","readonly width100");
                $("input[name='base_duration']").attr("readonly","readonly");
                $("input[name='base_cost']").attr("class","width100");
                $("input[name='base_cost']").removeAttr("readonly");
                $("input[name='unit_cost']").attr("class","readonly width100");
                $("input[name='unit_cost']").attr("readonly","readonly");
            }
            else if (type == 2) {
                $("input[name='base_duration']").attr("class","width100");
                $("input[name='base_duration']").removeAttr("readonly");
                $("input[name='base_cost']").attr("class","width100");
                $("input[name='base_cost']").removeAttr("readonly");
                $("input[name='unit_cost']").attr("class","width100");
                $("input[name='unit_cost']").removeAttr("readonly");
            }
            else if (type == 3) {
                $("input[name='base_duration']").attr("class","readonly width100");
                $("input[name='base_duration']").attr("readonly","readonly");
                $("input[name='base_cost']").attr("class","readonly width100");
                $("input[name='base_cost']").attr("readonly","readonly");
                $("input[name='unit_cost']").attr("class","width100");
                $("input[name='unit_cost']").removeAttr("readonly");
            }
        }
    </script>
    <c:if test="${insert_fee_s_msg != null}">
        <c:remove var="insert_fee_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${insert_fee_f_msg != null}">
        <c:remove var="insert_fee_f_msg" scope="session"></c:remove>
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
                <c:when test="${url.pclass=='fee'}">
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
    <div id="save_result_info" class="save_success"></div>
    <form action="<%=request.getContextPath()%>/fee/feeSave" method="post" class="main_form" id="loginForm">
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info">
            <input type="text" class="width300" name="ac_name" id="ac_name"/>
            <span class="required">*</span>
            <div class="validate_msg_short" id="msg1"></div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info fee_type">
            <input type="radio" name="ac_type" id="monthly" onclick="feeTypeChange(1);"  value="0"/>
            <label for="monthly">包月</label>
            <input type="radio" name="ac_type" checked="checked" id="package" onclick="feeTypeChange(2);"  value="1"/>
            <label for="package">套餐</label>
            <input type="radio" name="ac_type" id="timeBased" onclick="feeTypeChange(3);" value="2"/>
            <label for="timeBased">计时</label>
        </div>
        <div class="text_info clearfix"><span>基本时长：</span></div>
        <div class="input_info">
            <input type="text" value="" class="width100" name="base_duration"/>
            <span class="info">小时</span>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>基本费用：</span></div>
        <div class="input_info">
            <input type="text" value="" class="width100" name="base_cost"/>
            <span class="info">元</span>
            <span class="required">*</span>
            <div class="validate_msg_long "></div>
        </div>
        <div class="text_info clearfix"><span>单位费用：</span></div>
        <div class="input_info">
            <input type="text" value="" class="width100" name="unit_cost"/>
            <span class="info">元/小时</span>
            <span class="required">*</span>
            <div class="validate_msg_long "></div>
        </div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
            <textarea class="width300 height70" name="ac_desc"></textarea>
            <div class="validate_msg_short "></div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save"  id="goFeeSave" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>

