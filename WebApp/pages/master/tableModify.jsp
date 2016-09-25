<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new Tables</title>
</head>
<body>
	<%
String tableMasterId = request.getParameter("tableMasterId");
String tableName = request.getParameter("tableName");
String tableType = request.getParameter("tableType");
String active = request.getParameter("active");

out.println(tableMasterId);
%>

	<form action="" method="post">
		<table align="center" border="1" cellpadding="20" cellspacing="20">
			<tr>
				<td>Table Id</td>
				<td><%=tableMasterId %></td>
			</tr>
			<tr>
				<td>Table name</td>
				<td><Input type="text" name="tableName<%=tableMasterId %>"
					value="<%=tableName %>" /></td>
			</tr>
			<tr>
				<td>Table Type</td>
				<td><%=tableType %></td>
			</tr>
			<tr>
				<td>Table Status</td>
				<td><select>
						<option value="0" <%=((tableType.equals("0"))?"selected":"") %>>Active</option>
						<option value="1" <%=((tableType.equals("1"))?"selected":"")%>>Non
							Active</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="update"></td>
			</tr>
		</table>
	</form>
</body>
</html>