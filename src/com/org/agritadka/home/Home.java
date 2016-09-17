package com.org.agritadka.home;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.org.agritadka.generic.ConnectionsUtil;
import com.org.agritadka.transfer.Table;

public class Home {
	
	public LinkedHashMap<Integer, List<Table>> getTables() throws SQLException{
		
		ConnectionsUtil connectionsUtil = new ConnectionsUtil();
		Connection conn = connectionsUtil.getConnection();
		
		String query = "select tm.table_type_id, t.table_id, t.table_name from table_type_name_map ttn "+
						"inner join table_type_master tm on ttn.table_type_id = tm.table_type_id "+
						"inner join table_master t on ttn.table_id = t.table_id "+
						"where t.is_active = 1 and ttn.is_active = 1 && tm.is_active = 1 "+
						"order by tm.table_type_id, t.table_id";
		
		ResultSet dataRS = conn.createStatement().executeQuery(query);
		LinkedHashMap<Integer, List<Table>> tableMap = new LinkedHashMap<Integer, List<Table>>();
		Integer previousTblTypeId = 0, currentTblTypeId = 0;
		Table table;
		List<Table> tableList = new ArrayList<Table>();
		
		while(dataRS.next()){
			
			currentTblTypeId = dataRS.getInt("table_type_id");
			if(previousTblTypeId != currentTblTypeId && previousTblTypeId != 0){
				tableMap.put(previousTblTypeId, tableList);
				tableList = new ArrayList<Table>();
			}
			table = new Table();
			table.setTableId(dataRS.getInt("table_id"));
			table.setTableName(dataRS.getString("table_name"));
			tableList.add(table);
			previousTblTypeId = currentTblTypeId;
		}
		
		if(tableList.size() > 0){
			tableMap.put(previousTblTypeId, tableList);
		}
		
		connectionsUtil.closeConnection(conn);
		return tableMap;
	}

}
