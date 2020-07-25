<%@page contentType="text/html;charset=utf-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (session.getAttribute("admin") != null) {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/default.css">
<script type="text/javascript">
	function showTime() {
		//使用对象.innerText修改span元素间的内容
		document.getElementById("now").innerText = "当前时间："
				+ new Date().toLocaleString();
	}
	setInterval("showTime()", 1000);//每隔1000毫秒(1s)调用showTime函数
</script>
<style type="text/css">
#right {
	width: calc(100% - 210px);
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
	<div style="width: 100%; height: 60px; background: url('../images/top.png'); background-size: 100% 100%;"></div>
	<div style="width: 100%; height: 40px;">
		<div id="now" style="width: 200px; height: 40px; background: #744DA3; margin-right: 10px; color: #fff; text-align: center; float: left;"></div>
		<div id="right" style="height: 40px; background: #744DA3; float: left;">
			<marquee style="width: 450px;margin-right: 20px;right;color: #fff;" onMouseOut="this.start()" onMouseOver="this.stop()">欢迎登陆银行账目管理系统</marquee>
		</div>
	</div>
</body>
</html>
<%
	} else {//------------------------------------not logged-------------------------------------------------------
		response.sendRedirect("index.jsp");
	}
%>