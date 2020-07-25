<%@ page language="java" contentType="text/html;" pageEncoding="utf-8"%>
<%@page import="com.cy.entity.Admin"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>所有账户信息</title>
</head>
<body style="border-top: 1px solid #DBDBDD;">
    <div align="left">
        <br>
        <form action="/ssh2-netBank/admin/search" method="post">
             <b style="color: red">&nbsp;&nbsp;&nbsp;</b>
            <input name="personinfo.realname" placeholder="真实姓名" style="width: 150px;height: 25px;"/>
            <input name="status.id" type="hidden" value="${status.id}">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索">
        </form>
    </div>
    <div align="center" style="margin-top: 10px">
        <table width="100%" height="73px" bordercolor="#E6E6E6" cellpadding="0" cellspacing="0" bgcolor="#999999" align="center" border="1">
            <tr>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >序列</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >账户</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >用户名</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >余额</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >姓名</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >地址</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >身份证号</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >电话号码</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >状态</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap" colspan="2">
                    <div align="center"><font >操作</font></div>
                </td>
                <td height="40px" bgcolor="#FAFAFA" nowrap="nowrap">
                    <div align="center"><font >&nbsp;</font></div>
                </td>
            </tr>
            <!-- 循环显示用户信息 -->
            <s:iterator value="#request.users" status="status">
                <tr bgcolor="#FFFFFF">
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="#status.count"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="account.accountid"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="account.username"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="account.balance"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="realname"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="address"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="cardid"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="telephone"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center"><s:property value="account.status.name"/></div>
                    </td>
                    <td height="20px" valign="middle">
                        <div id="noWrap" align="center">
                            <s:if test="account.status.name=='启用'">
                                <input type="button" value="冻结" onclick="javascript:location.href='/ssh2-netBank/admin/locking?id=${account.accountid} & status.id=${status.id}'">
                            </s:if>
                            <s:else>
                                <input type="button" value="启用" onclick="javascript:location.href='/ssh2-netBank/admin/enabled?id=${account.accountid} & status.id=1'">
                            </s:else>
                        </div>
                    </td>
                    <td height="20px" valign="center">
                        <div id="noWrap" align="center">
                            <a href="/ssh2-netBank/transaction/loanlist1?pager.curPage=1&id=${account.accountid} & status.id=${status.id}"> 查看贷款 </a>
                        </div>
                    </td>
                    <td height="20px" valign="center">
                        <div id="noWrap" align="center">
                            <a href="/ssh2-netBank/admin/del?id=${account.accountid} & status.id=${status.id}"> 删除 </a>
                        </div>
                    </td>
                </tr>
            </s:iterator>
            <tr>
                <td height="20" colspan="14" valign="middle"></td>
            </tr>
        </table>
    </div>
</body>
</html>