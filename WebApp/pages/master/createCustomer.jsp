<%@page import="com.org.fishtraders.transfer.Customer"%>
<%@page import="com.org.fishtraders.master.Master"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.jdbc.Util"%>
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
<%
String firstName = Utils.getString(request.getParameter("firstName"));
String middleName = Utils.getString(request.getParameter("middleName"));
String lastName = Utils.getString(request.getParameter("lastName"));
String gender = Utils.getString(request.getParameter("gender"));
String dob = Utils.getString(request.getParameter("dob"));
String contact = Utils.getString(request.getParameter("contact"));
String email = Utils.getString(request.getParameter("email"));
String address = Utils.getString(request.getParameter("address"));
Integer userId = Utils.getInt(session.getAttribute(Constants.USER_ID));
Integer customerId = Utils.getInt(request.getParameter("customerId"));
Boolean isActive = Boolean.parseBoolean(Utils.getString(request.getParameter("isActive")));

String page1 = Utils.getString(request.getParameter("page1"));

//System.out.println("page1==>" + page1 + "patientId==>" + patientId);

String btnText = "add";

Master master = new Master();
Customer customer = new Customer();

if(customerId != 0 && page1.equals("")){
	List<Customer> customerList = master.searchCustomer(Constants.SINGLE_PATIENT, customerId.toString());
	if(customerList.size() > 0){
		customer = customerList.get(0);
		
		firstName = customer.getFirstName();
		middleName = customer.getMiddleName();
		lastName = customer.getLastName();
		dob = customer.getDob();
		gender = customer.getSex();
		contact = customer.getContactNo();
		email = customer.getEmail();
		address = customer.getAddress();
		isActive = customer.getIsActive();
		
		//System.out.println("Before==>" + customer);
		
		btnText = "update";
	}
}

if(!page1.equals("")){
	
	customer.setCustomerId(customerId);
	customer.setFirstName(firstName);
	customer.setMiddleName(middleName);
	customer.setLastName(lastName);
	customer.setDob(dob);
	customer.setSex(gender);
	customer.setContactNo(contact);
	customer.setEmail(email);
	customer.setAddress(address);
	customer.setCreatedBy(userId);
	customer.setIsActive(isActive);
	
	master.createUpdateCustomer(customer);
	%><script type="text/javascript">
	var msg = "Record added successfully.";
	var customerId = <%=customerId%>;
	console.log("customerId==>" + customerId);
	
	if(customerId !== '' && customerId !== 0){
		msg = "Record updated successfully.";
	}
	
	Lobibox.alert("success",{
		msg : msg,
		beforeClose: function(lobibox){
        	parent.location.reload();
        }
	});
	</script><%
}

String[][] genderArray = new String[3][2];

genderArray[0][0] = "M";
genderArray[0][1] = "Male";

genderArray[1][0] = "F";
genderArray[1][1] = "Female";

genderArray[2][0] = "O";
genderArray[2][1] = "Others";

%>

<form name="createPatient" id="createPatient" method="post">
<h1 align="center">New Customer</h1>
<table class="mainTable" align="center" width="60%" border="1" style="border: 0px solid">

	<tr>
		<th class="headerTR required">First Name</th>
		<td><input type="text" name="firstName" id="firstName" value="<%=firstName %>" autocomplete="off" class="fullRowElement"> </td>
	</tr>
	<tr>
		<th class="headerTR">Middle Name</th>
		<td><input type="text" name="middleName" id="middleName" value="<%=middleName %>" autocomplete="off" class="fullRowElement"> </td>
	</tr>
	<tr>
		<th class="headerTR required">Last Name</th>
		<td><input type="text" name="lastName" id="lastName" value="<%=lastName %>" autocomplete="off" class="fullRowElement"> </td>
	</tr>
	<tr>
		<th class="headerTR required">Gender</th>
		<td>
			<select name="gender" id="gender" class="fullRowElement">
				<option value="-1">Please Select</option>
				<%
				String selected = "";
				for(String[] genders : genderArray){
					selected = "";
					if(genders[0].equals(gender)){
						selected = "selected";
					}
					%><option <%=selected %> value="<%=genders[0]%>"><%=genders[1]%></option><%
				}%>
				<!-- <option value="M">Male</option>
				<option value="F">Female</option>
				<option value="O">Others</option> -->
			</select>
		</td>
	</tr>
	<tr>
		<th class="headerTR required">DOB</th>
		<td><input type="text" name="dob" id="dob" value="<%=dob %>" autocomplete="off" class="fullRowElement"> </td>
	</tr>
	<tr>
		<th class="headerTR required">Contact</th>
		<td><input type="text" name="contact" id="contact" value="<%=contact %>" autocomplete="off" class="fullRowElement"> </td>
	</tr>
	<tr>
		<th class="headerTR">Email</th>
		<td><input type="text" name="email" id="email" value="<%=email %>" autocomplete="off" class="fullRowElement"> </td>
	</tr>
	<tr>
		<th class="headerTR required">Address</th>
		<td>
			<textarea rows="4" cols="" name="address" id="address" class="fullRowElement"><%=address %></textarea>
		</td>
	</tr>
	<tr>
		<th class="headerTR">Active</th>
		<td>
			<input type="checkbox" name="isActive" id="isActive" value="true" <%=isActive ? "checked=checked" : "" %>
			autocomplete="off" class="fullRowElement" style="width: 10%">
		</td>
	</tr>
	<tr style="border: none;">
		<td colspan="2" class="searchBtn" align="center">
			<input type="submit" name="page1" id="customerBtn" value="<%=btnText %>" class="btn btn-main btn-2g" onclick="return validateCustomerForm()" />
		</td>
	</tr>
</table>
<input type="hidden" name="customerId" id="customerId" value="<%=customerId %>" />
</form>
<% Gson gson = new Gson(); %>
<script type="text/javascript" src="<%=contextPath%>/resources/js/masters.js"></script>
<script type="text/javascript">
var customerObj = <%=gson.toJson(customer)%>;
</script>
</body>
</html>