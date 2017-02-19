<%@page import="com.org.fishtraders.transfer.Vendor"%>
<%@page import="com.org.fishtraders.transfer.Boat"%>
<%@page import="com.org.fishtraders.master.Master"%>
<%@page import="java.util.List"%>
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
Master master = new Master();
List<Boat> boatList = master.getAllBoats(false, 0, 0);
%>

<h1 align="center">ADD BOAT</h1>
<div style="float: right;padding-right: 11%; padding-bottom: 0.3%">
	<!-- <input type="button" name="newExpense" id="newExpense" value=""> -->
	<button class="btn btn-main btn-2g" name="newBoat" id="newBoat" onclick="openBoatFancyBox(0, 'newBoat', this);">New Boat</button>
</div>
<table border="1" class="mainTable" width="100%" id="boatTable">
<thead>
	<tr class="headerTR">
		<th width="30%">Boat Name</th>
		<th width="20%">Vendor Name</th>
		<th width="30%">Vendor Address</th>
		<th width="10%">Active</th>
		<th width="10%">Action</th>
	</tr>
</thead>
<tbody>
	<%for(Boat boat : boatList){%>
		<tr>
			<td align="center"><%=boat.getBoatName() %></td>
			<td><%=boat.getVendor().getVendorName() %></td>
			<td><%=boat.getVendor().getVendorAddress() %></td>
			<td align="center"><%=boat.getIsActive() %></td>
			<td>
				<img style="margin-left: 40%" height="22%" src="<%=contextPath%>/resources/images/edit.png" 
				id="<%=boat.getBoatId()%>" name="editBoat" onclick="updateBoatRecord(this)">
			</td>
		</tr>
	<%}%>
</tbody>
</table>
<script type="text/javascript" src="<%=contextPath%>/resources/js/masters.js"></script>
</body>
</html>