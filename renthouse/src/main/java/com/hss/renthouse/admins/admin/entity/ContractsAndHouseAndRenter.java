package com.hss.renthouse.admins.admin.entity;

import java.io.Serializable;

/**
 * 用户对应得房源租客合同
 * 
 * @author hss
 *
 */

public class ContractsAndHouseAndRenter implements Serializable {

	private static final long serialVersionUID = 1L;

	private String uid;
	private String cid;
	private String cname;
	private String ctele;
	private String hid;
	private String rid;

	@Override
	public String toString() {
		return "ContractsAndHouseAndRenter [uid=" + uid + ", cid=" + cid + ", cname=" + cname + ", ctele=" + ctele
				+ ", hid=" + hid + ", rid=" + rid + "]";
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCtele() {
		return ctele;
	}

	public void setCtele(String ctele) {
		this.ctele = ctele;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

}
