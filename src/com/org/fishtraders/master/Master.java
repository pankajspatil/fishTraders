package com.org.fishtraders.master;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.fishtraders.generic.ConnectionsUtil;
import com.org.fishtraders.transfer.Boat;
import com.org.fishtraders.transfer.Fish;
import com.org.fishtraders.transfer.Vendor;

public class Master {
	
public List<Vendor> getAllVendors(Boolean isActive) throws SQLException{
	
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "select * from vendor_master";
	if(isActive){
		query += " where is_active = 1";
	}
	
	ResultSet dataRS = conn.createStatement().executeQuery(query);
	List<Vendor> vendorList = new ArrayList<Vendor>();
	Vendor vendor;
	
	while(dataRS.next()){
		vendor = new Vendor();
		
		vendor.setVendorId(dataRS.getInt("vendor_id"));
		vendor.setVendorName(dataRS.getString("vendor_name"));
		vendor.setIsActive(dataRS.getBoolean("is_active"));
		
		vendorList.add(vendor);
	}
	
	connectionsUtil.closeConnection(conn);
	
	return vendorList;
}

public List<Fish> getAllFishes(Boolean isActive) throws SQLException{
	
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "select * from fish_master";
	if(isActive){
		query += " where is_active = 1";
	}
	
	ResultSet dataRS = conn.createStatement().executeQuery(query);
	List<Fish> fishList = new ArrayList<Fish>();
	Fish fish;
	
	while(dataRS.next()){
		fish = new Fish();
		
		fish.setFishId(dataRS.getInt("fish_id"));
		fish.setFishName(dataRS.getString("fish_name"));
		fish.setIsActive(dataRS.getBoolean("is_active"));
		
		fishList.add(fish);
	}
	
	connectionsUtil.closeConnection(conn);
	
	return fishList;
}

public List<Boat> getAllBoats(Boolean isActive, Integer boatId, Integer vendorId) throws SQLException{
	
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "select * from boat_master b inner join vendor_master v on b.vendor_id = v.vendor_id ";
	if(isActive){
		query += " and b.is_active = 1 ";
	}
	if(vendorId != 0){
		query += " and b.vendor_id = "+vendorId+" ";
	}
	if(boatId != 0){
		query += " and boat_id = "+boatId+" ";
	}
	
	query = query.replaceAll("[ ]*where[ ]*$|[ ]*and[ ]*$", "");
	
	ResultSet dataRS = conn.createStatement().executeQuery(query);
	List<Boat> boatList = new ArrayList<Boat>();
	Boat boat;
	Vendor vendor;
	
	while(dataRS.next()){
		boat = new Boat();
		vendor = new Vendor();
		
		vendor.setVendorId(dataRS.getInt("vendor_id"));
		vendor.setVendorName(dataRS.getString("vendor_name"));
		//vendor.setVendorAddress(vendorAddress);
		
		boat.setBoatId(dataRS.getInt("boat_id"));
		boat.setBoatName(dataRS.getString("boat_name"));
		boat.setVendor(vendor);
		boat.setIsActive(dataRS.getBoolean("is_active"));
		boat.setCreatedBy(dataRS.getInt("created_by"));
		boat.setCreatedOn(dataRS.getString("created_on"));
		
		boatList.add(boat);
	}
	
	connectionsUtil.closeConnection(conn);
	return boatList;
}

}
