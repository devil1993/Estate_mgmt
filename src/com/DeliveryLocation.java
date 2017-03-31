package com;

import java.util.Date;

public class DeliveryLocation {
	private String dlName;
	private Date createdOn;
	private int dlId,createdBy;
	public String getDlName() {
		return dlName;
	}
	public void setDlName(String dlName) {
		this.dlName = dlName;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public int getDlId() {
		return dlId;
	}
	public void setDlId(int dlId) {
		this.dlId = dlId;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
}
