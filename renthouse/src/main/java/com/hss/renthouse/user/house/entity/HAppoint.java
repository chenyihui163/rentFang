package com.hss.renthouse.user.house.entity;

import java.io.Serializable;

/**
 * 预约看房实体
 * @author hss
 *
 */
public class HAppoint implements Serializable {

	private static final long serialVersionUID = 1L;
	
	//预约编码
	private String aid;
	//预约人
	private String aname;
	//联系方式
	private String atele;
	//预约时间
	private String antime;
	//看房时间
	private String atime;
	//预约是否成功（0：未预约/1:已预约）
	private Integer state;
	//看哪个房子
	private String hid;
	//用户编码
	private String uid;
	
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
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Appoint [aid=" + aid + ", aname=" + aname + ", atele=" + atele + ", antime=" + antime + ", atime="
				+ atime + ", state=" + state + ", hid=" + hid + ", uid=" + uid + "]";
	}
}
