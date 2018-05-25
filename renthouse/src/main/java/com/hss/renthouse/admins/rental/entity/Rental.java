package com.hss.renthouse.admins.rental.entity;

import java.io.Serializable;

import com.hss.renthouse.admins.contract.entity.Contract;
import com.hss.renthouse.user.user.entity.User;

/**
 * 租金实体类
 * 
 * @author hss
 *
 */
public class Rental implements Serializable {

	private static final long serialVersionUID = 1L;

	// 租金编码
	private String mid;
	// 交租人
	private String mname;
	// 联系方式
	private String mtele;
	// 上次交租时间
	private String mptime;
	// 本月应交租时间
	private String mstime;
	// 本月交租时间
	private String mtime;
	// 下次交租时间
	private String mntime;
	// 租金
	private Double mprice;
	// 用户编码
	private String uid;
	private String cid;

	private Contract contract;
	private User user;

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtele() {
		return mtele;
	}

	public void setMtele(String mtele) {
		this.mtele = mtele;
	}

	public String getMptime() {
		return mptime;
	}

	public void setMptime(String mptime) {
		this.mptime = mptime;
	}

	public String getMstime() {
		return mstime;
	}

	public void setMstime(String mstime) {
		this.mstime = mstime;
	}

	public String getMtime() {
		return mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public String getMntime() {
		return mntime;
	}

	public void setMntime(String mntime) {
		this.mntime = mntime;
	}

	public Double getMprice() {
		return mprice;
	}

	public void setMprice(Double mprice) {
		this.mprice = mprice;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Rental [mid=" + mid + ", mname=" + mname + ", mtele=" + mtele + ", mptime=" + mptime + ", mstime="
				+ mstime + ", mtime=" + mtime + ", mntime=" + mntime + ", mprice=" + mprice + ", uid=" + uid + ", user="
				+ user + "]";
	}

}
