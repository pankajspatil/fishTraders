<%@page import="com.org.fishtraders.transfer.Fish"%>
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

Integer fishId = Utils.getInt(request.getParameter("fishId"));
String page1 = Utils.getString(request.getParameter("page1"));
String userId = session.getAttribute(Constants.USER_ID).toString();

Fish fish = null;
String fishName = "";
Boolean active = false;
String submitText = fishId == 0 ? "ADD" : "UPDATE";

if(page1.equals("") && fishId != 0){
	
	List<Fish> fishList = master.getAllFishes(false, fishId);
	
	if(fishList.size() > 0){
		fish = fishList.get(0);
		
		fishName = Utils.getString(fish.getFishName());
		active = fish.getIsActive();
	}
	
	//System.out.println("Active iN Update===>" + mainMenu.isActive());
	
}else{
	
	String message = "Record Added Successfully.";
	
	fishName = Utils.getString(request.getParameter("fishName"));
	active = Boolean.parseBoolean(Utils.getString(request.getParameter("active")));
	
	//System.out.println("Active==>" + Utils.getString(request.getParameter("active")));
	
	fish = new Fish();
	fish.setFishName(fishName);
	fish.setIsActive(active);
	fish.setFishId(fishId);
	fish.setCreatedBy(Utils.getInt(userId));
	
	if(page1.equals("ADD")){
		master.insertFish(fish);	
	}else if(page1.equals("UPDATE")){
		master.updateFish(fish);
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
<h1>New Fish</h1>
<form name="fishForm" id="fishForm" method="post" action="">
	<table border="1" width="50%" style="border: 0px solid;">
		<tr>
			<th class="headerTR">Fish Name</th>
			<td align="center"><input type="text" name="fishName" id="fishName" value="<%=fishName%>" class="fullRowElement"> </td>
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
			<th colspan="2" align="center"><input type="submit" name="page1" value="<%=submitText %>" class="btn btn-main btn-2g" onclick="return validateFishForm()"></th>
		</tr>
	</table>
	<input type="hidden" name="fishId" id="fishId" value="<%=fishId%>">
</form>
</center>
<script type="text/javascript">
var oldFishName = '<%=fishName.equals("") ? "" :  fishName%>';
</script>
<script src="<%=contextPath%>/resources/js/masters.js" type="text/javascript"></script>
</body>
</html>