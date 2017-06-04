package com;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class LoginDAO {

	public static User authenticate(String username, String password) throws ApplicationException, ClassNotFoundException, SQLException{
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		User user = null;
		try{
			conn = ConnectionManager.getConnection();
	        
        	String query = "select USR_ID, USR_NAME, USR_FULL_NAME, USR_CREATED_BY, USR_LAST_ACCESS, USR_LAST_UPDATE from ESTATE_USERS where USR_NAME = ? AND USR_PASSWORD = ?";
        	pst = conn.prepareStatement(query);
        	pst.setString(1, username);
        	pst.setString(2, password);
          	rs = (ResultSet) pst.executeQuery();
	        if(!rs.next()){
	        	throw new ApplicationException("User not found");
	        }
	        else{
	        	user = new User();
	        	user.setId(rs.getInt(1));
	        	user.setName(username);
	        	user.setFullName(rs.getString(3));
	        	user.setCreatedBy(rs.getString(4));
	        	user.setLastAccess(rs.getDate(5));
	        	user.setLastUpdate(rs.getDate(6));
	        	
	        	query = "UPDATE ESTATE_USERS SET USR_LAST_ACCESS = CURRENT_TIMESTAMP WHERE USR_ID = ?";
	        	pst = conn.prepareStatement(query);
	        	pst.setInt(1, user.getId());	        	
	        	boolean success = pst.execute();	    
	        }
		}
		finally {
			try {
		 		   pst.close();
		 		   conn.close();
		 	   } 
		 	   catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
		 	   }
		}
		return user;
	}

	public static void resetPasseord(String userName, String password) throws ClassNotFoundException, SQLException, ApplicationException {
		Connection conn = null;
		CallableStatement callableStatement = null;
		System.out.println(userName+" "+password);
		try{
			conn = ConnectionManager.getConnection();
			String query = "{call ResetPassword(?,?,?)}";
        	callableStatement = conn.prepareCall(query);
        	callableStatement.setString(1, userName);
        	callableStatement.setString(2, password);
        	callableStatement.registerOutParameter(3, java.sql.Types.INTEGER);
        	
        	callableStatement.executeUpdate();
        	int res = callableStatement.getInt(3);
        	System.out.println(res);
        	if(res <= 0){
        		throw new ApplicationException("Unable to reset password.");
        	}
		}
		finally {
			try {
		 		   callableStatement.close();
		 		   conn.close();
		 	   } 
		 	   catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
		 	   }
		}
	}

	public static boolean createUser(String fullName, String userName, String password, String name) throws SQLException, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		User user = null;
		try{
			conn = ConnectionManager.getConnection();
	        
			String query = "INSERT INTO ESTATE_USERS(USR_NAME,USR_FULL_NAME,USR_PASSWORD,USR_CREATED_BY) VALUES(?,?,?,?)";
        	pst = conn.prepareStatement(query);
        	pst.setString(1, userName);
        	pst.setString(2, fullName);
        	pst.setString(3, password);
        	pst.setString(4, name);
        	int success = pst.executeUpdate();	
	        return success==1;
		}
		finally {
			try {
		 		   pst.close();
		 		   conn.close();
		 	   } 
		 	   catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
		 	   }
		}
	}

}
