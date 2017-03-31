package com;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;


public class AddDeliveryDAO {
	public static void insertDeliveredAsset(int loggedInUser, Delivery delivery) throws SQLException, ApplicationException, ClassNotFoundException {
		// TODO Auto-generated method stub
		Connection conn = null;
		CallableStatement callableStatement = null;
		
		try{
			conn = ConnectionManager.getConnection();
        
	        if (conn == null) {
	    		System.out.println("sorry");
	    	}
	        else{
		        	String query = "{call InsertDelivery(?,?,?,?,?,?,?,?,?)}";
		        	callableStatement = conn.prepareCall(query);
		        	callableStatement.setInt(1, delivery.getAsset().getId());
		        	callableStatement.setInt(2, delivery.getDl().getDlId());
		        	callableStatement.setInt(3, loggedInUser);
		        	callableStatement.setTimestamp(4, new Timestamp(delivery.getIssueDate().getTime()));
		        	callableStatement.setInt(5, delivery.getIssueQuantity());
		        	callableStatement.setString(6, delivery.getRequisitionNumber());
		        	callableStatement.setString(7, delivery.getCSRNumer());
		        	callableStatement.setString(8, delivery.getRemarks());
		        	callableStatement.registerOutParameter(9, java.sql.Types.INTEGER);
		        	
		        	callableStatement.executeUpdate();
		        	int res = callableStatement.getInt(9);
		        	System.out.println(res);
		        	if(res <= 0){
		        		throw new ApplicationException("Unable to record Delivery.");
		        	}
	        	}
		}
        finally{
        	callableStatement.close();
  		   	conn.close();
        }
	}

}
