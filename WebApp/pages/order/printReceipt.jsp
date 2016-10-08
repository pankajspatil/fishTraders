<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/AgriTadka/resources/css/print.css" media="print">
</head>
<body>
<table width="100%">
	<tr>
		<td>Name</td>
		<td>Qty.</td>
		<td>Price</td>
	</tr>
	<tr>
		<td>Chicken Biryani Hydrabadi Kabab</td>
		<td>100</td>
		<td>9999.99</td>
	</tr>
</table>
<script type="text/javascript">
var w = window.print();
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