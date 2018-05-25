package com.hss.renthouse.admins.bill.entity;

import java.io.Serializable;

import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.user.user.entity.User;

/**
 * 账单实体
 * 
 * @author hss
 *
 */
public class Bill implements Serializable {

	private static final long serialVersionUID = 1L;

	// 账单编码
	private String bid;
	// 生成时间
	private String btime;
	// 账单金额
	private Double bprice;
	// 事由
	private String bdue;
	// 账单状态
	private Integer bstate;
	// 支付时间
	private String bpaytime;
	// 用户编码
	private String uid;
	private String rid;

	private Renter renter;
	private User user;
	private String isPay;

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Renter getRenter() {
		return renter;
	}

	public void setRenter(Renter renter) {
		this.renter = renter;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public Double getBprice() {
		return bprice;
	}

	public void setBprice(Double bprice) {
		this.bprice = bprice;
	}

	public String getBdue() {
		return bdue;
	}

	public void setBdue(String bdue) {
		this.bdue = bdue;
	}

	public Integer getBstate() {
		return bstate;
	}

	public void setBstate(Integer bstate) {
		this.bstate = bstate;
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

	public String getIsPay() {
		return isPay;
	}

	public void setIsPay(String isPay) {
		this.isPay = isPay;
	}

	public String getBpaytime() {
		return bpaytime;
	}

	public void setBpaytime(String bpaytime) {
		this.bpaytime = bpaytime;
	}

	@Override
	public String toString() {
		return "Bill [bid=" + bid + ", btime=" + btime + ", bprice=" + bprice + ", bdue=" + bdue + ", bstate=" + bstate
				+ ", bpaytime=" + bpaytime + ", uid=" + uid + ", user=" + user + ", isPay=" + isPay + "]";
	}
}
