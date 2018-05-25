package com.hss.renthouse.admins.contract.entity;

import java.io.Serializable;

import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.user.house.entity.House;

/**
 * 合同实体
 * 
 * @author hss
 *
 */
public class Contract implements Serializable {

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
	// 支付方式(0：月付/1：年付)
	private Integer cpaytype;
	// 押金方式
	private Integer ccashtype;
	// 押金
	private Double ccash;
	// 租金
	private Double cmoney;
	// 租期
	private String crtime;
	// 交租时间
	private String cpaytime;
	// 房源信息
	private String hid;
	// 操作人
	private String adid;
	// 签约者编码
	private String uid;

	private String payType;
	private String cashType;
	private House house;
	private Admin admin;

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getCashType() {
		return cashType;
	}

	public void setCashType(String cashType) {
		this.cashType = cashType;
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

	public Integer getCpaytype() {
		return cpaytype;
	}

	public void setCpaytype(Integer cpaytype) {
		this.cpaytype = cpaytype;
	}

	public Integer getCcashtype() {
		return ccashtype;
	}

	public void setCcashtype(Integer ccashtype) {
		this.ccashtype = ccashtype;
	}

	public Double getCcash() {
		return ccash;
	}

	public void setCcash(Double ccash) {
		this.ccash = ccash;
	}

	public String getCpaytime() {
		return cpaytime;
	}

	public void setCpaytime(String cpaytime) {
		this.cpaytime = cpaytime;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public House getHouse() {
		return house;
	}

	public void setHouse(House house) {
		this.house = house;
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

	public String getAdid() {
		return adid;
	}

	public void setAdid(String adid) {
		this.adid = adid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	@Override
	public String toString() {
		return "Contract [cid=" + cid + ", cname=" + cname + ", ccompany=" + ccompany + ", ctele=" + ctele
				+ ", ccompanytele=" + ccompanytele + ", cstime=" + cstime + ", cetime=" + cetime + ", cpaytype="
				+ cpaytype + ", ccashtype=" + ccashtype + ", ccash=" + ccash + ", cmoney=" + cmoney + ", crtime="
				+ crtime + ", cpaytime=" + cpaytime + ", hid=" + hid + ", adid=" + adid + ", uid=" + uid + ", house="
				+ house + "]";
	}

}
