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
if(action.equals("saveOrder")){
	String data = Utils.getString(request.getParameter("data"));
	Order order = new Order();
	
	Integer returnValue = order.saveOrder(data);
}


out.println(request.getParameter("menuData"));

/* String page1 = Utils.getString(request.getParameter("page1"));
System.out.println("page1===>" + page1);
if(page1.equals("InactiveRecord")){
	String monId = Utils.getString(request.getParameter(Constants.MONITOR_ID));
	String userId = Utils.getString(session.getAttribute(Constants.USER_ID));
	System.out.println("userId==>" + userId + "==" + monId);
	
	if(!monId.equals("") && !userId.equals("")){
		LinkedHashMap<String, String> paramMap = new LinkedHashMap<String, String>();
		paramMap.put(Constants.MONITOR_ID, monId);
		paramMap.put(Constants.USER_ID, userId);
		Reports reports = new Reports();
		Integer success = reports.inactiveRecord(paramMap);
		out.println(success);		
	}else{
		out.println("-1");
	} 
	}*/
	
	out.println("1");

%>