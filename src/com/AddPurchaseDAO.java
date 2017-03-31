package com;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class AddPurchaseDAO {

	public static void insertPurchasedAsset(int assetId,
			int purchased_quantity, Purchase purchase) throws ClassNotFoundException, SQLException, ApplicationException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		Calendar cal = Calendar.getInstance();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
		
		try{
			conn = ConnectionManager.getConnection();
        
	        if (conn == null) {
	    		System.out.println("sorry");
	    	}
	        else{
	        	pst = conn.prepareStatement("Select ASSET_AVAILABLE_QUANTITY from ESTATE_ASSET where ASSET_ID=?");
	        	pst.setInt(1, assetId);
	        	rs =pst.executeQuery();
	        	if(rs.next()){
	        		System.out.println("Quantity  " + rs.getInt(1));
	        		int updated_quantity = rs.getInt(1) + purchase.getPurchaseQuantity();
	        		
	        		pst = (PreparedStatement) conn.prepareStatement("Update ESTATE_ASSET set ASSET_AVAILABLE_QUANTITY = ?, LAST_ACCESSED_ON = ? where ASSET_ID=?");
		        	pst.setInt(1, updated_quantity);
		        	pst.setTimestamp(2, timestamp);
	        		pst.setInt(3, assetId);
		        	int updated = pst.executeUpdate();
		        	if(updated<=0){
		        		throw new ApplicationException("Problem in adding amount to the asset.");
		        	}
	        	}
	        	
	        	//Insert purchased Asset in Database
	        	String query = "insert into ESTATE_PURCHASE(ENTRY_DATE, USER, APPROVAL_DATE, APPROVED_QUANTITY, PURCHASE_QUANTITY, UNIT_COST, " +
						"SPECIFICATION, SUPPLIER_DETAILS, BILL_NO, BILL_DATE, CSR_NO, REMARKS, ASSET_ID) " +
						"values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pst = conn.prepareStatement(query);
				System.out.println(pst);
				pst.setTimestamp(1, timestamp);
				pst.setInt(2, 1);
				pst.setTimestamp(3, new Timestamp(purchase.getApprovalDate().getTime()));
				pst.setInt(4, purchase.getApprovedQuantity());
				pst.setInt(5, purchase.getPurchaseQuantity());
				pst.setFloat(6, purchase.getUnitCost());
				pst.setString(7, purchase.getSpecification());
				pst.setString(8, purchase.getSupplierDetails());
				pst.setString(9, purchase.getBillNo());
				pst.setTimestamp(10, new Timestamp(purchase.getBillDate().getTime()));
				pst.setString(11, purchase.getCSRNo());
				pst.setString(12, purchase.getRemarks());
				pst.setInt(13, assetId);
				int updated = pst.executeUpdate();
	        	if(updated<=0){
	        		throw new ApplicationException("Problem in Inserting the purchase record.");
	        	}
	        }
		} 
		catch(Exception e){
			e.printStackTrace();
			throw e;
		}
        finally{
     		   pst.close();
     		   conn.close();
     	   
        }
	}

}