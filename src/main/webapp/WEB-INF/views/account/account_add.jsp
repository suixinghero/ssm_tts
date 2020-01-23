<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/12/13
  Time: 19:53
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
           $("#goAccountSave").click(function () {
               $("#loginForm").submit();
           });
           $("#recomm_id_card").blur(function () {
              var $recomm_id_card=$("#recomm_id_card").val();
              var $year=$recomm_id_card.substring(6,10);
              var $month=$recomm_id_card.substring(10,12);
              var $day=$recomm_id_card.substring(12,14);
              var $birth=$year+'-'+$month+'-'+$day;
              $("#acc_birth").val($birth);
           });
            if("${insert_account_s_msg}"=="28"){
                $("#save_result_info").html("添加成功");
                showResult();
            }
            if("${insert_account_f_msg}"=="29"){
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

        //显示选填的信息项
        function showOptionalInfo(imgObj) {
            var div = document.getElementById("optionalInfo");
            if (div.className == "hide") {
                div.className = "show";
                imgObj.src = "../images/hide.png";
            }
            else {
                div.className = "hide";
                imgObj.src = "../images/show.png";
            }
        }
    </script>
    <c:if test="${insert_account_s_msg != null}">
        <c:remove var="insert_account_s_msg" scope="session"></c:remove>
    </c:if>
    <c:if test="${insert_account_f_msg != null}">
        <c:remove var="insert_account_f_msg" scope="session"></c:remove>
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
    <!--保存成功或者失败的提示消息-->
    <div id="save_result_info" class="save_success"></div>
    <form action="<%=request.getContextPath()%>/account/accountSave" method="post" class="main_form" id="loginForm">
        <!--必填项-->
        <div class="text_info clearfix"><span>姓名：</span></div>
        <div class="input_info">
            <input type="text"  name="acc_name"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>身份证：</span></div>
        <div class="input_info">
            <input type="text"  name="acc_id_card"/>
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>登录账号：</span></div>
        <div class="input_info">
            <input type="text"  name="login_account" />
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>密码：</span></div>
        <div class="input_info">
            <input type="password" name="acc_pass" />
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>重复密码：</span></div>
        <div class="input_info">
            <input type="password" name="second_pass" />
            <span class="required">*</span>
            <div class="validate_msg_long"></div>
        </div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" class="width200" name="acc_tel"/>
            <span class="required">*</span>
            <div class="validate_msg_medium"></div>
        </div>
        <!--可选项-->
        <div class="text_info clearfix"><span>可选项：</span></div>
        <div class="input_info">
            <img src="<%=request.getContextPath()%>/images/show.png" alt="展开" onclick="showOptionalInfo(this);" />
        </div>
        <div id="optionalInfo" class="hide">
            <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
            <div class="input_info">
                <input type="text" name="recomm_id_card" id="recomm_id_card"/>
                <div class="validate_msg_long"></div>
            </div>
            <div class="text_info clearfix"><span>生日：</span></div>
            <div class="input_info">
                <input type="text"  readonly class="readonly" name="acc_birth" id="acc_birth"/>
            </div>
            <div class="text_info clearfix"><span>Email：</span></div>
            <div class="input_info">
                <input type="text" class="width350" name="acc_email"/>
                <div class="validate_msg_tiny"></div>
            </div>
            <div class="text_info clearfix"><span>职业：</span></div>
            <div class="input_info">
                <select name="profession">
                    <option value="0">干部</option>
                    <option value="1">学生</option>
                    <option value="2">技术人员</option>
                    <option value="3">其他</option>
                </select>
            </div>
            <div class="text_info clearfix"><span>性别：</span></div>
            <div class="input_info fee_type">
                <input type="radio" name="acc_sex"  id="female" value="1"/>
                <label for="female">女</label>
                <input type="radio" name="acc_sex" id="male" value="0" checked/>
                <label for="male">男</label>
            </div>
            <div class="text_info clearfix"><span>通信地址：</span></div>
            <div class="input_info">
                <input type="text" class="width350" name="acc_address"/>
                <div class="validate_msg_tiny"></div>
            </div>
            <div class="text_info clearfix"><span>邮编：</span></div>
            <div class="input_info">
                <input type="text" name="acc_code"/>
                <div class="validate_msg_long"></div>
            </div>
            <div class="text_info clearfix"><span>QQ：</span></div>
            <div class="input_info">
                <input type="text" name="acc_qq"/>
                <div class="validate_msg_long"></div>
            </div>
        </div>
        <!--操作按钮-->
        <div class="button_info clearfix">
            <input type="button" value="保存" class="btn_save" id="goAccountSave" />
            <input type="button" value="取消" class="btn_save" />
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>
