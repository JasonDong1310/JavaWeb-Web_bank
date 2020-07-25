<%@ page language="java" contentType="text/html;" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% 
   java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(  
     "yyyy-MM-dd HH:mm:ss");  
   java.util.Date currentTime = new java.util.Date();  
   String time = simpleDateFormat.format(currentTime).toString();  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <link href="css/admin.css" type="text/css" rel="stylesheet">
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" >
</head>
<body>
    <table width="100%" cellpadding="0" cellspacing="0" align="center" background="0">
        <tr height="28">
            <td style="font-size: 14px" background="images/title_bg1.jpg">&nbsp;&nbsp;µ±Ç°Î»ÖÃ£º</td>
        </tr>
        <tr>
            <td bgcolor="#b1ceef" height="2"></td>
        </tr>
        <tr height=20>
            <td background=images/shadow_bg.jpg></td>
        </tr>
    </table>
    	<div class="jumbotron" style="height: 600px;background-color: azure;">
	    	<div style="float: left; margin-left: 30%;">
	    		<img height="100" width="90" src="images/admin_p.gif">
	    	</div>
	    	<div style="float: left">
	    		<h2 style="margin-bottom: 15px;">»¶Ó­½øÈëÒøÐÐÕËÄ¿¹ÜÀíÏµÍ³£¡ </h2>
		  		<p>ÄúµÄµÇÂ¼Ê±¼ä£º  <%=time %></p>
	    	</div>
		</div>
</body>
</html>