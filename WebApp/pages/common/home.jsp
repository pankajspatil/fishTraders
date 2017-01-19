<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<%@ include file="/pages/common/validateSession.jsp"%>
<%@page import="com.org.fishtrader.transfer.Boat"%>
<%@page import="com.org.fishtrader.transfer.Vendor"%>

<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.org.fishtrader.home.Home"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/css/home.css">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/css/materialize.css">
</head>
<body>
	<table width="100%" align="center">
		<tr>
			<td width="33.33%">&nbsp;</td>
			<td width="33.33%" align="center"><h1>Boat Status</h1></td>
			<td width="33.33%" align="right"><div
					style="border: 2px solid black; width: 30%; text-align: center;">
					<div class="reactanleDiv avlblFill">Vacant</div>
					<!-- <div>Reserved</div> -->
					<div class="reactanleDiv occpdFill">Occupied</div>
				</div></td>
		</tr>
	</table>
	<%
		int tablesPerRow = 5;
		Home home = new Home();
		LinkedHashMap<String, List<Boat>> boatMap = home.getAllBoats();
		List<Vendor> VendorList = home.getAllVendors();

		//out.println(tableMap.toString());

	%>
	<table align="center" width="<%=tablesPerRow * 10%>%" border="1"
		cellpadding="20" cellspacing="20">
		<tr>
			<th>Boat Seller Name</th>
			<th>Boat No</th>			
		</tr>
		<tr>
			<td><select onchange="">
				<option value="-1"> Select Boat Seller</option>
					<%
						for (Vendor vendor : VendorList) {
					%>

					<option value=<%=vendor.getVendorId()%>><%=vendor.getVendorName()%></option>
					<%
						}
					%>
			</select></td>
			<td></td>
		</tr>
	</table>
	

	<!-- <h1 align="center">Table Status<div style="float: right;border: 1px;">Text</div></h1> -->
	<script src="<%=contextPath%>/resources/js/materialize.js"
		type="text/javascript"></script>
	<script src="<%=contextPath%>/resources/js/boat.js"
		type="text/javascript"></script>
</body>
<%@ include file="/pages/common/footer.jsp"%>
</html>
