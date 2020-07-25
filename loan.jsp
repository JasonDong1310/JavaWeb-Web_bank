<%@ page language="java" contentType="text/html;" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.lang.String"%>
<%@page import="java.lang.Double"%>
<%@page import="com.cy.entity.TransactionLog"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>贷款</title>
<script type="text/javascript">
	function check() {
		var money = document.getElementById("loanmoney").value;
		if(money != ""){
			return true;
		} else {
			alert("请输入金额");
			return false;
		}
	}
</script>
<link href="../css/bootstrap.css" type="text/css" rel="stylesheet" >
</head>
<body>
	<form style="width: 100%; margin-left: 35%; margin-top: 20px;" action="/ssh2-netBank/transaction/loanmoney" name="myform" method="post" onsubmit="return check()">
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">平均存款金额</div>
	      <input type="text" value="${arg}" disabled="disabled" class="form-control" name="log.tr_money" id="tr_money" placeholder="Amount">
	    </div>
	  </div>
	  <s:if test="#session.arg < 1000.0">
			<p>平均存款金额低于1000元，没有贷款权限</p>
	  </s:if>
	  <s:else>
		  <div class="form-group" style="width: 20%;">
		    <div class="input-group">
		      <div class="input-group-addon">贷  款  金  额 </div>
		      <input type="text" class="form-control" name="loanmoney" id="loanmoney" placeholder="Amount">
		    </div>
		    <span style="color: red;">*<s:fielderror name="loanerror" cssStyle="color:red"></s:fielderror></span>
		  </div>
		  <button type="submit" class="btn btn-primary" style="width: 240px">贷  款</button>
	  </s:else>
	</form>
</body>
</html>