<%@page import="com.org.fishtraders.transfer.Waiter"%>
<%@page import="com.org.fishtraders.transfer.OrderMenu"%>
<%@page import="com.org.fishtraders.transfer.OrderData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.fishtraders.transfer.MenuMapper"%>
<%@page import="java.util.List"%>
<%@page import="com.org.fishtraders.transfer.MainMenu"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.org.fishtraders.order.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
    <%@ include file="/pages/common/validateSession.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/FishTrader/resources/css/order.css" rel="stylesheet" type="text/css">
<!-- <link href="/FishTrader/resources/css/demo.css" rel="stylesheet" type="text/css"> -->
<style>
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 5px 10px;
  }
  </style>
</head>
<body>
<%

//System.out.println("OrderId" + request.getParameter("orderId"));

Integer tableId = request.getParameter("tableId") == null ? null :  Integer.parseInt(request.getParameter("tableId"));
String tableName = Utils.getString(request.getParameter("tableName"));
String userId = Utils.getString(session.getAttribute(Constants.USER_ID));

Float subTotal = new Float(0);

%>
<table>
<tr>
<td></td>
</tr>

</table>



<script type="text/javascript" src="<%=contextPath%>/resources/js/order.js"></script>

<!-- <div style="border: 1px solid black; width: 50%; height: 200px;display: inline-block;">Div1</div>
<div style="border: 1px solid black;;margin-left: 52%; height: 200px;display: inline-block;">Div2</div> -->

</body>
</html>