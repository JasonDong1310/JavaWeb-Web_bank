<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@page import="com.cy.entity.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>充值</title>
<%
Admin admin = (Admin)request.getSession().getAttribute("admin");
Double money = admin.getMoney();
%>
<script type="text/javascript">
        function check() {
        	var money = document.getElementById("money").value;
        	if(money != "") {
        		var regu = /^(\-|\+)?\d+(\.\d+)?$/;
        		if(!regu.test(val)){
        			alert("请输入正数");
        		} else {
        			return true;
        		}
        	} else {
        		alert("金额不能为空！");
        	}
        }
    </script>
</head>
<body>
    <div style="width: 100%;height: 50px;background: #F2F2F2;line-height: 50px;padding-left: 30px;font-size: 20px;font-weight: 600;">账户充值</div>
	<div style="width: 100%;height: 80px;background: #F7F7F7;line-height: 80px;padding-left: 30px;font-size: 17px;font-weight: 600;">
	 账户余额 ：<i style="color: red;"><%=money%>&nbsp;</i>元
	</div>
	<form action="admin/addmoney" method="post" name="myform" onsubmit="return check()">
		<div align="center">
			<table width="450px" class="table" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td height="40">金 额：</td>
						<td><input type="text" id="money" name="money" />元 <span id="errorpwd" style="color: red;">${message}</span></td>
					</tr>
					<tr>
						<td height="40">&nbsp;</td>
						<td><input type="submit" value="充值" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>