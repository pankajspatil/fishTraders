<%@page import="com.org.fishtraders.transfer.Fish"%>
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
List<Fish> fishList = master.getAllFishes(false, 0);
%>

<h1 align="center">ADD FISH</h1>
<div style="float: right;padding-right: 11%; padding-bottom: 0.3%">
	<!-- <input type="button" name="newExpense" id="newExpense" value=""> -->
	<button class="btn btn-main btn-2g" name="newFish" id="newFish" onclick="openFishFancyBox(0, 'newFish', this);">New Fish</button>
</div>
<table border="1" class="mainTable" width="100%" id="fishTable">
<thead>
	<tr class="headerTR">
		<th width="30%">Name</th>
		<th width="10%">Active</th>
		<th width="10%">Action</th>
	</tr>
</thead>
<tbody>
	<%for(Fish fish : fishList){%>
		<tr>
			<td align="center"><%=fish.getFishName() %></td>
			<td align="center"><%=fish.getIsActive() %></td>
			<td>
				<img style="margin-left: 40%" height="22%" src="<%=contextPath%>/resources/images/edit.png" 
				id="<%=fish.getFishId()%>" name="editFish" onclick="updateFishRecord(this)">
			</td>
		</tr>
	<%}%>
</tbody>
</table>
<script type="text/javascript" src="<%=contextPath%>/resources/js/masters.js"></script>
</body>
</html>