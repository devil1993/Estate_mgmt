package com;

import java.util.Date;

public class Purchase {
	private int id,approvedQuantity,purchaseQuantity;
	public int getId() {
		return id;
	}
	public int getApprovedQuantity() {
		return approvedQuantity;
	}
	public int getPurchaseQuantity() {
		return purchaseQuantity;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public Date getBillDate() {
		return billDate;
	}
	public User getUser() {
		return user;
	}
	public float getUnitCost() {
		return unitCost;
	}
	public String getSpecification() {
		return specification;
	}
	public String getSupplierDetails() {
		return supplierDetails;
	}
	public String getBillNo() {
		return billNo;
	}
	public String getCSRNo() {
		return CSRNo;
	}
	public String getRemarks() {
		return remarks;
	}
	public Asset getAsset() {
		return asset;
	}
	Date entryDate,approvalDate,billDate;
	public void setId(int id) {
		this.id = id;
	}
	public void setApprovedQuantity(int approvedQuantity) {
		this.approvedQuantity = approvedQuantity;
	}
	public void setPurchaseQuantity(int purchaseQuantity) {
		this.purchaseQuantity = purchaseQuantity;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUnitCost(float unitCost) {
		this.unitCost = unitCost;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public void setSupplierDetails(String supplierDetails) {
		this.supplierDetails = supplierDetails;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public void setCSRNo(String cSRNo) {
		CSRNo = cSRNo;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public void setAsset(Asset asset) {
		this.asset = asset;
	}
	private User user;
	private float unitCost;
	private String specification,supplierDetails,billNo,CSRNo,remarks;
	private Asset asset;
}
