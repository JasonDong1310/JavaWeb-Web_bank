<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@page import="com.cy.entity.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if (session.getAttribute("admin") == null) {
%>
<jsp:forward page="/login.jsp"></jsp:forward>
<%
	} else {
		Admin admin = (Admin) session.getAttribute("admin");
		request.getSession().setAttribute("admin", admin);
	}
%>
<html>
<head>
<title>管理员页面</title>
</head>
<frameset rows="95,*">
	<frame scrolling="no" src="top.jsp">
	<frameset framespacing="0" border="false" cols="210,*" frameborder="0">
		<frame name="left" scrolling="no" marginwidth="0" marginheight="0" src="left.jsp">
		<frame name="right" scrolling="yes" src="main.jsp">
	</frameset>
</frameset>
<noframes>
</noframes>
</html>