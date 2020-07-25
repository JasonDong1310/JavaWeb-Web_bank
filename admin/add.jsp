<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>开户</title>
    <script type="text/javascript">
        function check() {
        	var username = document.getElementById("username").value;
        	var pwd = document.getElementById("pwd").value;
        	var confirmpwd = document.getElementById("confirmpwd").value;
        	var balance = document.getElementById("balance").value;
        	var realname = document.getElementById("realname").value;
        	var age = document.getElementById("age").value;
        	var address = document.getElementById("address").value;
        	var telephone = document.getElementById("telephone").value;
        	var cardid = document.getElementById("cardid").value;
        	
        	document.getElementById("errorusername").innerHTML = "";
        	document.getElementById("errorpwd").innerHTML = "";
        	document.getElementById("errorconfirmpwd").innerHTML = "";
        	document.getElementById("errorbalance").innerHTML = "";
        	document.getElementById("errorrealname").innerHTML = "";
        	document.getElementById("errorage").innerHTML = "";
        	document.getElementById("erroraddress").innerHTML = "";
        	document.getElementById("errortelephone").innerHTML = "";
        	document.getElementById("errorcardid").innerHTML = "";
        	
        	if(username == "") {
        		document.getElementById("errorusername").innerHTML = "请输入用户名！";
        		return false;
        	} else if(pwd == "") {
            	document.getElementById("errorpwd").innerHTML = "请输入密码！";
                return false;
        	} else if(confirmpwd == "") {
            	document.getElementById("errorconfirmpwd").innerHTML = "请输入确认密码！";
                return false;
        	} else if(balance == "") {
            	document.getElementById("errorbalance").innerHTML = "请输入金额！";
                return false;
        	} else if(realname == "") {
            	document.getElementById("errorrealname").innerHTML = "请输入真实姓名！";
                return false;
        	} else if(age == "") {
            	document.getElementById("errorage").innerHTML = "请输入年龄！";
                return false;
        	} else if(address == "") {
            	document.getElementById("erroraddress").innerHTML = "请输入家庭住址！";
                return false;
        	} else if(cardid == "") {
            	document.getElementById("errorcardid").innerHTML = "请输入身份证号！";
                return false;
        	} else {
        		if(pwd != confirmpwd) {
        			document.getElementById("errorconfirmpwd").innerHTML = "两次密码不一致！";
                    return false;
        		}
        		if(!(balance.search(/^[\+\-]?\d+\.?\d*$/) == 0)) {
        			document.getElementById("errorbalance").innerHTML = "输入金额中含有非法字符！";
                    return false;
        		} else if(parseFloat(balance)<10) {
        			document.getElementById("errorbalance").innerHTML = "开户金额布不能小于10元！";
                    return false;
        		}
        		if(!(age.search(/^[\+\-]?\d+\.?\d*$/)==0)) {
        			document.getElementById("errorage").innerHTML="输入年龄中含有非法字符！";
    				return false;
        		} else {
        			if(parseFloat(age)<18) {
    						document.getElementById("errorage").innerHTML="未成年人不能开户";
    						return false;
    				}else if(parseFloat(age)>99) {
    					document.getElementById("errorage").innerHTML="年龄输入有误,100岁以下";
    						return false;
    				}
        		}
        		if(telephone.length()!=11) {
        			document.getElementById("errortelephone").innerHTML = "电话格式不正确！";
        			return false;
        		}
        		if(cardid.length()!=18) {
        			document.getElementById("errorcardid").innerHTML = "身份证格式不正确！";
        			return false;
        		}
        		
        		return true;
        	}
        	
        }
    </script>
</head>
<body>
        <div style="font-size: 15px;font-weight: 600;padding: 25px 0px;">账户开户</div>
        <form style="width: 100%;height: auto;border: 2px solid #DDE1E3;" action="/ssh2-netBank/admin/openAccount" method="post" name="myform"  onsubmit="return check();">
            <div align="center" style="padding-left: 30px;">
            <table style="float: left;" width="450px" class="table" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr>
                        <td width="100px" height="40">用&nbsp;户 &nbsp;名：</td>
                        <td height="40">
                            <input type="text" id="username" name="account.username"/>
                            <span id="errorusername" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">密　　码：</td>
                        <td>
                            <input type="password" id="pwd" name="account.password"/>
                            <span id="errorpwd" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">确认密码：</td>
                        <td>
                            <input type="password" id="confirmpwd" />
                            <span id="errorconfirmpwd" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">开户金额：</td>
                        <td>
                            <input type="text" id="balance" name="account.balance"/>
                            <span id="errorbalance" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">姓　　名：</td>
                        <td>
                            <input type="text" id="realname" name="personinfo.realname"/>
                            <span id="errorrealname" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">年　　龄：</td>
                        <td>
                            <input type="text" id="age" name="personinfo.age"/>
                            <span id="errorage" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">性　　别：</td>
                        <td>
                            <select name="personinfo.sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">家庭地址：</td>
                        <td>
                            <input type="text" id="address" name="personinfo.address"/>
                            <span id="erroraddress" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">电话号码：</td>
                        <td>
                            <input type="text" id="telephone" name="personinfo.telephone"/>
                            <font size="1" style="color: red;">11位电话号码</font>
                            <span id="errortelephone" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">身份证号：</td>
                        <td>
                            <input type="text" id="cardid" name="personinfo.cardid"/>
                            <font size="1" style="color: red;">18位身份证号</font>
                            <span id="errorcardid" style="color: red;">${message}</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40">&nbsp;</td>
                        <td>
                            <input type="submit" value="开户"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div style="float: left;"><img alt="" src="../images/ka.jpg" width="300"></div>
         </div>
         </form>
</body>
</html>