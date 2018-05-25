package com.hss.renthouse.admins.appoint.entity;

import java.io.Serializable;

/**
 * 业主加盟实体
 * 
 * @author hss
 *
 */
public class Join implements Serializable {

	private static final long serialVersionUID = 1L;
	// 加盟房编码
	private String jid;
	// 房东名字
	private String jname;
	// 房东联系方式
	private String jtele;
	// 房源位置
	private String jposition;
	// 是否处理
	private Integer state;
	// 是否联系
	private String isConnect;
	// 预约时间
	private String jtime;

	public String getJtime() {
		return jtime;
	}

	public void setJtime(String jtime) {
		this.jtime = jtime;
	}

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}

	public String getJname() {
		return jname;
	}

	public void setJname(String jname) {
		this.jname = jname;
	}

	public String getJtele() {
		return jtele;
	}

	public void setJtele(String jtele) {
		this.jtele = jtele;
	}

	public String getJposition() {
		return jposition;
	}

	public void setJposition(String jposition) {
		this.jposition = jposition;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getIsConnect() {
		return isConnect;
	}

	public void setIsConnect(String isConnect) {
		this.isConnect = isConnect;
	}

	@Override
	public String toString() {
		return "Join [jid=" + jid + ", jname=" + jname + ", jtele=" + jtele + ", jposition=" + jposition + ", state="
				+ state + ", isConnect=" + isConnect + "]";
	}

}
