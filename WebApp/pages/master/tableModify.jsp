<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.org.agritadka.home.Home"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new Tables</title>
</head>
<body>
	<%
		String operation = request.getParameter("operation");
		String pageEdit = request.getParameter("pageEdit");
		String tableName,tableType;
		
		
		int tableMasterId = Integer.parseInt(request.getParameter("tableMasterId"));
		tableName = request.getParameter("tableName");
		tableType = request.getParameter("tableType");
		int active = Integer.parseInt(request.getParameter("active"));
		
		
		if (pageEdit!= null && pageEdit.equals("true")){
			
			Home home = new Home();
			home.updateTable(tableMasterId,tableName,active);
			response.sendRedirect("/AgriTadka/pages/master/tableMaster.jsp");
		}else{
		
		
		
	%>

	<form action="tableModify.jsp" method="post">
		<table align="center" border="1" cellpadding="20" cellspacing="20">
			<tr>
			<input type="hidden" name="pageEdit" value="true"/>
				<td>Table Id</td>
				<td><%=tableMasterId %>
				<Input type="hidden" name="tableMasterId"	value="<%=tableMasterId %>"></td>
			</tr>
			<tr>
				<td>Table name</td>
				<td><Input type="text" name="tableName"
					value="<%=tableName %>" /></td>
			</tr>
			<tr>
				<td>Table Type</td>
				<td><%=tableType %></td>
			</tr>
			<tr>
				<td>Table Status</td>
				<td><select name="active">
						<option value="1" <%=((tableType.equals("0"))?"selected":"") %>>Active</option>
						<option value="0" <%=((tableType.equals("1"))?"selected":"")%>>Non
							Active</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="update"></td>
			</tr>
		</table>
	</form>
	<% }%>
</body>
</html>