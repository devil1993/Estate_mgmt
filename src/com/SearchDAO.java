package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class SearchDAO {
	public static ArrayList<Purchase> getPurchase(Date from,Date to ) throws Exception{
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
	        	//System.out.println("HIT");
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
	        throw e;
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
	
	public static ArrayList<DeliveryLocation> getAllDeliveryLocations() throws Exception{
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		ArrayList<DeliveryLocation> dlList = new ArrayList<DeliveryLocation>();
		try{
			conn = ConnectionManager.getConnection();
	        
        	String query = "select * from ESTATE_DELIVERY_LOCATIONS";
        	pst = conn.prepareStatement(query);
        	rs = (ResultSet) pst.executeQuery();
	        while(rs.next()){
	        	//System.out.println("HIT");
	        	DeliveryLocation obj = new DeliveryLocation();
	        	obj.setDlId(rs.getInt("DL_ID"));
	        	obj.setDlName(rs.getString("DL_NAME"));
	        	obj.setCreatedBy(rs.getInt("CREATED_BY"));
	        	obj.setCreatedOn(rs.getDate("CREATED_ON"));
	        	
	        	dlList.add(obj);
	        } 
	         
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	        throw e;
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

		return dlList;
	}
	
	public static ArrayList<Asset> getAllAssests(){
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		ArrayList<Asset> assetList = new ArrayList<Asset>();
		try{
			conn = ConnectionManager.getConnection();
	        
        	String query = "select * FROM ESTATE_ASSET";
        	pst = conn.prepareStatement(query);
        	rs = (ResultSet) pst.executeQuery();
	        while(rs.next()){
	        	//System.out.println("HIT");
	        	Asset obj = new Asset();
	        	obj.setId(rs.getInt("ASSET_ID"));
	        	obj.setAssetName(rs.getString("ASSET_NAME"));
	        	obj.setCreatedBy(rs.getInt("CREATED_BY"));
	        	obj.setCreatedOn(rs.getDate("CREATED_ON"));	
	        	obj.setAvailableCount(rs.getInt("ASSET_AVAILABLE_QUANTITY"));
	        	assetList.add(obj);
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

		return assetList;
	}

	public static ArrayList<Delivery> getDelivery(Date from, Date to) throws Exception {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs;
		ArrayList<Delivery> delList = new ArrayList<Delivery>();
		try{
			conn = ConnectionManager.getConnection();
	        
        	String query = "SELECT DELIVERY_ID,ENTRY_DATE,ISSUE_DATE,ISSUE_QUANTITY,"
        			+ "REQUISITION_NO,CSR_NO,REMARKS,ASSET_NAME,DL_NAME,DL_ID"
        			+ ",A.ASSET_ID,A.ASSET_AVAILABLE_QUANTITY"
        			+ " FROM ESTATE_MGMT.ESTATE_DELIVERY AS D"
        			+ " JOIN ESTATE_MGMT.ESTATE_ASSET AS A ON D.ASSET_ID = A.ASSET_ID"
        			+ " JOIN ESTATE_MGMT.ESTATE_DELIVERY_LOCATIONS DL ON D.DELIVERY_LOCATION_ID = DL.DL_ID"
        			+ " where ENTRY_DATE between ? and ?";
        	pst = conn.prepareStatement(query);
        	pst.setString(1, (from.getYear()+1900)+"-"+(from.getMonth()+1)+"-"+from.getDate());
        	pst.setString(2, (to.getYear()+1900)+"-"+(to.getMonth()+1)+"-"+to.getDate());
        	rs = (ResultSet) pst.executeQuery();
	        while(rs.next()){
	        	//System.out.println("HIT");
	        	Delivery obj = new Delivery();
	        	obj.setId(rs.getInt("DELIVERY_ID"));
	        	obj.setEntryDate(rs.getDate("ENTRY_DATE"));
	        	obj.setIssueDate(rs.getDate("ISSUE_DATE"));
	        	obj.setIssueQuantity(rs.getInt("ISSUE_QUANTITY"));	        	
	        	obj.setRequisitionNumber(rs.getString("REQUISITION_NO"));	        	
	        	obj.setCSRNumer(rs.getString("CSR_NO"));
	        	obj.setRemarks(rs.getString("REMARKS"));
	        	Asset asset = new Asset();
	        	asset.setAssetName(rs.getString("ASSET_NAME"));
	        	asset.setAvailableCount(rs.getInt("ASSET_AVAILABLE_QUANTITY"));
	        	asset.setId(rs.getInt("ASSET_ID"));
	        	obj.setAsset(asset);
	        	DeliveryLocation dl = new DeliveryLocation();
	        	dl.setDlId(rs.getInt("DL_ID"));
	        	dl.setDlName(rs.getString("DL_NAME"));
	        	obj.setDl(dl);
	        	delList.add(obj);
	        } 
	         
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	        throw e;
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

		return delList;
	}
}
