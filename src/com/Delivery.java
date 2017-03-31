package com;

import java.util.Date;

public class Delivery {
	private int id,issueQuantity;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIssueQuantity() {
		return issueQuantity;
	}
	public void setIssueQuantity(int issueQuantity) {
		this.issueQuantity = issueQuantity;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Asset getAsset() {
		return asset;
	}
	public void setAsset(Asset asset) {
		this.asset = asset;
	}
	public DeliveryLocation getDl() {
		return dl;
	}
	public void setDl(DeliveryLocation dl) {
		this.dl = dl;
	}
	public Date getEntryDate() {
		return entryDate;
	}
	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	public String getRequisitionNumber() {
		return requisitionNumber;
	}
	public void setRequisitionNumber(String requisitionNumber) {
		this.requisitionNumber = requisitionNumber;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getCSRNumer() {
		return CSRNumer;
	}
	public void setCSRNumer(String cSRNumer) {
		CSRNumer = cSRNumer;
	}
	private User user;
	private Asset asset;
	private DeliveryLocation dl;
	private Date entryDate,issueDate;
	private String requisitionNumber,remarks,CSRNumer;
}
