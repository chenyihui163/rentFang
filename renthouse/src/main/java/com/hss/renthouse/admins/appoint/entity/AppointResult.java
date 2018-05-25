package com.hss.renthouse.admins.appoint.entity;

import java.io.Serializable;

import com.hss.renthouse.admins.admin.entity.Admin;

/**
 * 预约结果实体
 * 
 * @author hss
 *
 */
public class AppointResult implements Serializable {

	private static final long serialVersionUID = 1L;

	// 编码
	private String rid;
	// 是否联系
	private Integer state;
	// 结果
	private Integer result;
	// 理由
	private String reason;
	// 操作人
	private String adid;
	// 预约人
	private String name;
	// 联系方式
	private String atele;
	// 预约时间
	private String antime;
	// 操作时间
	private String ctime;
	// 预约类型
	private Integer rtype;

	private String isConnect;
	private String isSuccess;

	private Admin admin;

	public Integer getRtype() {
		return rtype;
	}

	public void setRtype(Integer rtype) {
		this.rtype = rtype;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getAdid() {
		return adid;
	}

	public void setAdid(String adid) {
		this.adid = adid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getIsConnect() {
		return isConnect;
	}

	public void setIsConnect(String isConnect) {
		this.isConnect = isConnect;
	}

	public String getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(String isSuccess) {
		this.isSuccess = isSuccess;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}

	@Override
	public String toString() {
		return "AppointResult [rid=" + rid + ", state=" + state + ", result=" + result + ", reason=" + reason
				+ ", adid=" + adid + ", name=" + name + ", atele=" + atele + ", antime=" + antime + "]";
	}

}
