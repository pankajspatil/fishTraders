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
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/css/home.css">
</head>

<body>
<form action="">
	<%
		int tablesPerRow = 5;
		Home home = new Home();
		LinkedHashMap<Integer, List<Table>> tableMap = home.getTables();

		for (Integer tableTypeId : tableMap.keySet()) {
	%>
	<table width="100%" align="center">
		<tr>
			<td width="33.33%">&nbsp;</td>
			<td width="33.33%" align="center"><h3><%=tableTypeId%></h3></td>
			<td width="33.33%" align="right"></td>
		</tr>
	</table>
	<%
		List<Table> tableList = tableMap.get(tableTypeId);
			if (tableList.size() > 0) {
	%><table align="center" width="<%=tablesPerRow * 10%>%" border="1"
		cellpadding="20" cellspacing="20">
		
			<%
				int count = tablesPerRow;
			for (Table table : tableList) {
				
			%><tr><td><%=table.getTableName()%></td>
			<td><%=table.getTableType() %></td>
			<td><select name="tableActive<%=table.getTableId() %>">
			<option value="1" <%if(table.getIsActive().equals("1")) out.println("selected"); %>>Active</option>
			<option value="0" <%if(table.getIsActive().equals("0")) out.println("selected"); %>>InActive</option> 
			</select>
			</td>
			</tr>
			<%
				}
			%>	

	</table>
	<%
		}// end of if
		}// end of for
	%>
</form>
</body>
</html>