package com.hss.renthouse.admins.renter.entity;

import java.io.Serializable;

import com.hss.renthouse.user.house.entity.House;

/**
 * 房东实体类
 * 
 * @author hss
 *
 */

public class Owner implements Serializable {

	private static final long serialVersionUID = 1L;

	private String oid;
	private String oname;
	private String otele;
	private String hid;
	private String cid;

	private House house;

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOtele() {
		return otele;
	}

	public void setOtele(String otele) {
		this.otele = otele;
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

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	@Override
	public String toString() {
		return "Owner [oid=" + oid + ", oname=" + oname + ", otele=" + otele + ", hid=" + hid + ", cid=" + cid
				+ ", house=" + house + "]";
	}
}
