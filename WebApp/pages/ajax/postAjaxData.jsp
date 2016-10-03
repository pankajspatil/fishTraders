<%@page import="com.org.agritadka.transfer.Cooking"%>
<%@page import="java.util.List"%>
<%@page import="com.org.agritadka.generic.Constants"%>
<%@page import="com.org.agritadka.order.Order"%>
<%@page import="com.org.agritadka.generic.Utils"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.util.LinkedHashMap"%>

<%
response.setCharacterEncoding("UTF-8");

String action = Utils.getString(request.getParameter("action"));
String userId = Utils.getString(session.getAttribute(Constants.USER_ID));
String data = Utils.getString(request.getParameter("data"));

Order order = new Order();

if(action.equals("saveOrder")){
	try{
		String returnValue = order.saveOrder(data, userId);
		out.println(returnValue);
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("error");
	}
	
}else if(action.equals("fetchCookingData")){
	
	try{
		List<Cooking> returnList = order.getOrderedMenus(data);
		Gson gson = new Gson();
		
		String returnValue = gson.toJson(returnList);
		out.println(returnValue);
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("error");
	}
	
}
else if(action.equals("updateCookingStatus")){
	try{
		Integer returnValue = order.updateCookingStatus(data);
		out.println(returnValue);
		
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("1");
	}
	
}else if(action.equals("checkoutOrder")){
	try{
		Integer returnValue = order.checkoutOrder(data);
		out.println(returnValue);
		
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("1");
	}
	
}else if(action.equals("checkIfMenuProcessed")){
	try{
		Integer returnValue = order.checkIfMenuProcessed(data);
		out.println(returnValue);
		
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("1");
	}
	
}else if(action.equals("deleteRecord")){
	try{
		Integer returnValue = order.deleteRecord(data);
		out.println(returnValue);
		
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("1");
	}
	
}else if(action.equals("cancelOrder")){
	try{
		Integer returnValue = order.cancelRecord(data);
		out.println(returnValue);
		
	}catch(Exception ex){
		ex.printStackTrace();
		out.println("1");
	}
	
}
%>