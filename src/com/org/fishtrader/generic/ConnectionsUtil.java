package com.org.fishtrader.generic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import com.mysql.jdbc.Driver;

public class ConnectionsUtil {
	
	Connection conn = null;

	public Connection getConnection() {
		try {
			/*Class.forName("com.mysql.jdbc.Driver").newInstance();
			// conn =
			// DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase?user=testuser&password=testpassword");
			String connectionUrl = "jdbc:mysql://localhost:3306/doctorsonline";
			String connectionUser = "root";
			String connectionPassword = "admin";
			conn = DriverManager.getConnection(connectionUrl, connectionUser,
					connectionPassword);*/
			
			/*Context initCtx = new InitialContext();

			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			DataSource ds = (DataSource)

			envCtx.lookup("jdbc/agri_tadka");
			
			conn = ds.getConnection();*/
			
			if(conn == null){
				Class.forName("com.mysql.jdbc.Driver");  
				  
				conn=DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/fishtrader","root","admin");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return conn;
	}
	
	public void closeResultSet(ResultSet rs){
		Statement st;
		try {
			if (rs!=null){
				st = rs.getStatement();
				this.closeConnection(st);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void closeRes(ResultSet rs){
		Statement st;
		try {
			if (rs!=null){
				st = rs.getStatement();
				closeCon(st);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void closeCon(Statement st){
		Connection con = null;
		if (st!=null){
			try {
				 con = st.getConnection();
				ResultSet rs = st.getResultSet();
				if(rs!=null){
					rs.close();
					st.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally{
				if (con != null){
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
						
		}
	}
	
	public void closeConnection(Statement st){
		Connection con = null;
		if (st!=null){
			try {
				 con = st.getConnection();
				ResultSet rs = st.getResultSet();
				if(rs!=null){
					rs.close();
					st.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally{
				if (con != null){
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
						
		}
	}
	
	public void closeConnection(ResultSet rs){
		Connection con = null;
		if (rs!=null){
			
			try {
				con = rs.getStatement().getConnection();
					rs.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally{
				if (con != null){
					try {
						con.close();
						con = null;
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
						
		}
	}
	public void closeConnection(Connection conn){
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
