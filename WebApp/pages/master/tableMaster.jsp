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
<script type="text/javascript"
	src="<%=contextPath%>/resources/js/search.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#appointmentData').DataTable({
			"aoColumnDefs" : [ {
				"bSortable" : false,
				"aTargets" : [ 0 ]
			} ],
			"order" : [ [ 1, "asc" ] ]
		});
	});
</script>

</head>

<body>
<form action="">
<br><br>
	<table align="center" border="1"
		cellpadding="20" cellspacing="20" id="appointmentData" class="display">
		<thead>
			<tr class="mainTR">
				<th>Table No</th>
				<th>Table Section</th>
				<th>Status</th>
				<th>Operation</th>
			</tr>
		</thead>
			<%
				Home home = new Home();
				LinkedHashMap<String, List<Table>> tableMap = home.getTables();

				for (String tableType : tableMap.keySet()) {
					List<Table> tableList = tableMap.get(tableType);
					if (tableList.size() > 0) {
				for (Table table : tableList) {
			%><tr>
				<td><%=table.getTableName()%></td>
				<td><%=table.getTableType()%></td>
				<td><%= (table.getIsActive()==1)?"Active":"InActive"%></td>
				<td><input type="button" value="Edit" onclick="openPage('edit',<%=table.getTableId() %>)"/></td>
			</tr>
			<%
				}
					}// end of if
				}// end of for
			%>
		</table>
	
</form>
</body>
</html>