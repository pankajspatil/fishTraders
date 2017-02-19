package com.org.fishtraders.master;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.org.fishtraders.generic.ConnectionsUtil;
import com.org.fishtraders.generic.Utils;
import com.org.fishtraders.transfer.Boat;
import com.org.fishtraders.transfer.Customer;
import com.org.fishtraders.transfer.Fish;
import com.org.fishtraders.transfer.Vendor;

public class Master {
	
public List<Vendor> getAllVendors(Boolean isActive, Integer vendorId) throws SQLException{

		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();

		String query = "select * from vendor_master";
		if(isActive && vendorId != 0){
			query += " where is_active = 1 and vendor_id = "+ vendorId;
		}else if(isActive){
			query += " where is_active = 1";
		}else if(vendorId != 0){
			query += " where vendor_id = "+ vendorId;
		}

		ResultSet dataRS = conn.createStatement().executeQuery(query);
		List<Vendor> vendorList = new ArrayList<Vendor>();
		Vendor vendor;

		while(dataRS.next()){
			vendor = new Vendor();
			
			vendor.setVendorId(dataRS.getInt("vendor_id"));
			vendor.setVendorName(dataRS.getString("vendor_name"));
			vendor.setIsActive(dataRS.getBoolean("is_active"));
			vendor.setVendorAddress(dataRS.getString("address"));
			vendor.setCreatedBy(dataRS.getInt("created_by"));
			vendor.setCreatedOn(dataRS.getString("created_on"));
			vendor.setContactNo(dataRS.getString("contact_no"));
			
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

public List<Customer> getAllCustomers(Boolean isActive, Integer customerId) throws SQLException{
	
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "select * from customer_master where ";
	if(isActive){
		query += " is_active = 1 and ";
	}
	if(customerId != 0){
		query += " customer_id = " + customerId + " and ";
	}
	
	query = query.replaceAll("[ ]*where[ ]*$|[ ]*and[ ]*$", "");
	
	ResultSet dataRS = conn.createStatement().executeQuery(query);
	List<Customer> customerList = new ArrayList<Customer>();
	Customer customer;
	
	while(dataRS.next()){
		customer = new Customer();
		
		customer.setCustomerId(dataRS.getInt("customer_id"));
		
		customer.setFirstName(Utils.getString(dataRS.getString("first_name")));
		customer.setMiddleName(Utils.getString(dataRS.getString("middle_name")));
		customer.setLastName(Utils.getString(dataRS.getString("last_name")));
		customer.setEmail(Utils.getString(dataRS.getString("email")));
		customer.setContactNo(Utils.getString(dataRS.getString("contact_no")));
		customer.setSex(Utils.getString(dataRS.getString("sex")));
		customer.setAddress(Utils.getString(dataRS.getString("address")));
		customer.setDob(Utils.getString(dataRS.getString("dob")));
		customer.setIsActive(dataRS.getBoolean("is_active"));
		
		customerList.add(customer);
	}
	
	connectionsUtil.closeConnection(conn);
	
	return customerList;
}

public Vendor insertVendor(Vendor vendor, String userId) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "insert into vendor_master(vendor_name, contact_no, address, is_active, created_by) values(?,?,?,?,?)";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, vendor.getVendorName());
	psmt.setString(2, vendor.getContactNo());
	psmt.setString(3, vendor.getVendorAddress());
	psmt.setBoolean(4, vendor.getIsActive());
	psmt.setString(5, userId);
	
	psmt.executeUpdate();
	
	ResultSet dataRS = psmt.getGeneratedKeys();
	if(dataRS.next()){
		vendor.setVendorId(dataRS.getInt(1));
	}
	
	connectionsUtil.closeConnection(dataRS);
	
	return vendor;
}

public Vendor updateVendor(Vendor vendor, String userId) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "update vendor_master set vendor_name = ?, contact_no = ?, address = ?, is_active = ?, created_by = ? where vendor_id = ?";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, vendor.getVendorName());
	psmt.setString(2, vendor.getContactNo());
	psmt.setString(3, vendor.getVendorAddress());
	psmt.setBoolean(4, vendor.getIsActive());
	psmt.setString(5, userId);
	psmt.setInt(6, vendor.getVendorId());
	
	psmt.executeUpdate();
	
	connectionsUtil.closeConnection(conn);
	
	return vendor;
}



}
