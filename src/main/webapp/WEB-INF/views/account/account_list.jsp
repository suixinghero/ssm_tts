<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/13
  Time: 17:25
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
            if("${modify_account_status_s_msg}"=="26"){
                $("#operate_result_info").html("操作成功");
                showResult();
            }
            if("${modify_account_status_f_msg}"=="27"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("操作失败");
                showResult();
            }
            if("${update_account_s_msg}"=="30"){
                $("#operate_result_info").html("更新成功");
                showResult();
            }
            if("${update_account_f_msg}"=="31"){
                $("#operate_result_info").attr("class","operate_fail");
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
        //删除
        function deleteAccount(status, id) {
            var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
            if (r) {
                location.href = '${pageContext.request.contextPath}/account/modifyAccountFlag/' + id+'/'+status;
            }
        }
        //开通或暂停
        function setState(status, id) {
            if (status == 0) {
                var r = window.confirm("确定要暂停此账务账号吗？");
                if (r) {
                    location.href = '${pageContext.request.contextPath}/account/modifyAccountFlag/' + id+'/'+status;
                }
                return;
            }
            var r = window.confirm("确定要开通此账务账号吗？");
            if (r) {
                location.href = '${pageContext.request.contextPath}/account/modifyAccountFlag/' + id+'/'+status;
                return;
            }
        }
        function search() {
            var $id_card=$("#id_card").val();
            var $name=$("#name").val();
            var $account=$("#account").val();
            var $status=$("#status").val();
            location.href='${pageContext.request.contextPath}/account/accountSearch/1?acc_id_card='+$id_card+'&'+'acc_name='+$name+'&login_account='+$account+'&acc_status='+$status;
        }
    </script>
    <c:if test="${modify_account_status_s_msg != null}">
        <c:remove var="modify_account_status_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${modify_account_status_f_msg != null}">
        <c:remove var="modify_account_status_f_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${update_account_s_msg != null}">
        <c:remove var="update_account_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${update_account_f_msg != null}">
        <c:remove var="update_account_f_msg" scope="session"></c:remove>
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
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="">
        <!--查询-->
        <div class="search_add">
            <div>身份证：<input type="text"  class="text_search" id="id_card"/></div>
            <div>姓名：<input type="text" class="width70 text_search" id="name" /></div>
            <div>登录账号：<input type="text"   class="text_search" id="account"/></div>
            <div>
                状态：
                <select class="select_search" id="status">
                    <option value="">全部</option>
                    <option value="1">开通</option>
                    <option value="0">暂停</option>
                    <option value="2">删除</option>
                </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search" onclick="search();"/></div>
            <input type="button" value="增加" class="btn_add" onclick="location.href='<%=request.getContextPath()%>/account/accountAdd';" />
        </div>
        <!--删除等的操作提示-->
        <div id="operate_result_info" class="operate_success">
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>账号ID</th>
                    <th>姓名</th>
                    <th class="width150">身份证</th>
                    <th>登录账号</th>
                    <th>状态</th>
                    <th class="width100">创建日期</th>
                    <th class="width150">上次登录时间</th>
                    <th class="width200"></th>
                </tr>
                <c:forEach items="${accountList}" var="account">
                    <tr>
                        <td>${account.acc_id}</td>
                        <td><a href="<%=request.getContextPath()%>/account/accountShow/${account.acc_id}">${account.acc_name}</a></td>
                        <td>${account.acc_id_card}</td>
                        <td>${account.login_account}</td>
                        <td>${account.acc_status == 1?'开通':(account.acc_status == 0?'暂停':'删除')}</td>
                        <td>${account.createtime}</td>
                        <td>${account.lasttime}</td>
                        <td class="td_modi">
                            <c:choose>
                                <c:when test="${account.acc_status == 1}">
                                    <input type="button" value="暂停" class="btn_pause" onclick="setState(0,${account.acc_id});" />
                                    <input type="button" value="修改" class="btn_modify" onclick="location.href='<%=request.getContextPath()%>/account/accountModi/${account.acc_id}';" />
                                    <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(2,${account.acc_id});" />
                                </c:when>
                                <c:when test="${account.acc_status == 0}">
                                    <input type="button" value="开通" class="btn_start" onclick="setState(1,${account.acc_id});" />
                                    <input type="button" value="修改" class="btn_modify" onclick="location.href='<%=request.getContextPath()%>/account/accountModi/${account.acc_id}';" />
                                    <input type="button" value="删除" class="btn_delete" onclick="deleteAccount(2,${account.acc_id});" />
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

