<%@page import="com.org.fishtrader.transfer.Boat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.org.fishtrader.home.Home"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="/pages/common/header.jsp"%>
    <%@ include file="/pages/common/validateSession.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/materialize.css"> 
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
LinkedHashMap<String, List<Boat>> tableMap = home.getAllBoats();
//out.println(tableMap.toString());

if(tableMap.size() > 0){
	for(String tableType : tableMap.keySet()){
		%>
		<table width="100%" align="center">
			<tr>
				<td width="33.33%">&nbsp;</td>
				<td width="33.33%" align="center"><h3><%=tableType %></h3></td>
				<td width="33.33%" align="right"></td>
			</tr>
		</table>
		<%
		List<Boat> boatList = tableMap.get(tableType);
		if(boatList.size() > 0){
			%><table align="center" width="<%=tablesPerRow * 10 %>%" border="1" cellpadding="20"
			cellspacing="20">
			<tr>
			<%
			int count = tablesPerRow;
			for(Boat boat : boatList){
				%><td align="center" >
						<b><%=boat.getBoatName()%></b>
					</td><%
				count --;
				if(count == 0){
					%></tr><tr class="homeTable"><%
					count = tablesPerRow;
				}
			}
			%>
		</tr>
<!-- 		<tr><td><a class="waves-effect waves-red btn">button</a></td></tr>
 -->
	</table>

	<%
		}
	}
}

%>

<!-- <h1 align="center">Table Status<div style="float: right;border: 1px;">Text</div></h1> -->
<script src="<%=contextPath%>/resources/js/materialize.js" type="text/javascript"></script>
<script src="/AgriTadka/resources/js/order.js" type="text/javascript"></script>
</body>
<%@ include file="/pages/common/footer.jsp" %>
</html>
