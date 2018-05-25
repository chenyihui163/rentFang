package com.hss.renthouse.admins.contract.entity;

import java.io.Serializable;

import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.user.house.entity.House;

/**
 * 房东合同实体
 * 
 * @author hss
 *
 */

public class OwnerContract implements Serializable {

	private static final long serialVersionUID = 1L;

	// 合同编码
	private String cid;
	// 乙方名字
	private String cname;
	// 甲方
	private String ccompany;
	// 乙方电话
	private String ctele;
	// 甲方电话
	private String ccompanytele;
	// 签约时间
	private String cstime;
	// 到期时间
	private String cetime;
	// 租金
	private Double cmoney;
	// 租期
	private String crtime;
	// 房源信息
	private String hid;
	// 操作人
	private String adid;
	private House house;
	private Admin admin;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
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

	public String getCcompany() {
		return ccompany;
	}

	public void setCcompany(String ccompany) {
		this.ccompany = ccompany;
	}

	public String getCtele() {
		return ctele;
	}

	public void setCtele(String ctele) {
		this.ctele = ctele;
	}

	public String getCcompanytele() {
		return ccompanytele;
	}

	public void setCcompanytele(String ccompanytele) {
		this.ccompanytele = ccompanytele;
	}

	public String getCstime() {
		return cstime;
	}

	public void setCstime(String cstime) {
		this.cstime = cstime;
	}

	public String getCetime() {
		return cetime;
	}

	public void setCetime(String cetime) {
		this.cetime = cetime;
	}

	public Double getCmoney() {
		return cmoney;
	}

	public void setCmoney(Double cmoney) {
		this.cmoney = cmoney;
	}

	public String getCrtime() {
		return crtime;
	}

	public void setCrtime(String crtime) {
		this.crtime = crtime;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getAdid() {
		return adid;
	}

	public void setAdid(String adid) {
		this.adid = adid;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
	}

	@Override
	public String toString() {
		return "OwnerController [cid=" + cid + ", cname=" + cname + ", ccompany=" + ccompany + ", ctele=" + ctele
				+ ", ccompanytele=" + ccompanytele + ", cstime=" + cstime + ", cetime=" + cetime + ", cmoney=" + cmoney
				+ ", crtime=" + crtime + ", hid=" + hid + ", adid=" + adid + ", house=" + house + "]";
	}

}
