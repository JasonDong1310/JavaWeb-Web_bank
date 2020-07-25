<%@ page language="java" contentType="text/html;" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>取款</title>
    <script type="text/javascript">
    
        //获取时间 
	    function disptime(){
	    	var now=new Date();
	    	
	    	var year=now.getFullYear();
	    	var month=now.getMonth()+1;
	    	var date=now.getDate();
	    	var hour=now.getHours();
	    	var minute=now.getMinutes();
	    	var second =now.getSeconds();
	    		document.getElementById("datetime").value=year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	    		//year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	    		setTimeout("disptime()", 1000);
	    	}    
    
        //判断用户输入的存款金额是否合理
        function withdraw() {
        	var money = document.getElementById("tr_money").value;
        	//alert(money.length);
        	if(money.length>0) {
        		if(!(money.search(/^[\+\-]?\d+\.?\d*$/)==0)) {
    				document.getElementById("errormoney").innerHTML="含有非法字符!";
    				return false;
    			}else {
    				if(parseFloat(money)<=0) {
    					document.getElementById("errormoney").innerHTML="金额必须大于0!";
    					return false;
    				}
    				return confirm("确认要取款吗？ ");
    			}
        	} else {
        		document.getElementById("errormoney").innerHTML="金额不能为空！";
        		return false;
        	}
        }
        
    </script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" >
</head>
<body onload="disptime()">
<form action="/ssh2-netBank/transaction/withdraw" style="width: 100%; margin-left: 35%; margin-top: 20px;" name="myform" method="post" onsubmit="return withdraw()">
	  <div class="form-group" style="width: 20%;">
	    <div class="input-group">
	      <div class="input-group-addon">取款金额</div>
	      <input type="text" class="form-control" name="log.tr_money" id="tr_money" placeholder="Amount">
	    </div>
	    <span id="errormoney" style="color:red;"></span>
	  </div>
	  
	  <div class="form-group" style="width: 20%;">
	  	<label for="datetime"></label>
	    <div class="input-group">
	      <div class="input-group-addon">取款时间</div>
	      <input type="text" class="form-control" name="log.datetime" id="datetime">
	    </div>
	  </div>
	  <button type="submit" class="btn btn-primary" style="width: 240px">取  款</button>
	</form>
</body>
</html>