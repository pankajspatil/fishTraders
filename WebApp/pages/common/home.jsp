<%@page import="com.org.fishtraders.master.Master"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<%@ include file="/pages/common/validateSession.jsp"%>
<%@page import="com.org.fishtraders.transfer.Boat"%>
<%@page import="com.org.fishtraders.transfer.Vendor"%>

<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.org.fishtraders.home.Home"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/css/home.css">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/css/materialize.css">
	<script type="text/javascript">
	
	function reloadpage(){
		document.forms['vendorform'].submit();
	}
	
	</script>
</head>
<body>
<form action="home.jsp" name="vendorform" method="get">
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
	try{
		String reload = request.getParameter("reload");
		String vendorSelectid = request.getParameter("vendorSelectid");
		LinkedHashMap<String, List<Boat>> boatMap = null;
		List<Vendor> vendorList=null;
		List<Boat> vendorBoat=null;

		int tablesPerRow = 5;
		Home home = new Home();
		Master master = new Master();

		if (reload != null && reload.equalsIgnoreCase("1")) {
			boatMap = (LinkedHashMap<String, List<Boat>>) session
					.getAttribute("boatMap");
			vendorList = (List<Vendor>) session.getAttribute("VendorList");
			
			vendorBoat = boatMap.get(vendorSelectid);
			
			
		} else {

			boatMap = home.getAllBoats();
			vendorList = master.getAllVendors(true);
			session.setAttribute("boatMap", boatMap);
			session.setAttribute("VendorList", vendorList);
		}

		//out.println(tableMap.toString());
	%>
	<script>
	var boatMapjs = <%=boatMap %>;
	alert(boatMapjs);
	
	
	</script>
	<table align="center" width="<%=tablesPerRow * 10%>%" border="1"
		cellpadding="20" cellspacing="20">
		
		<input type="hidden" name="reload" value="<%=vendorSelectid %>"> 
		<input type="text" name="reload1" value="<%=boatMap %>">
		<input type="text" name="reload2" value="<%=vendorList %>"> 
		<tr>
			<th>Boat Seller Name</th>
			<th>Boat No</th>			
		</tr>
		<tr>
			<td><select onChange="reloadpage()" name="vendorSelectid">
				<option value="-1"> Select Boat Vendor</option>
					<%
						for (Vendor vendor : vendorList) {
					%>

					<option value="<%=vendor.getVendorId()%>" <%= (vendor.getVendorId().toString().equalsIgnoreCase(vendorSelectid))?"selected":"" %>><%=vendor.getVendorName()%></option>
					<%
						}
					%>
			</select></td>
			<td><select name="boatSelectid">
				<option value="-1"> Select Boat </option>
					<%
						for (Boat boat : vendorBoat) {
					%>

					<option value=<%=boat.getBoatId()%>><%=boat.getBoatName()%></option>
					<%
						}
					%>
			</select></td>
			<td></td>
		</tr>
	</table>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


	<!-- <h1 align="center">Table Status<div style="float: right;border: 1px;">Text</div></h1> -->
	<script src="<%=contextPath%>/resources/js/materialize.js"
		type="text/javascript"></script>
	<script src="<%=contextPath%>/resources/js/boat.js"
		type="text/javascript"></script>
</form>
</body>
<%@ include file="/pages/common/footer.jsp"%>
</html>
