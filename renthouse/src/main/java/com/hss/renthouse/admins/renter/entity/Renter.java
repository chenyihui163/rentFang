package com.hss.renthouse.admins.renter.entity;

import java.io.Serializable;

import com.hss.renthouse.admins.contract.entity.Contract;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.user.entity.User;

/**
 * 租客实体
 * 
 * @author hss
 *
 */
public class Renter implements Serializable {

	private static final long serialVersionUID = 1L;

	// 租客编码
	private String rid;
	// 用户编码
	private String uid;
	// 房源编码
	private String hid;
	// 合同编码
	private String cid;

	private User user;
	private House house;
	private Contract contract;

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	@Override
	public String toString() {
		return "Renter [rid=" + rid + ", uid=" + uid + ", hid=" + hid + ", cid=" + cid + ", user=" + user + ", house="
				+ house + ", contract=" + contract + "]";
	}

}
