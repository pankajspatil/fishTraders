<%@page import="com.org.fishtraders.transfer.Boat"%>
<%@page import="com.org.fishtraders.transfer.Vendor"%>
<%@page import="com.org.fishtraders.master.Master"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<%@ include file="/pages/common/validateSession.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%

Master master = new Master();

Integer vendorId = Utils.getInt(request.getParameter("vendorId"));
Integer boatId = Utils.getInt(request.getParameter("boatId"));
String page1 = Utils.getString(request.getParameter("page1"));
String userId = session.getAttribute(Constants.USER_ID).toString();
List<Vendor> vendorList = master.getAllVendors(false, 0);

Vendor vendor = null;
Boat boat = null;
String boatName = "";
Boolean active = false;
String submitText = boatId == 0 ? "ADD" : "UPDATE";

if(page1.equals("") && boatId != 0){
	
	List<Boat> boatList = master.getAllBoats(false, boatId, 0);
	
	if(boatList.size() > 0){
		boat = boatList.get(0);
		
		boatName = Utils.getString(boat.getBoatName());
		vendorId = Utils.getInt(boat.getVendor().getVendorId());
		active = boat.getIsActive();
	}
	
	//System.out.println("Active iN Update===>" + mainMenu.isActive());
	
}else{
	
	String message = "Record Added Successfully.";
	
	boatName = Utils.getString(request.getParameter("boatName"));
	vendorId = Utils.getInt(request.getParameter("vendorId"));
	active = Boolean.parseBoolean(Utils.getString(request.getParameter("active")));
	
	//System.out.println("Active==>" + Utils.getString(request.getParameter("active")));
	
	vendor = new Vendor();
	vendor.setVendorId(vendorId);
	
	boat = new Boat();
	boat.setBoatId(boatId);
	boat.setBoatName(boatName);
	boat.setIsActive(active);
	boat.setCreatedBy(Utils.getInt(userId));
	boat.setVendor(vendor);
	
	if(page1.equals("ADD")){
		master.insertBoat(boat);	
	}else if(page1.equals("UPDATE")){
		master.updateBoat(boat);
		message = "Record Updated Successfully.";
	}
	if(!page1.equals("")){
		
	%>
	<script type="text/javascript">
	Lobibox.alert("success",{
		msg : '<%=message%>',
		beforeClose: function(lobibox){
        	parent.location.reload();
        }
	});
	</script>
	<%
	}
}

%>
<center>
<h1>New Boat</h1>
<form name="boatForm" id="boatForm" method="post" action="">
	<table border="1" width="50%" style="border: 0px solid;">
		<tr>
			<th class="headerTR">Boat Name</th>
			<td align="center"><input type="text" name="boatName" id="boatName" value="<%=boatName%>" class="fullRowElement"> </td>
		</tr>
		<tr>
			<th class="headerTR">Vendor</th>
			<td>
				<select id="vendorId" name="vendorId" class="fullRowElement">
					<option value="-1">Please Select</option>
				<%String selected = "";
				for(Vendor vendorMain : vendorList){
					selected = "";
					if(vendorMain.getVendorId() == vendorId){
						selected = "selected";
					}
					%><option <%=selected %> value="<%=vendorMain.getVendorId()%>"><%=vendorMain.getVendorName() %></option><%
				}%>
				</select>
		</tr>
		<tr>
			<th class="headerTR">Active</th>
			<td>
			<%String activeSelected = "";
				
			if(active){
				activeSelected = "checked=checked";
			}
			
				
			%>
			<input class="fullRowElement" style="width: 10%" type="checkbox" value="true" name="active" id="active" <%=activeSelected %>></td>
		</tr>
		<tr>
			<th colspan="2" align="center"><input type="submit" name="page1" value="<%=submitText %>" class="btn btn-main btn-2g" onclick="return validateBoatForm()"></th>
		</tr>
	</table>
	<input type="hidden" name="boatId" id="boatId" value="<%=boatId%>">
</form>
</center>
<script type="text/javascript">
var oldBoatName = '<%=boatName.equals("") ? "" :  boatName%>';
</script>
<script src="<%=contextPath%>/resources/js/masters.js" type="text/javascript"></script>
</body>
</html>