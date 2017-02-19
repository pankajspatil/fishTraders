<%@page import="com.org.fishtraders.transfer.Customer"%>
<%@page import="com.org.fishtraders.master.Master"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/validateSession.jsp"%>
<%@ include file="/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<form action="" name="f1" id="f1" method="post">
<h1 class="moduleHeader" style="text-align: center;"> ADD CUSTOMER</h1>
		
		<div style="float: right; padding-right: 11%">
			<input type="button" class="btn btn-main btn-2g" name="newCustomer" id="newCustomer" 
			value="New Customer" onclick="openCustomerFancyBox(0, 'newCustomer', this)" style="width: 165px">
		</div>
		<table border="1" id="customerData" class="mainTable" width="100%">
				<thead>
					<tr class="headerTR">
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Phone</th>
						<th>DOB</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
		<%
	Master master = new Master();
	Integer searchKey = -1;
	String searchValue = request.getParameter("searchValue");
	List<Customer> customerList = master.searchCustomer(searchKey, searchValue);
	if(customerList.size() != 0){
		for(Customer customer : customerList){
			%><tr align="center">
			<td><%=customer.getFirstName() %></td>
			<td><%=customer.getMiddleName() %></td>
			<td><%=customer.getLastName() %></td>
			<td><%=customer.getContactNo() %></td>
			<td><%=customer.getDob() %></td>
			<td>
			
			<img align="middle" height="22%" src="<%=contextPath %>/resources/images/edit.png" 
									id="editCustomer_<%=customer.getCustomerId()%>" name="editCustomer" 
									onclick="openCustomerFancyBox(<%=customer.getCustomerId()%>, 'updateCustomer', this)">
			</td>
		</tr><%}
	}	
	%></tbody>
				
			</table><%
%>

</form>
<script type="text/javascript" src="<%=contextPath%>/resources/js/masters.js"></script>
</body>
</html>