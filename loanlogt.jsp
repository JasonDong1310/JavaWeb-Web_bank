<%@ page language="java" contentType="text/html;" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>分页显示贷款记录</title>
    <script type="text/javascript">
        function select() {
        	var curPage=document.getElementById("curPage").value;
			location.href="/ssh2-netBank/transaction/loanlist1?pager.curPage="+curPage;
        }
    </script>
</head>
<body>
    <div align="center">
        <table width="650" border="1" cellpadding="0" cellspacing="0">
        <tbody align="center">
            <tr>
                <td colspan="5" style="font-size: 20px; color: red;" align="center">贷款记录一览表</td>
            </tr>
            <tr>
                <td width="50">序号</td>
                <td width="80">贷款金额</td>
                <td width="80">代还金额</td>
                <td>交易日期</td>
            </tr>
            <s:iterator value="#request.logs" status="status">
                <tr>
                    <td><s:property value="#status.count"/></td>
                    <td><s:property value="loan_money"/></td>
                    <td><s:property value="huan_money"/></td>
                    <td><s:property value="datetime"/></td>
                </tr>
            </s:iterator>
            </tbody>
        </table>
        <!-- 分页超链接部分 -->
        <table>
            <tr>
                <td></td>
                <td>
                    <s:if test="pager.curPage > 1">
                        <a href='/ssh2-netBank/transaction/loanlist1?pager.curPage=1&id=${account.accountid} & status.id=${status.id}'>首页</a>&nbsp;&nbsp;
                        <a href='/ssh2-netBank/transaction/loanlist1?pager.curPage=${pager.curPage-1}&id=${account.accountid} & status.id=${status.id}'>上一页</a>&nbsp;&nbsp;
                    </s:if>
                </td>
                <td>
                    <s:if test="pager.curPage < pager.pageCount">
                        <a href='/ssh2-netBank/transaction/loanlist1?pager.curPage=${pager.curPage+1}&id=${account.accountid} & status.id=${status.id}'>下一页</a>&nbsp;&nbsp;
                        <a href='/ssh2-netBank/transaction/loanlist1?pager.curPage=${pager.pageCount}&id=${account.accountid} & status.id=${status.id}'>尾页</a>&nbsp;&nbsp;
                    </s:if>
                </td>
                <td>
                                                共${pager.curPage}/${pager.pageCount}页&nbsp;&nbsp;转至
                    <select onchange="select()" id="curPage">
                        <s:iterator>
                            <s:if test="#status.count == pager.curPage">
                                <option value="${status.count}" selected="selected">${status.count}</option>
                            </s:if>
                            <s:else>
                                <option value="${status.count}">${status.count}</option>
                            </s:else>
                        </s:iterator>
                    </select>页
                </td>
            </tr>
        </table>
    </div>
</body>
</html>