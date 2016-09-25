<%@page import="com.org.agritadka.transfer.OrderMenu"%>
<%@page import="com.org.agritadka.transfer.OrderData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.org.agritadka.transfer.MenuMapper"%>
<%@page import="java.util.List"%>
<%@page import="com.org.agritadka.transfer.MainMenu"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.org.agritadka.order.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/pages/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/AgriTadka/resources/css/order.css" rel="stylesheet" type="text/css">
<!-- <link href="/AgriTadka/resources/css/demo.css" rel="stylesheet" type="text/css"> -->
<script src="/AgriTadka/resources/js/order.js" type="text/javascript"></script>

</head>
<body>
<%

Integer tableId = Integer.parseInt(Utils.getString(request.getParameter("tableId")));
String tableName = Utils.getString(request.getParameter("tableName"));
String userId = Utils.getString(session.getAttribute(Constants.USER_ID));

Order order = new Order();
OrderData orderData = order.getOrderData(tableId, userId);
LinkedHashMap<MainMenu, List<MenuMapper>> menuMap = order.getMenus();

%>


<table width="99.5%" border="0" align="center">
	<tr>
		<td>
			<table width="100%" border="1">
				<tr align="center">
					<td width="35%" style="border-right: thick;">
						<h1>Order No : <%=orderData.getOrderId() %></h1>
						<input type="hidden" id="orderId" value="<%=orderData.getOrderId()%>">
					</td>
					<td width="32%"><h2>Table : <%=tableName %></h2></td>
					<td width="33%">
						<h2>Waiter :<input type="text"></h2>
						 
					</td>
				</tr>
			</table>
			
		</td>	
	</tr>
	<tr align="left">
		<td width="50%" align="left" valign="top">
			<div class="bwl_acc_container" id="accordion_1" style="width: 98%; 
			height:80%;/* border:1px solid black; */">
    			<div class="accordion_search_container">
        				<input type="text" class="accordion_search_input_box search_icon" value="" placeholder="Search ..."/>
        		</div>

			<div class="search_result_container"></div>
		<%
			//out.println(menuMap.size());
			if(menuMap.size() > 0){
				List<MenuMapper> mappers = new ArrayList();
				for(MainMenu mainMenu : menuMap.keySet()){
					mappers = menuMap.get(mainMenu);
					
					
					%>
					<section>
					<h2 class="acc_title_bar">
						<a href="#"><%=mainMenu.getMainMenuName() %></a>
					</h2>
					<div class="acc_container">
						<div class="block" style="overflow: auto;">
						<%if(mappers.size() > 0){
							%><table width="100%" border="0">
							<%for(MenuMapper mapper : mappers){ %>
								<tr id="<%=mapper.getMainSubMenuId()%>" align="center">
									<td width="80%" align="left" style=""><%=mapper.getSubMenu().getSubMenuName() %></td>
									<td width="20%"><%=mapper.getSubMenu().getUnitPrice() %></td>
									<td width="10%"><input type="button" value="ADD" onclick="addMenuToOrder(this)"></td>
								</tr>
								<%} %>
							</table><%
						}%>
							
						</div>
					</div>
					</section>
					<%
						}
						}
					%>

			
		</div>
			
		</td>
		<td width="50%" style="position: relative;" id="rightCell">
		<div id="divTop">
			<table width="98%;" height="100%" border="0" align="center" id="orderedTable">
				<tr class="headerTR">
					<td>Menu</td>
					<td width="10%" style="border-right: thin;">Quantity</td>
					<td width="15%">Unit Price</td>
					<td width="15%">Total Price</td>
					<td width="5%">Del</td>
				</tr>
				<%if(orderData.getSelectedMenus() != null && orderData.getSelectedMenus().size() > 0){
					for(OrderMenu orderMenu : orderData.getSelectedMenus()){
					%>
					<tr align="center">
						<td align="left">
							<input type="hidden" id="<%=orderMenu.getOrderMenuMapId()%>">
							<%=orderMenu.getSubMenuName() %></td>
						<td><select onChange='updatePrice(this)'>
							<%for(int i=1; i<=30; i++){
								if(i == orderMenu.getQuantity()){
									%><option value="<%=i%>" selected="selected"><%=i%></option><%
								}else{
								%><option value="<%=i%>"><%=i%></option><%
								}
							}%></select>
						</td>
						<td><%=orderMenu.getUnitPrice() %></td>
						<td><%=orderMenu.getFinalPrice() %></td>
						<td><input type='button' value="Del"></input></td>						
					</tr>
					<%
					}
				}
				%>
				<tr>
					<td>
						<!-- <input type="text" style="background:rgba(0,0,0,0); border: none;" readonly="readonly"> -->
						
					</td>
				</tr>
			</table>
			</div>
			<div id="divBottom">
				<table style="float: right;">
					<tr>
					<td>Sub total</td>
					<td>29</td>
				</tr>
				<tr>
					<td><input type="button" value="Save" id="saveOrder"> </td>
					<td><input type="button" value="Cancel"> </td>
					<td><input type="button" value="Checkout"> </td>
				</tr>
				</table>
			</div>	
		</td>
	</tr>
</table>


<script>
$("#accordion_1").bwlAccordion({
	theme:'theme-blue',
	pagination: true,
	limit: 6,
	toggle: true
});
</script>
<!-- <div style="border: 1px solid black; width: 50%; height: 200px;display: inline-block;">Div1</div>
<div style="border: 1px solid black;;margin-left: 52%; height: 200px;display: inline-block;">Div2</div> -->

</body>
</html>