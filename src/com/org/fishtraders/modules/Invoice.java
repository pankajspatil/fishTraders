package com.org.fishtraders.modules;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonObject;
import com.org.fishtraders.generic.ConnectionsUtil;
import com.org.fishtraders.generic.Utils;
import com.org.fishtraders.transfer.Boat;
import com.org.fishtraders.transfer.Customer;
import com.org.fishtraders.transfer.ExpenseModel;
import com.org.fishtraders.transfer.Fish;
import com.org.fishtraders.transfer.InvoiceModel;
import com.org.fishtraders.transfer.Vendor;

public class Invoice {

	public List<ExpenseModel> getExpenseListByVendor(String data) throws SQLException{

		Expense expense = new Expense();
		
		JsonObject jsonObject  = Utils.getJSONObjectFromString(data);
		
		Integer vendorId = jsonObject.get("vendorId").getAsInt();

		List<ExpenseModel> expenseList = expense.getExpenseList(vendorId, true);
		
		return expenseList;
	}

	public void addInvoice(InvoiceModel invoiceModel) throws SQLException {

		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();

		String query = "INSERT INTO `invoice_master`(`vendor_id`,`expense_exist`,`amount`,`comments`,`created_by`) "+
						"VALUES(?,?,?,?,?)";

		PreparedStatement psmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		
		psmt.setInt(1, invoiceModel.getVendor().getVendorId());
		psmt.setBoolean(2, invoiceModel.getExpenseExist());
		psmt.setDouble(3, invoiceModel.getAmount());
		psmt.setString(4, invoiceModel.getComments());
		psmt.setInt(5, invoiceModel.getCreatedBy());

		psmt.executeUpdate();
		
		ResultSet dataRS = psmt.getGeneratedKeys();
		Integer invoiceId = 0;
		if(dataRS.next()){
			invoiceId = dataRS.getInt(1);
		}
		
		if(invoiceModel.getExpenseList().size() > 0){
			String query1 = "insert into invoice_expense_map (invoice_id, expense_id, amount, created_by) values(?,?,?,?)";
			psmt = conn.prepareStatement(query1);
			for(ExpenseModel expenseModel : invoiceModel.getExpenseList()){
				psmt.setInt(1, invoiceId);
				psmt.setInt(2, expenseModel.getExpenseId());
				psmt.setDouble(3, expenseModel.getPaidAmt());
				psmt.setInt(4, invoiceModel.getCreatedBy());
				
				psmt.addBatch();
			}
			psmt.executeBatch();
			
		}
		connectionsUtil.closeConnection(conn);
		
}

	public List<InvoiceModel> getInvoiceList() throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "select i.invoice_id, ifnull(expAmount,amount) as amount,vendor_name, v.vendor_id, comments, "
					+ "expense_exist from invoice_master i "
					+ "inner join vendor_master v on i.vendor_id = v.vendor_id "
					+ "left join (select invoice_id, sum(ifnull(amount,0)) as expAmount from invoice_expense_map ie "
					+ "where is_active = 1 group by invoice_id) ie on i.invoice_id = ie.invoice_id order by i.invoice_id desc";
		
		ResultSet dataRS = conn.createStatement().executeQuery(query);
		List<InvoiceModel> invoiceList = new ArrayList<InvoiceModel>();
		InvoiceModel invoiceModel;
		Vendor vendor;
		
		while(dataRS.next()){
			invoiceModel = new InvoiceModel();
			vendor = new Vendor();
			
			invoiceModel.setInvoiceId(dataRS.getInt("invoice_id"));
			invoiceModel.setExpenseExist(dataRS.getBoolean("expense_exist"));
			invoiceModel.setAmount(dataRS.getDouble("amount"));
			invoiceModel.setComments(dataRS.getString("comments"));
			
			vendor.setVendorId(dataRS.getInt("vendor_id"));
			vendor.setVendorName(dataRS.getString("vendor_name"));
			invoiceModel.setVendor(vendor);
			
			invoiceList.add(invoiceModel);
		}
		
		connectionsUtil.closeConnection(conn);
		
		return invoiceList;
	}

	public InvoiceModel getInvoice(Integer invoiceId) throws SQLException{
		
		InvoiceModel invoiceModel = null;
		Vendor vendor;
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "select i.invoice_id, v.vendor_id, expense_exist, comments, e.expense_id, "+ 
						"vendor_name, i.amount as tAmount, ie.amount as eAmount, i.created_on,f.fish_name, "+
						"b.boat_name, c.first_name, c.middle_name, c.last_name from invoice_master i "+
						"inner join vendor_master v on i.vendor_id = v.vendor_id and i.invoice_id = ? "+
						"inner join invoice_expense_map ie on i.invoice_id = ie.invoice_id "+
						"inner join expenses e on ie.expense_id = e.expense_id "+
						"inner join fish_master f on e.fish_id = f.fish_id "+
						"inner join boat_master b on e.boat_id = b.boat_id " +
						"inner join customer_master c on c.customer_id = e.customer_id";
		
		PreparedStatement psmt = conn.prepareStatement(query);
		
		psmt.setInt(1, invoiceId);
		
		ResultSet dataRS = psmt.executeQuery();
		ExpenseModel expenseModel;
		Fish fish;
		Boat boat;
		Customer customer;
		
		List<ExpenseModel> expenseList = new ArrayList<ExpenseModel>();
		
		int count = 0;
		
		while(dataRS.next()){
			
			vendor = new Vendor();
			vendor.setVendorId(dataRS.getInt("vendor_id"));
			vendor.setVendorName(dataRS.getString("vendor_name"));
			
			if(count == 0){
				invoiceModel = new InvoiceModel();
				invoiceModel.setInvoiceId(dataRS.getInt("invoice_id"));
				invoiceModel.setAmount(dataRS.getDouble("tAmount"));
				invoiceModel.setVendor(vendor);
				invoiceModel.setExpenseExist(dataRS.getBoolean("expense_exist"));
				invoiceModel.setCreatedOn(dataRS.getString("created_on"));
			}
			
			fish = new Fish();
			fish.setFishName(dataRS.getString("fish_name"));
			
			boat = new Boat();
			boat.setBoatName(dataRS.getString("boat_name"));
			
			customer = new Customer();
			customer.setFirstName(dataRS.getString("first_name"));
			customer.setMiddleName(dataRS.getString("middle_name"));
			customer.setLastName(dataRS.getString("last_name"));
			
			expenseModel = new ExpenseModel();
			expenseModel.setExpenseId(dataRS.getInt("expense_id"));
			expenseModel.setFish(fish);
			expenseModel.setVendor(vendor);
			expenseModel.setCustomer(customer);
			expenseModel.setBoat(boat);
			expenseModel.setPaidAmt(dataRS.getDouble("eAmount"));
			
			expenseList.add(expenseModel);
			
			count++;
		}
		
		if(invoiceModel != null){
			invoiceModel.setExpenseList(expenseList);
		}
		
		connectionsUtil.closeConnection(conn);
		
		return invoiceModel;
	}
}

