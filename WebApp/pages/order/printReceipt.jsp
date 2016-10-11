<%@page import="com.org.agritadka.generic.Utils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" type="text/css" href="/AgriTadka/resources/css/print.css" media="print"> -->
<style type="text/css" media="print">
@page {
    size: auto;   /* auto is the initial value */
    margin: 0;  /* this affects the margin in the printer settings */
}
</style>

</head>
<body>
<%
String orderId = Utils.getString(request.getParameter("orderId"));
//out.println("orderId" + orderId);

%>

<table width="100%">
	<tr>
		<td align="center"><h1>Agri Tadka</h1></td>
	</tr>
	<tr style="font-weight: bold;">
		<td>
			Opp. Jivadani Krupa Auto Work, Near St. Peter College,<br> Diwanman, Dongari Road, Vasai(W)
			<div style="float: right;">Mobile : 8007778851 / 52</div>
		</td> 
	</tr>
	<tr><td><hr width="100%"></td></tr>
</table>
<table width="100%">
	<tr>
		<td width="60%"><b>Order No : </b>1</td>
		<td><b>Date : </b>2016-10-11 12:53:57</td>
	</tr>
	<tr>
		<td width="60%"><b>Cust Name : </b>Kiran Vijay Kadav</td>
		<td><b>Cust Mobile : </b>09773102909</td>
	</tr>
</table>
<table width="100%" border="0" style="border-collapse: collapse;" cellpadding="0" cellspacing="">
	<tr style="background-color: #D3D3D3; -webkit-print-color-adjust: exact;">
		<td><b>Item</b></td>
		<td><b>Qty.</b></td>
		<td><b>Unit Price</b></td>
		<td><b>Amount</b></td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
		<td>9999.99</td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
		<td>9999.99</td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
		<td>9999.99</td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
		<td>9999.99</td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
		<td>9999.99</td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
		<td>9999.99</td>
	</tr>
	<tr>
		<td colspan="4" align="center"><h3>Thanks For Visiting!!!</h3></td>
	</tr>
</table>
<script type="text/javascript">
//var w = window.print();
//debugger;
//this.close();

window.onbeforeprint = function() {
    alert('This will be called before the user prints.');
};
window.onafterprint = function() {
	alert('This will be called after the user prints');   
};
</script>
</body>
</html>