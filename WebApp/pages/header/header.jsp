<%@page import="com.org.agritadka.generic.Utils"%>
<%@page import="com.org.agritadka.generic.Constants"%>
<%@page import="com.org.agritadka.generic.ConnectionsUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Resource Management</title>

<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/generic.css">
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/lobibox.css">
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/jquery-ui.structure.css"></link>
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/jquery.dataTables.min.css"></link>
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/jquery.fancybox.css?v=2.1.5"></link>
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/font-awesome.min.css"></link>
<link rel="stylesheet" type="text/css" href="/ResourcePlan/resources/css/buttons.dataTables.min.css"></link>
<link rel="stylesheet" href="/ResourcePlan/resources/css/multiple-select.css">



<script type="text/javascript" src="/ResourcePlan/resources/js/jquery-latest.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/jquery.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/jquery-ui.js"></script>

<script type="text/javascript" src="/ResourcePlan/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/jszip.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/pdfmake.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/vfs_fonts.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/buttons.print.min.js"></script>
 
<script type="text/javascript" src="/ResourcePlan/resources/js/Map.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/constants.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/general.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/lobibox.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/menu.js"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/jquery.fancybox.pack.js?v=2.1.5"></script>
<script type="text/javascript" src="/ResourcePlan/resources/js/multiple-select.js"></script>





</head>
<body>
<table class="headerTable">
<tr>
<td class="headercol"> 
<div id="header">
<h1>Project Resource Management</h1>
</div>
</td>
</tr>
</table> 



<%//out.println("==>" + session.getAttribute(Constants.USER_ID) + "==>" + Utils.getString(request.getParameter("menuRequired")));
//out.println("==" + Utils.getString(request.getParameter("menuRequired")).equals("false"));
if(session.getAttribute(Constants.USER_ID) != null && !Utils.getString(request.getParameter("menuRequired")).equals("false")){
	%><%@ include file="/pages/header/menu.jsp"%><%
}
%>
<%ConnectionsUtil connectionsUtil = new ConnectionsUtil(); %>
 
 
 
</body>

</html>