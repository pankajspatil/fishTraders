package com.org.agritadka.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.org.agritadka.generic.ConnectionsUtil;
import com.org.agritadka.transfer.MainMenu;
import com.org.agritadka.transfer.MenuMapper;
import com.org.agritadka.transfer.SubMenu;

public class Order {

	public LinkedHashMap<MainMenu, List<MenuMapper>> getMenus() throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "SELECT ms.main_sub_menu_map_id, m.main_menu_id, s.sub_menu_id, " +
						"m.menu_name as main_menu, s.menu_name as sub_menu, s.unit_price "+
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
	
	public Integer saveOrder(String data) throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject)jsonParser.parse(data);

		String query = "insert into order_menu_map(order_id, main_sub_menu_map_id, quantity, unit_price, status_id, notes, created_by)" +
					   "values(?,?,?,?, (select status_id from status_master where status_name = 'In Progress'),?,?)";
		
		PreparedStatement psmt = conn.prepareStatement(query);
		
		for (Map.Entry<String,JsonElement> entry : jsonObject.entrySet()) {
		    JsonObject jObject = entry.getValue().getAsJsonObject();
		 
		    psmt.setInt(1, 1/*jObject.get("orderId").getAsInt()*/);
		    psmt.setInt(2, jObject.get("menuId").getAsInt());
		    psmt.setInt(3, jObject.get("quantity").getAsInt());
		    psmt.setFloat(4, jObject.get("unitPrice").getAsFloat());
		    psmt.setString(5, jObject.get("notes").getAsString());
		    psmt.setInt(6, 1);
		    
		    psmt.addBatch();
		}
		
		psmt.executeBatch();
		return 0;
	}
	
	public static void main(String args[]) throws SQLException{
		
		Order order = new Order();
		
		order.getMenus();
	}
	
}
