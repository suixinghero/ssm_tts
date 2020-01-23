<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/19
  Time: 14:28
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
        //写入下拉框中的年份和月份
        function initialYearAndMonth() {
            //写入最近3年
            var yearObj = document.getElementById("selYears");
            var year = (new Date()).getFullYear();
            for (var i = 0; i <= 2; i++) {
                var opObj = new Option(year - i, year - i);
                yearObj.options[i] = opObj;
            }
            //写入 12 月
            var monthObj = document.getElementById("selMonths");
            var opObj = new Option("全部", "全部");
            monthObj.options[0] = opObj;
            for (var i = 1; i <= 12; i++) {
                var opObj = new Option(i, i);
                monthObj.options[i] = opObj;
            }
        }
        function searchBill() {
            var $id_card=$("#id_card").val();
            var $account=$("#account").val();
            var $name=$("#name").val();
            location.href='${pageContext.request.contextPath}/bill/billSearch/1?acc_id_card='+$id_card+'&'+'login_account='+$account+'&acc_name='+$name;
        }
    </script>
</head>
<body onload="initialYearAndMonth();">
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
                <c:when test="${url.pclass=='bill'}">
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
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <div>身份证：<input type="text"   class="text_search" id="id_card"/></div>
            <div>账务账号：<input type="text"  class="width100 text_search" id="account"/></div>
            <div>姓名：<input type="text"  class="width70 text_search" id="name"/></div>
            <div><input type="button" value="搜索" class="btn_search" onclick="searchBill()"/></div>
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="width50">账单ID</th>
                    <th class="width70">姓名</th>
                    <th class="width150">身份证</th>
                    <th class="width150">账务账号</th>
                    <th>费用</th>
                    <th class="width100">月份</th>
                    <th class="width100">支付方式</th>
                    <th class="width100">支付状态</th>
                    <th class="width50"></th>
                </tr>
                <c:forEach items="${accountList}" var="account">
                    <tr>
                        <td>${account.b_id}</td>
                        <td>${account.acc_name}</td>
                        <td>${account.acc_id_card}</td>
                        <td>${account.login_account}</td>
                        <td>${account.bill.b_cost}</td>
                        <td>${account.bill.createtime}</td>
                        <td>
                            <c:if test="${account.bill.b_status == 1}">
                                ${account.bill.b_pay_type == 0?'支付宝':(account.bill.b_pay_type == 1?'微信':'银联')}
                            </c:if>
                        </td>
                        <td>${account.bill.b_status == 0?'未支付':'已支付'}</td>
                        <td><a href="${pageContext.request.contextPath}/bill/billDetail/1/${account.acc_id}" title="账单明细">明细</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!--分页-->
        <div id="pages">
           ${bar}
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">


</div>
</body>
</html>
