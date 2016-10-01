package com.org.agritadka.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.org.agritadka.generic.ConnectionsUtil;
import com.org.agritadka.transfer.Cooking;
import com.org.agritadka.transfer.MainMenu;
import com.org.agritadka.transfer.MenuMapper;
import com.org.agritadka.transfer.OrderData;
import com.org.agritadka.transfer.OrderMenu;
import com.org.agritadka.transfer.SubMenu;

public class Order {

	public LinkedHashMap<MainMenu, List<MenuMapper>> getMenus(String priceType) throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "SELECT ms.main_sub_menu_map_id, m.main_menu_id, s.sub_menu_id, " +
						"m.menu_name as main_menu, s.menu_name as sub_menu, s."+priceType+"_unit_price as unit_price "+
						"FROM agri_tadka.main_sub_menu_map ms "+
						"inner join main_menu_master m on m.main_menu_id = ms.main_menu_id and ms.is_active = 1 and m.is_active = 1 "+
						"inner join sub_menu_master s on s.sub_menu_id = ms.sub_menu_id and s.is_active = 1 order by m.menu_name, s.menu_name";
		ResultSet dataRS = conn.createStatement().executeQuery(query);
		
		Integer mainMenuId, prevId = 0, mainSubMenuId, subMenuId;
		LinkedHashMap<MainMenu, List<MenuMapper>> mainSubMenuMap = new LinkedHashMap<MainMenu, List<MenuMapper>>();
		
		String mainMenuName, subMenuName;
		Float unitPrice = new Float(0);
		MainMenu mainMenuObj, oldObj = null;
		SubMenu subMenuObj;
		MenuMapper menuMapper;
		List<MenuMapper> menus = new ArrayList<MenuMapper>();
		
		while(dataRS.next()){
			
			mainMenuId = dataRS.getInt("main_menu_id");
			mainMenuName = dataRS.getString("main_menu");
			subMenuName = dataRS.getString("sub_menu");
			subMenuId = dataRS.getInt("sub_menu_id");
			mainSubMenuId = dataRS.getInt("main_sub_menu_map_id");
			unitPrice = dataRS.getFloat("unit_price");
			
			if(mainMenuId != prevId && prevId != 0){
				
				mainSubMenuMap.put(oldObj, menus);
				menus = new ArrayList<MenuMapper>();
			}
			
			mainMenuObj = new MainMenu();
			mainMenuObj.setMainMenuId(mainMenuId);
			mainMenuObj.setMainMenuName(mainMenuName);
			
			subMenuObj = new SubMenu();
			subMenuObj.setSubMenuId(subMenuId);
			subMenuObj.setSubMenuName(subMenuName);
			subMenuObj.setUnitPrice(unitPrice);
			
			menuMapper = new MenuMapper();
			menuMapper.setMainMenu(mainMenuObj);
			menuMapper.setSubMenu(subMenuObj);
			menuMapper.setMainSubMenuId(mainSubMenuId);
					
			menus.add(menuMapper);
			
			oldObj = mainMenuObj;
			prevId = mainMenuId;
			
		}
		mainSubMenuMap.put(oldObj, menus);
		
		//System.out.println("mainSubMenuMap==>" + mainSubMenuMap.toString());
		
		connectionsUtil.closeConnection(conn);
		
		return mainSubMenuMap;
	}
	
	public String saveOrder(String data, String userId) throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject)jsonParser.parse(data);

		String query = "insert into order_menu_map(order_id, main_sub_menu_map_id, quantity, unit_price, status_id, notes, created_by, order_price)" +
					   "values(?,?,?,?, (select status_id from status_master where status_name = 'In Progress'),?,?,?)";
		
		String query1 = "update order_menu_map set quantity = ?, order_price = ?, notes = ? where order_menu_map_id = ? ";
		
		PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		PreparedStatement psmt1 = conn.prepareStatement(query1);
		
		ResultSet dataRS;
		
		for (Map.Entry<String,JsonElement> entry : jsonObject.entrySet()) {
		    JsonObject jObject = entry.getValue().getAsJsonObject();
		 
		    if(jObject.get("orderMenuMapId") != null){
		    	psmt1.setInt(1, jObject.get("quantity").getAsInt());
		    	psmt1.setInt(2, jObject.get("finalPrice").getAsInt());
		    	psmt1.setString(3, jObject.get("notes").getAsString());
		    	psmt1.setInt(4, jObject.get("orderMenuMapId").getAsInt());
		    	
		    	psmt1.addBatch();
		    }else{
		    	psmt.setInt(1, jObject.get("orderId").getAsInt());
			    psmt.setInt(2, jObject.get("menuId").getAsInt());
			    psmt.setInt(3, jObject.get("quantity").getAsInt());
			    psmt.setFloat(4, jObject.get("unitPrice").getAsFloat());
			    psmt.setString(5, jObject.get("notes").getAsString());
			    psmt.setString(6, userId);
			    psmt.setString(7, jObject.get("finalPrice").getAsString());
			    
			    psmt.executeUpdate();
				
				dataRS = psmt.getGeneratedKeys();
				
				if(dataRS.next()){
					jObject.addProperty("orderMenuMapId", dataRS.getString(1));
				}
			    //psmt.addBatch();
		    }
		}
		
		//psmt.executeBatch();
		psmt1.executeBatch();
		Gson gson = new Gson();
		
		connectionsUtil.closeConnection(conn);
		
		return gson.toJson(jsonObject);
	}
	
	public OrderData getOrderData(Integer tableId, String userId) throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "select o.order_id, om.order_menu_map_id , msm.main_sub_menu_map_id, om.quantity, om.unit_price, om.order_price, sm.menu_name, om.notes "+ 
						"from order_master o inner join status_master s on o.status_id = s.status_id "+ 
						"and s.status_code = 'INPROGRESS' and o.table_id = "+tableId+" "+
						"left join order_menu_map om on o.order_id = om.order_id "+
						"left join main_sub_menu_map msm on msm.main_sub_menu_map_id = om.main_sub_menu_map_id "+
						"left join main_menu_master mm on mm.main_menu_id = msm.main_menu_id "+
						"left join sub_menu_master sm on msm.sub_menu_id = sm.sub_menu_id";
		System.out.println("query==>" + query);
		
		ResultSet dataRS = conn.createStatement().executeQuery(query);
		int count = 0;
		OrderData orderData = new OrderData();
		OrderMenu orderMenu;
		List<OrderMenu> orderMenus = new ArrayList<OrderMenu>();
		
		while(dataRS.next()){
			if(count == 0){
				orderData.setOrderId(dataRS.getInt("order_id"));
			}
			
			if(dataRS.getString("main_sub_menu_map_id") != null){
				orderMenu = new OrderMenu();
				orderMenu.setMainSubMenuMapId(dataRS.getInt("main_sub_menu_map_id"));
				orderMenu.setOrderMenuMapId(dataRS.getInt("order_menu_map_id"));
				orderMenu.setQuantity(dataRS.getInt("quantity"));
				orderMenu.setUnitPrice(dataRS.getFloat("unit_price"));
				orderMenu.setFinalPrice(dataRS.getFloat("order_price"));
				orderMenu.setNotes(dataRS.getString("notes"));
				orderMenu.setSubMenuName(dataRS.getString("menu_name"));
				
				orderMenus.add(orderMenu);
				orderData.setSelectedMenus(orderMenus);
			}
			count ++;
		}
		
		if(count == 0){
			
			query = "INSERT INTO `agri_tadka`.`order_master`(`table_id`,`status_id`,`created_by`) "+
					"VALUES(?, (select status_id from status_master where status_code = 'INPROGRESS'), ?);";
			
			PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			
			psmt.setInt(1, tableId);
			psmt.setString(2, userId);
			psmt.executeUpdate();
			
			dataRS = psmt.getGeneratedKeys();
			
			if(dataRS.next()){
				orderData.setOrderId(dataRS.getInt(1));
			}
		}
		
		connectionsUtil.closeConnection(conn);
		
		System.out.println("orderData===>" + orderData.toString());
		
		return orderData;
	}

	public static void main(String args[]) throws SQLException{
		
		Order order = new Order();
		
		order.getOrderedMenus("");
	}
	
	public List<Cooking> getOrderedMenus(String data) throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject)jsonParser.parse(data);
		
		String timestamp = jsonObject.get("timestamp").getAsString();
		String statusCode = jsonObject.get("statusCode").getAsString();
		
		String query = "select o.order_id, sm.menu_name, om.quantity, om.order_menu_map_id, om.created_on, "+
				 		"tm.table_name, om.notes  from order_master o "+ 
						"inner join order_menu_map om on o.order_id = om.order_id " ;
		
				 		if(timestamp != null && !timestamp.equals("")){
				 			query += "and om.created_by >= '" + timestamp + "' ";
				 		}
						 
				 		query += "inner join status_master s on om.status_id = s.status_id and status_code = '"+statusCode+"' "+
						"inner join main_sub_menu_map msm on msm.main_sub_menu_map_id = om.main_sub_menu_map_id "+
						"inner join sub_menu_master sm on sm.sub_menu_id = msm.sub_menu_id "+
						"inner join table_type_name_map ttn on ttn.table_type_name_map_id = o.table_id "+
						"inner join table_master tm on tm.table_id = ttn.table_id order by om.created_on asc";
				 		
				 		//System.out.println("query==>" + query);
				 		
				 		ResultSet dataRS = conn.createStatement().executeQuery(query);
				 		Cooking cooking;
				 		OrderData orderData;
				 		
				 		List<Cooking> orderedMenus = new ArrayList<Cooking>();
				 		while(dataRS.next()){
				 			cooking = new Cooking();
				 			orderData = new OrderData();
				 			
				 			orderData.setOrderId(dataRS.getInt("order_id"));
				 			orderData.setTableName(dataRS.getString("table_name"));
				 			
				 			cooking.setOrderMenuMapId(dataRS.getInt("order_menu_map_id"));
				 			cooking.setSubMenuName(dataRS.getString("menu_name"));
				 			cooking.setCreatedOn(dataRS.getString("created_on"));
				 			cooking.setQuantity(dataRS.getInt("quantity"));
				 			cooking.setNotes(dataRS.getString("notes"));
				 			
				 			cooking.setOrderData(orderData);				 			
				 			orderedMenus.add(cooking);
				 		}
				 		
		
		connectionsUtil.closeConnection(conn);
		
		return orderedMenus;
	}

	public Integer updateCookingStatus(String data) throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject)jsonParser.parse(data);
		
		String operation = jsonObject.get("operation").getAsString();
		Integer orderMenuMapId = jsonObject.get("orderMenuMapId").getAsInt();
		
		String statusCode = operation.equals("Cook") ? "COOKED" : "COMPLETED";
		
		String query = "update order_menu_map set status_id = (select status_id from status_master where status_code = ?) "+
					   "where order_menu_map_id = ?";

		PreparedStatement psmt = conn.prepareStatement(query);
		
		psmt.setString(1,statusCode);
		psmt.setInt(2, orderMenuMapId);
		
		psmt.executeUpdate();
		
		return 0;
	}
}
