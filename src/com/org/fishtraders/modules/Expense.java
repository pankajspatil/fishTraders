package com.org.fishtraders.modules;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.fishtraders.generic.ConnectionsUtil;
import com.org.fishtraders.generic.Utils;
import com.org.fishtraders.transfer.Boat;
import com.org.fishtraders.transfer.Customer;
import com.org.fishtraders.transfer.ExpenseModel;
import com.org.fishtraders.transfer.Fish;
import com.org.fishtraders.transfer.Vendor;

public class Expense {
	
	static Connection conn = null;
	static ResultSet dataRS = null;
	static ConnectionsUtil connectionsUtil = null;
	
	public void addExpense(ExpenseModel expenseModel) throws SQLException {

			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "INSERT INTO `expenses`(`vendor_id`,`boat_id`,`fish_id`,`expense_amount`,"
						+ "`expense_remark`,`created_by`, customer_id) "+
							"VALUES(?,?,?,?,?,?,?)";

			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, expenseModel.getVendor().getVendorId());
			psmt.setInt(2, expenseModel.getBoat().getBoatId());
			psmt.setInt(3, expenseModel.getFish().getFishId());
			psmt.setDouble(4, expenseModel.getExpenseAmt());
			psmt.setString(5, expenseModel.getExpenseRemark());
			psmt.setInt(6, expenseModel.getCreatedBy());
			psmt.setInt(7, expenseModel.getCustomer().getCustomerId());

			psmt.executeUpdate();
			
			connectionsUtil.closeConnection(conn);
	}
	
	public List<ExpenseModel> getExpenseList(Integer vendorId, Integer customerId, boolean payableOnly) throws SQLException{
			
		
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "SELECT e.expense_id, f.fish_id, f.fish_name, v.vendor_id, v.vendor_name, " +
							"b.boat_id, b.boat_name, c.customer_id, c.first_name, c.last_name, c.middle_name, " +
							"e.expense_amount, ie.vendorAmt, ie.custAmt, e.expense_remark FROM expenses e "+
							"inner join fish_master f on e.fish_id = f.fish_id "+
							"inner join boat_master b on b.boat_id = e.boat_id " +
							"inner join customer_master c on e.customer_id = c.customer_id ";
			
							if(customerId != null){
								query += "and c.customer_id = ? ";
							}
			
							query += "inner join vendor_master v on e.vendor_id = v.vendor_id ";
							if(vendorId != null){
								query += "and v.vendor_id = ? ";
							}
							
							query += "left join (select expense_id, sum(case when i.vendor_id !=0 then ie.amount else 0 end) as vendorAmt, "+
							"sum(case when i.customer_id !=0 then ie.amount else 0 end) as custAmt from invoice_expense_map ie "+
							"inner join invoice_master i on ie.invoice_id = i.invoice_id " +
							"where ie.is_active = 1 and i.is_active = 1 " +
							"group by expense_id) ie on e.expense_id = ie.expense_id ";
							
							if(payableOnly){
								
								if(customerId != null){
									query += "having (expense_amount - ifnull(ie.custAmt,0)) > 0";
								}
								if(vendorId != null){
									query += "having (expense_amount - ifnull(ie.vendorAmt,0)) > 0";
								}
							}
					
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			if(vendorId != null){
				preparedStatement.setInt(1, vendorId);
			}else if(customerId != null){
				preparedStatement.setInt(1, customerId);
			}
			
			dataRS = preparedStatement.executeQuery();

			List<ExpenseModel> expenseList = new ArrayList<ExpenseModel>();
			ExpenseModel expenseModel = null;
			Fish fish = null;
			Vendor vendor = null;
			Boat boat = null;
			Customer customer = null;
			
			while (dataRS.next()) {
				
				expenseModel = new ExpenseModel();
				
				fish = new Fish();
				fish.setFishName(dataRS.getString("fish_name"));
				
				vendor = new Vendor();
				vendor.setVendorName(dataRS.getString("vendor_name"));
				
				boat = new Boat();
				boat.setBoatName(dataRS.getString("boat_name"));
				
				customer = new Customer();
				customer.setCustomerId(dataRS.getInt("customer_id"));
				customer.setFirstName(Utils.getString(dataRS.getString("first_name")));
				customer.setMiddleName(Utils.getString(dataRS.getString("middle_name")));
				customer.setLastName(Utils.getString(dataRS.getString("last_name")));
				
				expenseModel.setExpenseId(dataRS.getInt("expense_id"));
				expenseModel.setVendor(vendor);
				expenseModel.setFish(fish);
				expenseModel.setBoat(boat);
				expenseModel.setCustomer(customer);
				expenseModel.setExpenseAmt(dataRS.getDouble("expense_amount"));
				
				expenseModel.setVendorAmt(dataRS.getDouble("vendorAmt"));
				expenseModel.setCustAmt(dataRS.getDouble("custAmt"));
				
				if(customerId != null){
					expenseModel.setPaidAmt(dataRS.getDouble("custAmt"));
				}
				if(vendorId != null){
					expenseModel.setPaidAmt(dataRS.getDouble("vendorAmt"));
				}
				
				expenseModel.setExpenseRemark(dataRS.getString("expense_remark"));
				
				expenseList.add(expenseModel);
			}

			connectionsUtil.closeConnection(conn);
		
		return expenseList;

	}

}
