package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class SearchDAO {
	public static ArrayList<Purchase> getPurchase(Date from,Date to ){
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		ArrayList<Purchase> purList = new ArrayList<Purchase>();
		try{
			conn = ConnectionManager.getConnection();
	        
        	String query = "select * from ESTATE_PURCHASE where ENTRY_DATE between ? and ?";
        	pst = conn.prepareStatement(query);
        	pst.setString(1, (from.getYear()+1900)+"-"+(from.getMonth()+1)+"-"+from.getDate());
        	pst.setString(2, (to.getYear()+1900)+"-"+(to.getMonth()+1)+"-"+to.getDate());
        	rs = (ResultSet) pst.executeQuery();
	        while(rs.next()){
	        	System.out.println("HIT");
	        	Purchase obj = new Purchase();
	        	obj.setId(rs.getInt(1));
	        	obj.setEntryDate(rs.getDate(2));
	        	obj.setApprovalDate(rs.getDate(4));
	        	obj.setApprovedQuantity(rs.getInt(5));
	        	obj.setPurchaseQuantity(rs.getInt(6));
	        	obj.setUnitCost(rs.getFloat(7));
	        	obj.setSpecification(rs.getString(8));
	        	obj.setSupplierDetails(rs.getString(9));
	        	obj.setBillNo(rs.getString(10));
	        	obj.setBillDate(rs.getDate(11));
	        	obj.setCSRNo(rs.getString(12));
	        	obj.setRemarks(rs.getString(13));
	        	purList.add(obj);
	        } 
	         
	    }
	    catch(Exception e) {
	        e.printStackTrace();
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

		return purList;
	}
}
