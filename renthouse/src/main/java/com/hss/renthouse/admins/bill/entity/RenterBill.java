package com.hss.renthouse.admins.bill.entity;

import java.io.Serializable;

/**
 * 客户账单实体
 * 
 * @author hss
 *
 */
public class RenterBill implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String uname;
	private String utele;
	private String btime;
	private String bprice;
	private String hid;
	private String cid;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUtele() {
		return utele;
	}

	public void setUtele(String utele) {
		this.utele = utele;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public String getBprice() {
		return bprice;
	}

	public void setBprice(String bprice) {
		this.bprice = bprice;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

}
