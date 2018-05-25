package com.hss.renthouse.user.house.entity;

import java.io.Serializable;

/**
 * 房源图片实体
 * @author hss
 *
 */
public class Imgs implements Serializable {

	private static final long serialVersionUID = 1L;
	//图片编码
	private String iid;
	//图片路径
	private String iimg;
	//所属房子
	private String hid;
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getIimg() {
		return iimg;
	}
	public void setIimg(String iimg) {
		this.iimg = iimg;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	@Override
	public String toString() {
		return "Imgs [iid=" + iid + ", iimg=" + iimg + ", hid=" + hid + "]";
	}
}
