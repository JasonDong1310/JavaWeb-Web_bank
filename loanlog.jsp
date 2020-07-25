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
			location.href="/ssh2-netBank/transaction/loanlist?pager.curPage="+curPage;
        }
    </script>
    <link href="../css/bootstrap.css" type="text/css" rel="stylesheet" >
</head>
<body>
	
    <div class="container" align="center">
         <table class="table table-striped table-bordered table-hover table-condensed">
        <tbody align="center">
            <tr>
                <td colspan="5" style="font-size: 20px; color: red;" align="center">贷款记录一览表</td>
            </tr>
            <tr>
                <td width="50">序号</td>
                <td width="50">id</td>
                <td width="80">贷款金额</td>
                <td width="80">代还金额</td>
                <td width="80">操作</td>
                <td>交易日期</td>
            </tr>
            <s:iterator value="#request.logs" status="status">
                <tr>
                    <td><s:property value="#status.count"/></td>
                    <td><s:property value="id"/></td>
                    <td><s:property value="loan_money"/></td>
                    <td><s:property value="huan_money"/></td>
                    <td><input type="button" value="还款" onclick="javascript:location.href='/ssh2-netBank/transaction/huan?id=${id}'"></td>
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
                        <a href='/ssh2-netBank/transaction/loanlist?pager.curPage=1'>首页</a>&nbsp;&nbsp;
                        <a href='/ssh2-netBank/transaction/loanlist?pager.curPage=${pager.curPage-1}'>上一页</a>
                    </s:if>
                </td>
                <td>
                    <s:if test="pager.curPage < pager.pageCount">
                        <a href='/ssh2-netBank/transaction/loanlist?pager.curPage=${pager.curPage+1}'>下一页</a>&nbsp;&nbsp;
                        <a href='/ssh2-netBank/transaction/loanlist?pager.curPage=${pager.pageCount}'>尾页</a>&nbsp;&nbsp;
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