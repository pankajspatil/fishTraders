<%@page import="com.org.fishtraders.transfer.ExpenseModel"%>
<%@page import="java.util.List"%>
<%@page import="com.org.fishtraders.modules.Expense"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/validateSession.jsp"%>
<%@ include file="/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
Expense expense = new Expense();
List<ExpenseModel> expenseList = expense.getExpenseList(null, false);
%>

<h1 align="center">Add Expense</h1>
<div style="float: right;padding-right: 11%">
	<!-- <input type="button" name="newExpense" id="newExpense" value=""> -->
	<button class="btn btn-main btn-2g" name="newExpense" id="newExpense" onclick="openExpenseFancyBox(0, 'newExpense', this);">New Expense</button>
</div>
<table border="1" class="mainTable" width="100%" id="expenseTable">
<thead>
	<tr class="headerTR">
		<th width="10%">No</th>
		<th width="20%">Vendor</th>
		<th width="20%">Boat</th>
		<th width="10%">Fish</th>
		<th>Amount</th>
		<th>Paid</th>
		<th width="30%">Remarks</th>
	</tr>
</thead>
<tbody>
	<%for(ExpenseModel expenseModel : expenseList){%>
		<tr>
			<td align="center"><%=expenseModel.getExpenseId() %></td>
			<td><%=expenseModel.getVendor().getVendorName() %></td>
			<td><%=expenseModel.getBoat().getBoatName() %></td>
			<td><%=expenseModel.getFish().getFishName() %></td>
			<td align="center"><%=expenseModel.getExpenseAmt() %></td>
			<td align="center"><%=expenseModel.getPaidAmt() %></td>
			<td><%=expenseModel.getExpenseRemark()%></td>
		</tr>
	<%}%>
</tbody>
</table>
<script type="text/javascript" src="<%=contextPath%>/resources/js/expense.js"></script>
</body>
</html>