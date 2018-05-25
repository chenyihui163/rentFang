package com.hss.renthouse.admins.admin.entity;

import java.io.Serializable;

/**
 * 管理员实体
 * 
 * @author hss
 *
 */
public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;

	// 管理员编码
	private String aid;
	// 登录名
	private String aname;
	// 密码
	private String apasswd;
	// 是不是超级管理员
	private Integer isAdmin;
	// 角色
	private String arole;

	public Integer getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getArole() {
		return arole;
	}

	public void setArole(String arole) {
		this.arole = arole;
	}

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

	public String getApasswd() {
		return apasswd;
	}

	public void setApasswd(String apasswd) {
		this.apasswd = apasswd;
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", aname=" + aname + ", apasswd=" + apasswd + "]";
	}
}
