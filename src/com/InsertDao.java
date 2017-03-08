package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertDao {

	public static int addAsset(String assetName, String userId) throws ClassNotFoundException, SQLException, ApplicationException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		int createdId;
		try{
			conn = ConnectionManager.getConnection();
	        
        	String query = "select ASSET_ID, ASSET_NAME from ESTATE_ASSET where ASSET_NAME = ?";
        	pst = conn.prepareStatement(query);
        	pst.setString(1, assetName);
      
        	rs = (ResultSet) pst.executeQuery();
	        if(rs.next()){
	        	throw new ApplicationException("This asset name is already present.");
	        }
	        else{
	        	query = "Insert into ESTATE_ASSET(ASSET_NAME,CREATED_BY) values (?,?)";
	        	pst = conn.prepareStatement(query);
	        	pst.setString(1, assetName);
	        	pst.setInt(2, Integer.parseInt(userId));
	        	
	        	boolean success = pst.execute();
	        	
	        	query = "select ASSET_ID, ASSET_NAME from ESTATE_ASSET where ASSET_NAME = ?";
	        	pst = conn.prepareStatement(query);
	        	pst.setString(1, assetName);
	      
	        	rs = (ResultSet) pst.executeQuery();
	        	if(rs.next()){
		        	createdId = rs.getInt(1);
		        }
	        	else{
	        		throw new ApplicationException("Data could not be inserted.");
	        	}
	        	
	        }
	    }
	    finally{
	 	   try {
	 		   pst.close();
	 		   conn.close();
	 	   } 
	 	   catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	 	   }
	    }

		return createdId;
	}

}
