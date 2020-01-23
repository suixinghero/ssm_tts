<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/12
  Time: 20:25
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
            $("#goFeeUpdate").click(function () {
                $("#loginForm").submit();
            });
        });
        function feeTypeChange(type) {
            if (type == 1) {
                $("input[name='base_duration']").attr("class","readonly width100");
                $("input[name='base_duration']").attr("readonly","readonly");
                $("input[name='base_duration']").attr("value","");
                $("input[name='base_cost']").attr("class","width100");
                $("input[name='base_cost']").removeAttr("readonly");
                $("input[name='base_cost']").attr("value","");
                $("input[name='unit_cost']").attr("class","readonly width100");
                $("input[name='unit_cost']").attr("readonly","readonly");
                $("input[name='unit_cost']").attr("value","");
            }
            else if (type == 2) {
                $("input[name='base_duration']").attr("class","width100");
                $("input[name='base_duration']").removeAttr("readonly");
                $("input[name='base_duration']").attr("value","");
                $("input[name='base_cost']").attr("class","width100");
                $("input[name='base_cost']").removeAttr("readonly");
                $("input[name='base_cost']").attr("value","");
                $("input[name='unit_cost']").attr("class","width100");
                $("input[name='unit_cost']").removeAttr("readonly");
                $("input[name='unit_cost']").attr("value","");
            }
            else if (type == 3) {
                $("input[name='base_duration']").attr("class","readonly width100");
                $("input[name='base_duration']").attr("readonly","readonly");
                $("input[name='base_duration']").attr("value","");
                $("input[name='base_cost']").attr("class","readonly width100");
                $("input[name='base_cost']").attr("readonly","readonly");
                $("input[name='base_cost']").attr("value","");
                $("input[name='unit_cost']").attr("class","width100");
                $("input[name='unit_cost']").removeAttr("readonly");
                $("input[name='unit_cost']").attr("value","");
            }
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
    <form action="<%=request.getContextPath()%>/fee/feeUpdate" method="post" class="main_form" id="loginForm">
        <div class="text_info clearfix"><span>资费ID：</span></div>
        <div class="input_info"><input type="text" class="readonly" readonly value="${fee.id}" name="id"/></div>
        <div class="text_info clearfix"><span>资费名称：</span></div>
        <div class="input_info">
            <input type="text" class="width300" value="${fee.ac_name}" name="ac_name"/>
            <span class="required">*</span>
            <div class="validate_msg_short" ></div>
        </div>
        <div class="text_info clearfix"><span>资费类型：</span></div>
        <div class="input_info fee_type">
            <input type="radio" name="ac_type" id="monthly" value="0" onclick="feeTypeChange(1)"
                   <c:if test="${fee.ac_type == 0}">checked</c:if> />
            <label for="monthly">包月</label>
            <input type="radio" name="ac_type" id="package" value="1" onclick="feeTypeChange(2)"
                   <c:if test="${fee.ac_type == 1}">checked</c:if> />
            <label for="package">套餐</label>
            <input type="radio" name="ac_type" id="timeBased" value="2" onclick="feeTypeChange(3)"
                   <c:if test="${fee.ac_type == 2}">checked</c:if>/>
            <label for="timeBased">计时</label>
        </div>
        <div class="text_info clearfix"><span>基本时长：</span></div>
        <div class="input_info">
            <input type="text" value="${fee.base_duration}" class="width100" name="base_duration" />
            <span class="info">小时</span>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>基本费用：</span></div>
        <div class="input_info">
            <input type="text" value="${fee.base_cost}" class="width100" name="base_cost"/>
            <span class="info">元</span>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>单位费用：</span></div>
        <div class="input_info">
            <input type="text" value="${fee.unit_cost}" class="width100" name="unit_cost"/>
            <span class="info">元/小时</span>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>资费说明：</span></div>
        <div class="input_info_high">
                    <textarea class="width300 height70" name="ac_desc">${fee.ac_desc}
                    </textarea>
            <div class="validate_msg_short"></div>
        </div>
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save"  id="goFeeUpdate" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>
