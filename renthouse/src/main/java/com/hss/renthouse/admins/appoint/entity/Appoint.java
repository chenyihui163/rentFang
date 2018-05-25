package com.hss.renthouse.admins.appoint.entity;

import java.io.Serializable;

import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.user.entity.User;

/**
 * 预约看房实体
 * 
 * @author hss
 *
 */
public class Appoint implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//预约编码
	private String aid;
	//预约人
	private String aname;
	//联系电话
	private String atele;
	//预约时间
	private String antime;
	//看房时间
	private String atime;
	//是否预约了客户(0：未预约/1:已预约)
	private Integer state;
	//预约看的房子
	private String hid;
	//用户编码
	private String uid;
	
	//是否预约了
	private String isConnect;
	
	private House house;
	private User user;

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAtele() {
		return atele;
	}

	public void setAtele(String atele) {
		this.atele = atele;
	}

	public String getAntime() {
		return antime;
	}

	public void setAntime(String antime) {
		this.antime = antime;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getIsConnect() {
		return isConnect;
	}

	public void setIsConnect(String isConnect) {
		this.isConnect = isConnect;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Appoint [aid=" + aid + ", aname=" + aname + ", atele=" + atele + ", antime=" + antime + ", gatime="
				+ atime + ", state=" + state + ", hid=" + hid + ", uid=" + uid + ", isConnect=" + isConnect
				+ ", house=" + house + ", user=" + user + "]";
	}
	
}
