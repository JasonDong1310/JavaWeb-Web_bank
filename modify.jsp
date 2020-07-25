<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改个人信息</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" >
</head>
<body>
    <form action="/ssh2-netBank/info/info_modify" style="margin-top: 20px;" name="myform" method="post">
        <div align="center">
        	
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">姓　　名</div>
	      <input type="text" value="${personinfo.realname}" class="form-control" name="personinfo.realname" id="personinfo.realname">
	    </div>
	  </div>
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">年　　龄</div>
	      <input type="text" value="${personinfo.age}" class="form-control" name="personinfo.age" id="personinfo.age">
	    </div>
	  </div>
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">性　　别</div>
	      <select name="personinfo.sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
          </select>
	    </div>
	  </div>
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">家庭住址</div>
	      <input type="text" value="${personinfo.address}" class="form-control" name="personinfo.address" id="personinfo.address">
	    </div>
	  </div>
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">联系电话</div>
	      <input type="text" value="${personinfo.telephone}" class="form-control" name="personinfo.telephone" id="personinfo.telephone">
	    </div>
	    <font size="1" style="color: red">11位电话号码</font>
	  </div>
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">身份证号</div>
	      <input type="text" value="${personinfo.cardid}" class="form-control" name="personinfo.cardid" id="personinfo.cardid">
	    </div>
	    <font size="1" style="color: red">18位身份证号</font>
	  </div>
        <button type="submit" class="btn btn-primary" style="width: 240px">提    交</button>
    </div>
    </form>
</body>
</html>