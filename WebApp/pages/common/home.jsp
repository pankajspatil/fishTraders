<%@page import="com.org.agritadka.transfer.Table"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.org.agritadka.home.Home"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="/pages/common/header.jsp"%>
    <%@ include file="/pages/common/validateSession.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/css/home.css">
</head>
<body>
	<table width="100%" align="center">
		<tr>
			<td width="33.33%">&nbsp;</td>
			<td width="33.33%" align="center"><h1>Table Status</h1></td>
			<td width="33.33%" align="right"><div
					style="border: 2px solid black; width: 50%; text-align: right;">
					<div>Vacant</div>
					<div>Reserved</div>
					<div>Occupied</div>
				</div></td>
		</tr>
	</table>
	<%
int tablesPerRow = 5;
Home home = new Home();
LinkedHashMap<Integer, List<Table>> tableMap = home.getTables();
//out.println(tableMap.toString());

if(tableMap.size() > 0){
	for(Integer tableTypeId : tableMap.keySet()){
		%>
		<table width="100%" align="center">
			<tr>
				<td width="33.33%">&nbsp;</td>
				<td width="33.33%" align="center"><h3><%=tableTypeId %></h3></td>
				<td width="33.33%" align="right"></td>
			</tr>
		</table>
		<%
		List<Table> tableList = tableMap.get(tableTypeId);
		if(tableList.size() > 0){
			%><table align="center" width="<%=tablesPerRow * 10 %>%" border="1" cellpadding="20"
			cellspacing="20">
			<tr class="homeTable">
			<%
			int count = tablesPerRow;
			for(Table table : tableList){
				%><td><b onclick="location.href='/AgriTadka/pages/order/orderPlacement.jsp'" ><%=table.getTableName()%></b></td><%
				count --;
				if(count == 0){
					%></tr><tr class="homeTable"><%
					count = tablesPerRow;
				}
			}
			
			%>

			
		</tr>

	</table>

	<%
		}
	}
}

%>

<!-- <h1 align="center">Table Status<div style="float: right;border: 1px;">Text</div></h1> -->

</body>
<%@ include file="/pages/common/footer.jsp" %>
</html>