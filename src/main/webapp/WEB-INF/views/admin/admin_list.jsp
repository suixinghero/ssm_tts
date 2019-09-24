<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/19
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            if("${delete_admin_s_msg}"=="14"){
                $("#operate_result_info").html("删除成功");
                showResult();
            }
            if("${delete_admin_f_msg}"=="15"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("删除失败");
                showResult();
            }
            if("${update_admin_s_msg}"=="4"){
                $("#operate_result_info").html("更新成功");
                showResult();
            }
            if("${update_admin_f_msg}"=="5"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("更新失败");
                showResult();
            }
            if("${reset_pwd_s_msg}"=="16"){
                $("#operate_result_info").html("重置成功");
                showResult();
            }
            if("${reset_pwd_s_msg}"=="17"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("重置失败");
                showResult();
            }
        });
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false)", 3000);
        }
        function showResultDiv(fg) {
            if (fg)
                $("#operate_result_info").css("display","block");
            else
                $("#operate_result_info").css("display","none");
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
        //重置密码
        function resetPwd() {
            var $aidList=$(".aidList");
            var i=0;
            for(var j=0;j<$aidList.length;j++) {
                if($aidList[j].checked){
                    i++;
                }
            }
            if(i==0){
               alert("请选择一个管理员!");
            }else{
                $("#loginForm").submit();
            }
        }
        //删除
        function deleteAdmin(aid) {
            var r = window.confirm("确定要删除此管理员吗？");
            if(r){
                location.href='${pageContext.request.contextPath}/admin/deleteAdmin?aid='+aid;
            }
        }
        //全选
        function selectAdmins(inputObj) {
            var inputArray = document.getElementById("datalist").getElementsByTagName("input");
            for (var i = 1; i < inputArray.length; i++) {
                if (inputArray[i].type == "checkbox") {
                    inputArray[i].checked = inputObj.checked;
                }
            }
        }
        function show(){
            var $selValue = $("#selModules").val();
            location.href='${pageContext.request.contextPath}/admin/findAdmin/1/'+$selValue;
        }
    </script>
    <%
        if(session.getAttribute("update_admin_s_msg")!=null){
            session.removeAttribute("update_admin_s_msg");
        }
        if(session.getAttribute("update_admin_f_msg")!=null){
            session.removeAttribute("update_admin_f_msg");
        }
        if(session.getAttribute("delete_admin_s_msg")!=null){
            session.removeAttribute("delete_admin_s_msg");
        }
        if(session.getAttribute("delete_admin_f_msg")!=null){
            session.removeAttribute("delete_admin_f_msg");
        }
        if(session.getAttribute("reset_pwd_s_msg")!=null){
            session.removeAttribute("reset_pwd_s_msg");
        }
        if(session.getAttribute("reset_pwd_f_msg")!=null){
            session.removeAttribute("reset_pwd_f_msg");
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
    <form action="<%=request.getContextPath()%>/admin/resetAdmin" method="get" id="loginForm">
        <!--查询-->
        <div class="search_add">
            <div>
                角色：
                <select id="selModules" class="select_search">
                    <option  value="全部" selected>全部</option>
                    <c:forEach items="${roleList}" var="role">
                        <option  value="${role.rname}">${role.rname}</option>
                    </c:forEach>
                </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search" onclick="show()"/></div>
            <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
            <input type="button" value="增加" class="btn_add" onclick="location.href='<%=request.getContextPath()%>/admin/adminAdd';" />
        </div>
        <!--删除和密码重置的操作提示-->
        <div id="operate_result_info" class="operate_success">
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th class="th_select_all">
                        <input type="checkbox" onclick="selectAdmins(this);" />
                        <span>全选</span>
                    </th>
                    <th>管理员ID</th>
                    <th>姓名</th>
                    <th>登录名</th>
                    <th>电话</th>
                    <th>电子邮件</th>
                    <th>授权日期</th>
                    <th class="width100">拥有角色</th>
                    <th></th>
                </tr>
                <c:forEach items="${adminList}" var="admin">
                    <tr>
                        <td><input type="checkbox"  value="${admin.aid}" name="aidList" class="aidList"/></td>
                        <td>${admin.aid}</td>
                        <td>${admin.aname}</td>
                        <td>${admin.auname}</td>
                        <td>${admin.atel}</td>
                        <td>${admin.aemail}</td>
                        <td>${admin.by4}</td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:length(fn:split(admin.roleString,','))>1}">
                                    <a class="summary" onmouseover="showDetail(true,this);"
                                       onmouseout="showDetail(false,this);">...</a>
                                    <!--浮动的详细信息-->
                                    <div class="detail_info">
                                            ${admin.roleString}
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    ${admin.roleString}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="td_modi">
                            <input type="button" value="修改" class="btn_modify"
                                   onclick="location.href='<%=request.getContextPath()%>/admin/adminModi?' +
                                           'aid=${admin.aid}&aname=${admin.aname}&auname=${admin.auname}&atel=${admin.atel}&aemail=${admin.aemail}'"/>
                            <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin('${admin.aid}');"/>
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

