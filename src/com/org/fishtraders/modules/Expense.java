package com.org.fishtraders.modules;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.fishtraders.generic.ConnectionsUtil;
import com.org.fishtraders.transfer.Boat;
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
						+ "`expense_remark`,`created_by`) "+
							"VALUES(?,?,?,?,?,?)";

			PreparedStatement psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, expenseModel.getVendor().getVendorId());
			psmt.setInt(2, expenseModel.getBoat().getBoatId());
			psmt.setInt(3, expenseModel.getFish().getFishId());
			psmt.setDouble(4, expenseModel.getExpenseAmt());
			psmt.setString(5, expenseModel.getExpenseRemark());
			psmt.setInt(6, expenseModel.getCreatedBy());

			psmt.executeUpdate();
			
			connectionsUtil.closeConnection(conn);
	}
	
	public List<ExpenseModel> getExpenseList(Integer vendorId, boolean payableOnly) throws SQLException{
			
		
			connectionsUtil = new ConnectionsUtil();
			conn = connectionsUtil.getConnection();

			String query = "SELECT e.expense_id, f.fish_id, f.fish_name, v.vendor_id, v.vendor_name, " +
							"b.boat_id, b.boat_name, " +
							"e.expense_amount, ie.paidAmt, e.expense_remark FROM expenses e "+
							"inner join fish_master f on e.fish_id = f.fish_id "+
							"inner join boat_master b on b.boat_id = e.boat_id " +
							"inner join vendor_master v on e.vendor_id = v.vendor_id ";
							if(vendorId != null){
								query += "and v.vendor_id = ? ";
							}
							
							query += "left join (select expense_id, sum(ifnull(amount,0)) as paidAmt from invoice_expense_map ie "+ 
							"where is_active = 1 group by expense_id) ie on e.expense_id = ie.expense_id";
							
							if(payableOnly){
								query += " having (expense_amount - ifnull(ie.paidAmt,0)) > 0";
							}
					
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			if(vendorId != null){
				preparedStatement.setInt(1, vendorId);
			}
			
			dataRS = preparedStatement.executeQuery();

			List<ExpenseModel> expenseList = new ArrayList<ExpenseModel>();
			ExpenseModel expenseModel = null;
			Fish fish = null;
			Vendor vendor = null;
			Boat boat = null;
			
			while (dataRS.next()) {
				
				expenseModel = new ExpenseModel();
				
				fish = new Fish();
				fish.setFishName(dataRS.getString("fish_name"));
				
				vendor = new Vendor();
				vendor.setVendorName(dataRS.getString("vendor_name"));
				
				boat = new Boat();
				boat.setBoatName(dataRS.getString("boat_name"));
				
				expenseModel.setExpenseId(dataRS.getInt("expense_id"));
				expenseModel.setVendor(vendor);
				expenseModel.setFish(fish);
				expenseModel.setBoat(boat);
				expenseModel.setExpenseAmt(dataRS.getDouble("expense_amount"));
				expenseModel.setPaidAmt(dataRS.getDouble("paidAmt"));
				expenseModel.setExpenseRemark(dataRS.getString("expense_remark"));
				
				expenseList.add(expenseModel);
			}

			connectionsUtil.closeConnection(conn);
		
		return expenseList;

	}

}
