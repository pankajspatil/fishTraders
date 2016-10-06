<%@page import="com.org.agritadka.generic.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div id='cssmenu'>
<ul>
   <li><a href='<%=request.getContextPath()%>/pages/common/home.jsp'><span>Home</span></a></li>
   <li>
   		<a href='#'><span>Order</span></a>
	 	<ul>
	 	<li class='first-child' onclick="openOrderPage()"><a href='<%=request.getContextPath()%>/pages/order/orderPlacement.jsp'><span>Parcel</span></a></li>
	 	<li class='has-sub'><a href='#'><span>Dashboard</span></a>
            <ul>
            <li class='first-child'><a href='<%=request.getContextPath()%>/pages/order/cookingDashboard.jsp'><span>Cooking</span></a></li>
   			<li><a href='<%=request.getContextPath()%>/pages/order/orderDashboard.jsp'><span>Order</span></a></li>
                        
        </ul>
   		</li>
	</ul>
	</li>
	<li>
		<a href='#'><span>Master</span></a>
		<ul>
		<li class='first-child'><a href='<%=request.getContextPath()%>/pages/master/tableMaster.jsp'><span>Table Master</span></a></li>
		</ul>
	</li>
	<li style="float: right;padding-right: 10px;">
		<a href='#'><span>Account</span></a>
		<ul>
			<li><a href='<%=request.getContextPath()%>/pages/login/changePassword.jsp'>Change Password</a></li>
			<%if(session.getAttribute(Constants.USER_ID) != null){
		%><li onclick="logout()">
			<a href='#'><span>Logout</span></a>
			</li><%}%>
		</ul>
	</li>
	</ul>
</div>
</body>
</html>