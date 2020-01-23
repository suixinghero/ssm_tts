<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/11
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="<%=request.getContextPath()%>/styles/global_color.css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if("${start_fee_s_msg}"=="20"){
                $("#operate_result_info").html("开通成功");
                showResult();
            }
            if("${start_fee_f_msg}"=="21"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("开通失败");
                showResult();
            }
            if("${delete_fee_s_msg}"=="22"){
                $("#operate_result_info").html("删除成功");
                showResult();
            }
            if("${delete_fee_f_msg}"=="23"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("删除失败");
                showResult();
            }
            if("${update_fee_s_msg}"=="24"){
                $("#operate_result_info").html("修改成功");
                showResult();
            }
            if("${update_fee_f_msg}"=="25"){
                $("#operate_result_info").attr("class","operate_fail");
                $("#operate_result_info").html("修改失败");
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
        //排序按钮的点击事件
        function sort(flag) {
            location.href = '${pageContext.request.contextPath}/fee/feeSort/1/' + flag;
        }

        //启用
        function startFee(id) {
            var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
            if(r){
                location.href='${pageContext.request.contextPath}/fee/feeStart/'+id;
            }
        }
        //删除
        function deleteFee(id) {
            var r = window.confirm("确定要删除此资费吗？");
            if(r){
                location.href='${pageContext.request.contextPath}/fee/feeDelete/'+id;
            }
        }
    </script>
    <c:if test="${start_fee_s_msg != null}">
        <c:remove var="start_fee_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${start_fee_f_msg != null}">
        <c:remove var="start_fee_f_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${delete_fee_s_msg != null}">
        <c:remove var="delete_fee_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${delete_fee_f_msg != null}">
        <c:remove var="delete_fee_f_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${update_fee_s_msg != null}">
        <c:remove var="update_fee_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${update_fee_f_msg != null}">
        <c:remove var="update_fee_f_msg" scope="session"></c:remove>
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
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <form action="" method="">
        <!--排序-->
        <div class="search_add">
            <div>
                <input type="button" value="基时" class="sort_desc" onclick="sort(-1);" />
                <input type="button" value="基费" class="sort_desc" onclick="sort(-3);" />
                <input type="button" value="单费" class="sort_desc" onclick="sort(-5);" />
            </div>
            <input type="button" value="增加" class="btn_add" onclick="location.href='<%=request.getContextPath()%>/fee/feeAdd';" />
        </div>
        <!--启用操作的操作提示-->
        <div id="operate_result_info" class="operate_success">
        </div>
        <!--数据区域：用表格展示数据-->
        <div id="data">
            <table id="datalist">
                <tr>
                    <th>资费ID</th>
                    <th class="width100">资费名称</th>
                    <th>基本时长</th>
                    <th>基本费用</th>
                    <th>单位费用</th>
                    <th>创建时间</th>
                    <th>开通时间</th>
                    <th class="width50">状态</th>
                    <th class="width200"></th>
                </tr>
                <c:forEach items="${feeList}" var="fee">
                    <tr>
                        <td>${fee.id}</td>
                        <td><a href="<%=request.getContextPath()%>/fee/feeShow/${fee.id}"> ${fee.ac_name} </a></td>
                        <td>${fee.base_duration} 小时</td>
                        <td>${fee.base_cost} 元</td>
                        <td>${fee.unit_cost} 元/小时</td>
                        <td>${fee.createtime}</td>
                        <td>${fee.starttime}</td>
                        <td>${fee.ac_status == 0?'暂停':(fee.ac_status == 1?'开通':'删除')}</td>
                        <td>
                            <c:if test="${fee.ac_status == 0}">
                                <input type="button" value="启用" class="btn_start" onclick="startFee(${fee.id});"/>
                                <input type="button" value="修改" class="btn_modify"
                                       onclick="location.href='${pageContext.request.contextPath}/fee/feeModi/${fee.id}';"/>
                                <input type="button" value="删除" class="btn_delete" onclick="deleteFee(${fee.id});"/>
                            </c:if>
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

