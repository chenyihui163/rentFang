package com.hss.renthouse.user.house.entity;

import java.io.Serializable;

/**
 * 房源实体类
 * 
 * @author hss
 *
 */
public class House implements Serializable {

	private static final long serialVersionUID = 1L;
	// 房子编码
	private String hid;
	// 房源标题
	private String hname;
	// 居住类型(0：合租/1：整租)
	private String hmethod;
	// 月租金
	private String hprice;
	// 出租类型(0：日租房/1：短租房/2：长租房)
	private String htype;
	// 面积
	private String harea;
	// 户型
	private String hmodel;
	// 付款方式
	private Integer hpaytype;
	// 朝向
	private String htoward;
	// 楼层
	private String hfloor;
	// 区域
	private String hposition;
	// 地铁
	private String hsubway;
	// 状态（0：未出租/1：已出租）
	private String hstate;
	// 联系方式
	private String htele;
	// 图片
	private String himg;
	// 详细描述
	private String hdesc;
	// 房源归属
	private Integer hbelong;

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHmethod() {
		return hmethod;
	}

	public void setHmethod(String hmethod) {
		this.hmethod = hmethod;
	}

	public String getHprice() {
		return hprice;
	}

	public void setHprice(String hprice) {
		this.hprice = hprice;
	}

	public String getHtype() {
		return htype;
	}

	public void setHtype(String htype) {
		this.htype = htype;
	}

	public String getHarea() {
		return harea;
	}

	public void setHarea(String harea) {
		this.harea = harea;
	}

	public String getHmodel() {
		return hmodel;
	}

	public void setHmodel(String hmodel) {
		this.hmodel = hmodel;
	}

	public Integer getHpaytype() {
		return hpaytype;
	}

	public void setHpaytype(Integer hpaytype) {
		this.hpaytype = hpaytype;
	}

	public String getHfloor() {
		return hfloor;
	}

	public void setHfloor(String hfloor) {
		this.hfloor = hfloor;
	}

	public String getHposition() {
		return hposition;
	}

	public void setHposition(String hposition) {
		this.hposition = hposition;
	}

	public String getHsubway() {
		return hsubway;
	}

	public void setHsubway(String hsubway) {
		this.hsubway = hsubway;
	}

	public String getHstate() {
		return hstate;
	}

	public void setHstate(String hstate) {
		this.hstate = hstate;
	}

	public String getHtele() {
		return htele;
	}

	public void setHtele(String htele) {
		this.htele = htele;
	}

	public String getHimg() {
		return himg;
	}

	public void setHimg(String himg) {
		this.himg = himg;
	}

	public String getHdesc() {
		return hdesc;
	}

	public void setHdesc(String hdesc) {
		this.hdesc = hdesc;
	}

	public String getHtoward() {
		return htoward;
	}

	public void setHtoward(String htoward) {
		this.htoward = htoward;
	}

	public Integer getHbelong() {
		return hbelong;
	}

	public void setHbelong(Integer hbelong) {
		this.hbelong = hbelong;
	}

	
	public String toString() {
		return "House [hid=" + hid + ", hname=" + hname + ", hmethod=" + hmethod + ", hprice=" + hprice + ", htype="
				+ htype + ", harea=" + harea + ", hmodel=" + hmodel + ", hpaytype=" + hpaytype + ", htoward=" + htoward
				+ ", hfloor=" + hfloor + ", hposition=" + hposition + ", hsubway=" + hsubway + ", hstate=" + hstate
				+ ", htele=" + htele + ", himg=" + himg + ", hdesc=" + hdesc + ", hbelong=" + hbelong + "]";
	}

}
