package com;

import java.util.Date;

public class Asset {
	private int id,createdBy,availableCount;
	private String assetName;
	private Date createdOn,lastAccessedOn;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getAvailableCount() {
		return availableCount;
	}
	public void setAvailableCount(int availableCount) {
		this.availableCount = availableCount;
	}
	public String getAssetName() {
		return assetName;
	}
	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public Date getLastAccessedOn() {
		return lastAccessedOn;
	}
	public void setLastAccessedOn(Date lastAccessedOn) {
		this.lastAccessedOn = lastAccessedOn;
	}
}
