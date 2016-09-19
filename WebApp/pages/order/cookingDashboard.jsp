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
	<table width="100%" border="1">
		<tr class="headerTR">
			<td width="10%">No</td>
			<td>Name</td>
			<td width="5%">Quantity</td>
			<td width="10%">Time</td>
			<td width="10%">Table</td>
			<td width="10%">Notes</td>
			<td width="5%">Action</td>
		</tr>
		<tr align="center" id="1">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"> </td>
		</tr>
		<tr align="center" id="2">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center" id="3"> 
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center" id="4">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		<tr align="center">
			<td>0000000001</td>
			<td>Chicken Sikh Kabab Masala</td>
			<td>1</td>
			<td>2 Mins Ago</td>
			<td>Table 12</td>
			<td>Notes</td>
			<td><input type="button" value="ADD" style="width: 100%;" onclick="moveRight(this)"></td>
		</tr>
		
		</table>
	
	</div>
	<div id="divright">
	<center style="font-size: 40px;"><b>Cooking</b></center>
		<table width="100%" border="1" id="table2">
		<tr class="headerTR">
			<td width="10%">No</td>
			<td>Name</td>
			<td width="5%">Quantity</td>
			<td width="10%">Time</td>
			<td width="10%">Table</td>
			<td width="10%">Notes</td>
			<td width="5%">Action</td>
		</tr>
	</table>
	</div>
	<script type="text/javascript" src="<%=contextPath%>/resources/js/cooking.js"></script>
</body>

</html>