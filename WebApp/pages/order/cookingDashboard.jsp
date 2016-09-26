<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
	<h1 align="center">Cooking Dashboard</h1>
	<div id="divleft">
	<center style="font-size: 40px;"><b>Ordered</b></center>
	<table width="100%" border="0" id="cookingTable">
	<thead>
		<tr class="headerTR">
			<td width="10%">No</td>
			<td>Name</td>
			<td width="5%">Quantity</td>
			<td width="10%">Time(Ago)</td>
			<td width="10%">Table</td>
			<td width="10%">Notes</td>
			<td width="5%">Action</td>
		</tr>
	</thead>
	<tbody></tbody>
		</table>
	
	</div>
	<div id="divright">
	<center style="font-size: 40px;"><b>Cooking</b></center>
		<table width="100%" border="0" id="cookedTable">
		<thead>
		<tr class="headerTR">
			<td width="10%">No</td>
			<td>Name</td>
			<td width="5%">Quantity</td>
			<td width="10%">Time</td>
			<td width="10%">Table</td>
			<td width="10%">Notes</td>
			<td width="5%">Action</td>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
	</div>
	<script type="text/javascript" src="<%=contextPath%>/resources/js/cooking.js"></script>
</body>

</html>