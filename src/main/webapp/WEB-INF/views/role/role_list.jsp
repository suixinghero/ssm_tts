<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/8/18
  Time: 22:14
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
            if("${delete_role_s_msg}"=="8"){
                $("#operate_result_info").html("删除成功");
                showResult();
            }
            if("${delete_role_f_msg}"=="9"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("删除失败");
                showResult();
            }
            if("${update_role_s_msg}"=="10"){
                $("#operate_result_info").html("更新成功");
                showResult();
            }
            if("${update_role_f_msg}"=="11"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("更新失败");
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
        function deleteRole(rid) {
            var message=confirm("是否要删除此角色");
            if(message){
                location.href='${pageContext.request.contextPath}/role/deleteRole?rid='+rid;
            }
        }
    </script>
    <%
        if(session.getAttribute("delete_role_s_msg")!=null){
            session.removeAttribute("delete_role_s_msg");
        }
        if(session.getAttribute("delete_role_f_msg")!=null){
            session.removeAttribute("delete_role_f_msg");
        }
        if(session.getAttribute("update_role_s_msg")!=null){
            session.removeAttribute("update_role_s_msg");
        }
        if(session.getAttribute("update_role_f_msg")!=null){
            session.removeAttribute("update_role_f_msg");
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
                <c:when test="${url.pclass=='role'}">
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
            <input type="button" value="增加" class="btn_add" onclick="location.href='<%=request.getContextPath()%>/role/roleAdd';" />
        </div>
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success">
        </div> <!--删除错误！该角色被使用，不能删除。-->
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>角色 ID</th>
                    <th>角色名称</th>
                    <th class="width600">拥有的权限</th>
                    <th class="td_modi"></th>
                </tr>
                <c:forEach items="${roleList}" var="role">
                <tr>
                    <td>${role.rid}</td>
                    <td>${role.rname}</td>
                    <td>${role.powerString}</td>
                    <td>
                        <input type="button" value="修改" class="btn_modify" onclick="location.href='<%=request.getContextPath()%>/role/roleModi?rid=${role.rid}&rname=${role.rname}';"/>
                        <input type="button" value="删除" class="btn_delete" onclick="deleteRole('${role.rid}')" />
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

