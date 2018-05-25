package com.hss.renthouse.user.user.entity;

import java.io.Serializable;
import java.util.List;

import com.hss.renthouse.admins.contract.entity.Contract;
import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.user.house.entity.House;

/**
 * 用户实体类
 * 
 * @author hss
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	// 用户编码
	private String uid;
	// 用户名称
	private String uname;
	// 登陆密码
	private String upasswd;
	// 联系方式
	private String utele;
	// 邮件
	private String uemail;

	private List<Contract> contracts;
	private List<Renter> renters;
	private List<House> houses;

	public List<House> getHouses() {
		return houses;
	}

	public void setHouses(List<House> houses) {
		this.houses = houses;
	}

	public List<Contract> getContracts() {
		return contracts;
	}

	public void setContracts(List<Contract> contracts) {
		this.contracts = contracts;
	}

	public List<Renter> getRenters() {
		return renters;
	}

	public void setRenters(List<Renter> renters) {
		this.renters = renters;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpasswd() {
		return upasswd;
	}

	public void setUpasswd(String upasswd) {
		this.upasswd = upasswd;
	}

	public String getUtele() {
		return utele;
	}

	public void setUtele(String utele) {
		this.utele = utele;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upasswd=" + upasswd + ", utele=" + utele + ", uemail="
				+ uemail + ", contracts=" + contracts + ", renters=" + renters + ", houses=" + houses + "]";
	}

}
