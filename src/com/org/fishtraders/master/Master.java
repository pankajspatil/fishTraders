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

public List<Fish> getAllFishes(Boolean isActive, Integer fishId) throws SQLException{
	
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	
	String query = "select * from fish_master";
	if(isActive && fishId != 0){
		query += " where is_active = 1 and fish_id = "+ fishId;
	}else if(isActive){
		query += " where is_active = 1";
	}else if(fishId != 0){
		query += " where fish_id = "+ fishId;
	}
	
	ResultSet dataRS = conn.createStatement().executeQuery(query);
	List<Fish> fishList = new ArrayList<Fish>();
	Fish fish;
	
	while(dataRS.next()){
		fish = new Fish();
		
		fish.setFishId(dataRS.getInt("fish_id"));
		fish.setFishName(dataRS.getString("fish_name"));
		fish.setIsActive(dataRS.getBoolean("is_active"));
		fish.setCreatedBy(dataRS.getInt("created_by"));
		fish.setCreatedOn(dataRS.getString("created_on"));
		
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
		vendor.setVendorAddress(dataRS.getString("address"));
		
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

public Vendor insertVendor(Vendor vendor) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "insert into vendor_master(vendor_name, contact_no, address, is_active, created_by) values(?,?,?,?,?)";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, vendor.getVendorName());
	psmt.setString(2, vendor.getContactNo());
	psmt.setString(3, vendor.getVendorAddress());
	psmt.setBoolean(4, vendor.getIsActive());
	psmt.setInt(5, vendor.getCreatedBy());
	
	psmt.executeUpdate();
	
	ResultSet dataRS = psmt.getGeneratedKeys();
	if(dataRS.next()){
		vendor.setVendorId(dataRS.getInt(1));
	}
	
	connectionsUtil.closeConnection(dataRS);
	
	return vendor;
}

public Vendor updateVendor(Vendor vendor) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "update vendor_master set vendor_name = ?, contact_no = ?, address = ?, is_active = ?, created_by = ? where vendor_id = ?";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, vendor.getVendorName());
	psmt.setString(2, vendor.getContactNo());
	psmt.setString(3, vendor.getVendorAddress());
	psmt.setBoolean(4, vendor.getIsActive());
	psmt.setInt(5, vendor.getCreatedBy());
	psmt.setInt(6, vendor.getVendorId());
	
	psmt.executeUpdate();
	
	connectionsUtil.closeConnection(conn);
	
	return vendor;
}

public Fish insertFish(Fish fish) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "insert into fish_master(fish_name, is_active, created_by) values(?,?,?)";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, fish.getFishName());
	psmt.setBoolean(2, fish.getIsActive());
	psmt.setInt(3, fish.getCreatedBy());
	
	psmt.executeUpdate();
	
	ResultSet dataRS = psmt.getGeneratedKeys();
	if(dataRS.next()){
		fish.setFishId(dataRS.getInt(1));
	}
	
	connectionsUtil.closeConnection(dataRS);
	
	return fish;
}

public Fish updateFish(Fish fish) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "update fish_master set fish_name = ?, is_active = ?, created_by = ? where fish_id = ?";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	psmt.setString(1, fish.getFishName());
	psmt.setBoolean(2, fish.getIsActive());
	psmt.setInt(3, fish.getCreatedBy());
	psmt.setInt(4, fish.getFishId());
	
	psmt.executeUpdate();
	
	connectionsUtil.closeConnection(conn);
	
	return fish;
}

public Boat insertBoat(Boat boat) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "insert into boat_master(boat_name, vendor_id, is_active, created_by) values(?,?,?,?)";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, boat.getBoatName());
	psmt.setInt(2, boat.getVendor().getVendorId());
	psmt.setBoolean(3, boat.getIsActive());
	psmt.setInt(4, boat.getCreatedBy());
	
	psmt.executeUpdate();
	
	ResultSet dataRS = psmt.getGeneratedKeys();
	if(dataRS.next()){
		boat.setBoatId(dataRS.getInt(1));
	}
	
	connectionsUtil.closeConnection(dataRS);
	
	return boat;
}

public Boat updateBoat(Boat boat) throws SQLException{
	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "update boat_master set boat_name = ?, vendor_id = ?, is_active = ?, created_by = ? where boat_id = ?";
	
	PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	
	
	psmt.setString(1, boat.getBoatName());
	psmt.setInt(2, boat.getVendor().getVendorId());
	psmt.setBoolean(3, boat.getIsActive());
	psmt.setInt(4, boat.getCreatedBy());
	psmt.setInt(5, boat.getBoatId());
	
	psmt.executeUpdate();
	
	connectionsUtil.closeConnection(conn);
	
	return boat;
}

/**Customer Master Screen**/

public List<Customer> searchCustomer(Integer searchKey, String searchValue) throws SQLException {

	ResultSet dataRS = null;
	List<Customer> customerList = new ArrayList<Customer>();
	
	switch (searchKey) {
	case 1:
		dataRS = getCustomerByName(searchValue);
		break;
	case 2:
		dataRS = getCustomerByMobileNo(searchValue);
		break;
	case 4:
		dataRS = getCustomerByDOB(searchValue);
		break;
	case 5:
		dataRS = getCustomerByID(searchValue);
		break;
	default:
		dataRS = getAllCustomers(false);
		
	}
	
	Customer customer = null;
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
	
	if(dataRS != null){
		ConnectionsUtil.closeRes(dataRS);
	}

	return customerList;
}

private ResultSet getCustomerByDOB(String dob) {

	ResultSet dataRS = null;
	
	try{
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();		
		Connection conn = connectionsUtil.getConnection();
		String query = "select * from customer_master where dob = ?";
		PreparedStatement pst = conn.prepareStatement(query);
		
		pst.setString(1, dob);
		
		dataRS = pst.executeQuery();
		
		query = null;connectionsUtil = null;			
	}catch(Exception ex){
		ex.printStackTrace();
	}
	return dataRS;
}

private ResultSet getAllCustomers(Boolean isActive) {

	ResultSet dataRS = null;
	
	try{
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();		
		Connection conn = connectionsUtil.getConnection();
		String query = "select * from customer_master ";
		if(isActive){
			query += "where is_active = 1";
		}
		PreparedStatement pst = conn.prepareStatement(query);
		dataRS = pst.executeQuery();
		
		query = null;connectionsUtil = null;			
	}catch(Exception ex){
		ex.printStackTrace();
	}
	return dataRS;
}

public ResultSet getCustomerByName(String searchValue) {
	
	ResultSet dataRS = null;
	
	try{
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();		
		Connection conn = connectionsUtil.getConnection();
		String query = "select * from customer_master where first_name like '%"+searchValue+"%' or last_name like '%"+searchValue+"%'";
		dataRS = conn.createStatement().executeQuery(query);
		
	}catch(Exception ex){
		ex.printStackTrace();
	}
	return dataRS;
}

public ResultSet getCustomerByMobileNo(String phone) {

	ResultSet dataRS = null;
	try{
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();		
		Connection conn = connectionsUtil.getConnection();
		String query = "select * from customer_master where contact_no = ?";
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setString(1, phone);
		dataRS = pst.executeQuery();
		
		query = null;connectionsUtil = null;
		
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
	return dataRS;
}

public ResultSet getCustomerByID(String customerId){

	ResultSet dataRS = null;
	try{		
		ConnectionsUtil connectionsUtil= new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "select * from customer_master where customer_id = ?";
		
		PreparedStatement psm = conn.prepareStatement(query);
		psm.setString(1, customerId);
		
		dataRS = psm.executeQuery();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	return dataRS;
}

public void createUpdateCustomer(Customer customer) throws SQLException{

	ConnectionsUtil connectionsUtil = new ConnectionsUtil();
	Connection conn = connectionsUtil.getConnection();
	
	String query = "";
	
	query = "INSERT INTO `customer_master`(`first_name`,`middle_name`,`last_name`,`email`,"
				+ "`contact_no`,`sex`,`address`,`dob`,`created_by`,`is_active`) VALUES(?,?,?,?,?,?,?,?,?,?)";
	
	if(customer.getCustomerId() != null && customer.getCustomerId() != 0){
		query = "UPDATE `customer_master` SET `first_name` = ?,`middle_name` = ?,"
				+ "`last_name` = ?,`email` = ?,`contact_no` = ?,`sex` = ?,`address` = ?,"
				+ "`dob` = ?,`created_by` = ?,`is_active` = ? WHERE `customer_id` = ?;";
	}
	
	PreparedStatement psmt = conn.prepareStatement(query);
	
	psmt.setString(1, customer.getFirstName());
	psmt.setString(2, customer.getMiddleName());
	psmt.setString(3, customer.getLastName());
	psmt.setString(4, customer.getEmail());
	psmt.setString(5, customer.getContactNo());
	psmt.setString(6, customer.getSex());
	psmt.setString(7, customer.getAddress());
	psmt.setString(8, customer.getDob());
	psmt.setInt(9, customer.getCreatedBy());
	psmt.setBoolean(10, customer.getIsActive());
	
	if(customer.getCustomerId() != null && customer.getCustomerId() != 0){
		psmt.setInt(11, customer.getCustomerId());
	}
	psmt.executeUpdate();
}


}
