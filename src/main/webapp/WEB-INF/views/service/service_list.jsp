<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/17
  Time: 15:34
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
            if("${modify_service_status_s_msg}"=="32"){
                $("#operate_result_info").html("操作成功");
                showResult();
            }
            if("${modify_service_status_f_msg}"=="33"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("操作失败");
                showResult();
            }
            if("${account_status_not_start}"=="34"){
                $("#operate_result_info").html("此账号所属的账务账号已暂停或已删除，无法操作");
                showResult();
            }
            if("${update_service_s_msg}"=="37"){
                $("#operate_result_info").html("更新成功");
                showResult();
            }
            if("${update_service_f_msg}"=="38") {
                $("#operate_result_info").attr("class", "operate_fail");
                $("#operate_result_info").html("更新失败");
                showResult();
            }
        });
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false);", 3000);
        }
        function showResultDiv(flag) {
            var divResult = document.getElementById("operate_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }
        //显示角色详细信息
        function showDetail(flag, a) {
            var detailDiv = a.parentNode.getElementsByTagName("div")[0];
            if (flag) {
                detailDiv.style.display = "block";
            }
            else
                detailDiv.style.display = "none";
        }

        //开通、暂停或删除
        function setState(status,s_id,acc_id) {
            if (status == 0) {
                var r = window.confirm("确定要暂停此业务账号吗？");
                if (r) {
                    location.href = '${pageContext.request.contextPath}/service/modifyServiceStatus?s_id='+s_id+'&acc_id='+acc_id+'&s_status='+status;
                }
                return;
            }
            if (status == 2) {
                var r = window.confirm("确定要删除此业务账号吗？");
                if (r) {
                    location.href = '${pageContext.request.contextPath}/service/modifyServiceStatus?s_id='+s_id+'&acc_id='+acc_id+'&s_status='+status;
                }
                return;
            }
            var r = window.confirm("确定要开通此业务账号吗？");
            if (r) {
                location.href = '${pageContext.request.contextPath}/service/modifyServiceStatus?s_id='+s_id+'&acc_id='+acc_id+'&s_status='+status;
                return;
            }
        }
        function searchService() {
            var $id_card=$("#id_card").val();
            var $os=$("#os").val();
            var $ip=$("#ip").val();
            var $status=$("#status").val();
            location.href='${pageContext.request.contextPath}/service/serviceSearch/1?s_id_card='+$id_card+'&'+'s_os='+$os+'&s_ip='+$ip+'&s_status='+$status;
        }
    </script>
    <c:if test="${modify_service_status_s_msg != null}">
        <c:remove var="modify_service_status_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${modify_service_status_f_msg != null}">
        <c:remove var="modify_service_status_f_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${account_status_not_start != null}">
        <c:remove var="account_status_not_start" scope="session"></c:remove>
    </c:if>
    <c:if test="${update_service_s_msg != null}">
        <c:remove var="update_service_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${update_service_f_msg != null}">
        <c:remove var="update_service_f_msg" scope="session"></c:remove>
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
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <div>OS 账号：<input type="text"  class="width100 text_search" id="os"/></div>
            <div>服务器 IP：<input type="text"  class="width100 text_search" id="ip"/></div>
            <div>身份证：<input type="text"   class="text_search" id="id_card"/></div>
            <div>状态：
                <select class="select_search" id="status">
                    <option value="">全部</option>
                    <option value="1">开通</option>
                    <option value="0">暂停</option>
                    <option value="2">删除</option>
                </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search" onclick="searchService()"/></div>
            <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/service/serviceAdd';" />
        </div>
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success">
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="width50">业务ID</th>
                    <th class="width70">账务账号ID</th>
                    <th class="width150">身份证</th>
                    <th class="width70">姓名</th>
                    <th>OS 账号</th>
                    <th class="width50">状态</th>
                    <th class="width100">服务器 IP</th>
                    <th class="width100">资费</th>
                    <th class="width200"></th>
                </tr>
                <c:forEach items="${serviceList}" var="service">
                    <tr>
                        <td><a href="${pageContext.request.contextPath}/service/serviceShow/${service.s_id}" title="查看明细">${service.s_id}</a></td>
                        <td>${service.acc_id}</td>
                        <td>${service.s_id_card}</td>
                        <td>${service.s_name}</td>
                        <td>${service.s_os}</td>
                        <td>${service.s_status == 1? '开通':(service.s_status == 0? '暂停':'删除')}</td>
                        <td>${service.s_ip}</td>
                        <td>
                            <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${service.fee.ac_name}</a>
                            <!--浮动的详细信息-->
                            <div class="detail_info">
                                ${service.fee.ac_desc}
                            </div>
                        </td>
                        <td class="td_modi">
                            <c:choose>
                                <c:when test="${service.s_status == 1}">
                                    <input type="button" value="暂停" class="btn_pause" onclick="setState(0,${service.s_id},${service.acc_id});" />
                                    <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/service/serviceModi/${service.s_id}';" />
                                    <input type="button" value="删除" class="btn_delete" onclick="setState(2,${service.s_id},${service.acc_id});" />
                                </c:when>
                                <c:when test="${service.s_status == 0}">
                                    <input type="button" value="开通" class="btn_start" onclick="setState(1,${service.s_id},${service.acc_id});" />
                                    <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/service/serviceModi/${service.s_id}';" />
                                    <input type="button" value="删除" class="btn_delete" onclick="setState(2,${service.s_id},${service.acc_id});" />
                                </c:when>
                            </c:choose>
                        </td>
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
