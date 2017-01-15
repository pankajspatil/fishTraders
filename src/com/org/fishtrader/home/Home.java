package com.org.fishtrader.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.org.fishtrader.generic.ConnectionsUtil;
import com.org.fishtrader.transfer.Boat;

public class Home {
	
	public LinkedHashMap<String, List<Boat>> getAllBoats() throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "";
		
		System.out.println("query ==> " + query);
		
		ResultSet dataRS = conn.createStatement().executeQuery(query);
		LinkedHashMap<String, List<Boat>> boatMap = new LinkedHashMap<String, List<Boat>>();
		String previousTblType = "", currentTblType = "";
		Boat boat;
		List<Boat> boatList = new ArrayList<Boat>();
		
		while(dataRS.next()){
			
			currentTblType = dataRS.getString("Boat_type");
			if(!previousTblType.equals(currentTblType) && !previousTblType.equals("")){
				boatMap.put(previousTblType, boatList);
				boatList = new ArrayList<Boat>();
			}
			boat = new Boat();
			boat.setBoatId(dataRS.getInt("boat_id"));			
			boat.setBoatName(dataRS.getString("boat_name"));
			boat.setIsActive(dataRS.getInt("is_active"));
			
			boatList.add(boat);
			previousTblType = currentTblType;
		}
		
		if(boatList.size() > 0){
			boatMap.put(previousTblType, boatList);
		}
		
		connectionsUtil.closeConnection(conn);
		return boatMap;
	}
	
	

	
	public void updateTable(int tableId,String tablename,int active){
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		
		String query="update table_master set table_name='"+tablename+"',is_active="+active+" where table_id="+tableId;
		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(query);
			psmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
