<%@page import="com.org.fishtraders.generic.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<% String Contextpath = request.getContextPath();
    	ArrayList<String> menulist = session.getAttribute("menu") != null ? (ArrayList<String>) session.getAttribute("menu") : new ArrayList<String>();
    	
    	//System.out.println("menulist===>" + menulist);
	%>
<body>
	<input type="hidden" id="contextPath"
		value="<%=request.getContextPath()%>" />
	<div id='cssmenu'>
		<ul>
			<%
				if (menulist.contains("Home")) {
			%>
			<li><a
				href='<%=request.getContextPath()%>/pages/common/home.jsp'><span>Home</span></a>
			</li>
			<%}%>
			<%
				if (menulist.contains("Order")) {
			%>
			<li><a
				href='<%=request.getContextPath()%>/pages/order/orderDashboard.jsp'><span>Order</span></a>
			</li>
			<%
				}
			%>
			<%
				if (menulist.contains("Master")) {
			%>
			<li class='has-sub'><a href='#'><span>Master</span></a>
				<ul>
					<li class='first-child'><a
						href='<%=request.getContextPath()%>/pages/master/addVendor.jsp'><span>Vendor
								Master</span></a></li>
					<li class='first-child'><a
								href='<%=request.getContextPath()%>/pages/master/addBoat.jsp'><span>Boat Master</span></a></li>
					<li class='first-child'><a
								href='<%=request.getContextPath()%>/pages/master/addFish.jsp'><span>Fish Master</span></a></li>
				</ul>
			</li>
			<% } 
			if (menulist.contains("Transaction")) {%>
		<li class='has-sub'><a href='#'><span>Transaction</span></a>
			<ul>
				<li class='first-child'><a
					href='<%=request.getContextPath()%>/pages/transaction/addExpense.jsp'><span>Expense</span></a>
				</li>
				<li><a
					href='<%=request.getContextPath()%>/pages/transaction/addVendorInvoice.jsp'><span>Vendor Invoice</span></a></li>
				<li><a
					href='<%=request.getContextPath()%>/pages/transaction/addCustomerInvoice.jsp'><span>Customer Invoice</span></a></li>
			</ul></li>
			<% } 
				if (menulist.contains("Reports")) {
			%>
			<li class='has-sub'><a href='#'><span>Reports</span></a>
				<ul>
					<li class='first-child'><a
						href='<%=request.getContextPath()%>/pages/reports/orderRevenue.jsp'><span>Revenue</span></a>
					</li>
					<li><a
						href='<%=request.getContextPath()%>/pages/reports/orderStatus.jsp'><span>Order
								Status</span></a></li>
				</ul></li>
			<% } %>
			
			<li style="float: right; padding-right: 10px;"><a href='#'><span>Account</span></a>
				<ul>
					<li><a
						href='<%=request.getContextPath()%>/pages/login/changePassword.jsp'>Change
							Password</a></li>
					<%
						if (session.getAttribute(Constants.USER_ID) != null) {
					%><li onclick="logout()"><a href='#'><span>Logout</span></a></li>
					<%
						}
					%>
				</ul></li>

		</ul>
	</div>
</body>
</html>