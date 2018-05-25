package com.hss.renthouse.utils;

import java.io.Serializable;

/**
 * 查询条件
 * 
 * @author hss
 *
 */
public class BQueryVo implements Serializable {

	private static final long serialVersionUID = 1L;
	// 每页记录数
	private Integer ps;
	// 每页显示数据的开始行号
	private Integer offset;
	// 排序字段
	private String sort;
	// 排序方式
	private String sortOrder;
	// 编码
	private String id;
	// 用户编码
	private String uid;

	// 日志查询条件
	private String aname;
	private String ltype;
	private String lmethod;
	private String loperateDate;
	private String ltimeout;

	// 预约结果查询条件
	private String antime;
	private String name;
	private String atele;
	private String result;
	private String state;

	// 预约查询条件
	private String hid;
	private String uname;
	private String atime;

	// 合同查询条件
	private String cstime;
	private String cname;
	private String ctele;
	private String cid;

	// 租客查询条件
	private String hposition;

	// 租金查询条件
	private String mtime;

	// 账单查询你条件
	private String rname;
	private String rid;

	private String search;
	private Integer rtype;

	public Integer getRtype() {
		return rtype;
	}

	public void setRtype(Integer rtype) {
		this.rtype = rtype;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getMtime() {
		return mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public String getHposition() {
		return hposition;
	}

	public void setHposition(String hposition) {
		this.hposition = hposition;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCstime() {
		return cstime;
	}

	public void setCstime(String cstime) {
		this.cstime = cstime;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCtele() {
		return ctele;
	}

	public void setCtele(String ctele) {
		this.ctele = ctele;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public String getAntime() {
		return antime;
	}

	public void setAntime(String antime) {
		this.antime = antime;
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getLtype() {
		return ltype;
	}

	public void setLtype(String ltype) {
		this.ltype = ltype;
	}

	public String getLmethod() {
		return lmethod;
	}

	public void setLmethod(String lmethod) {
		this.lmethod = lmethod;
	}

	public String getLoperateDate() {
		return loperateDate;
	}

	public void setLoperateDate(String loperateDate) {
		this.loperateDate = loperateDate;
	}

	public String getLtimeout() {
		return ltimeout;
	}

	public void setLtimeout(String ltimeout) {
		this.ltimeout = ltimeout;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Integer getPs() {
		return ps;
	}

	public void setPs(Integer ps) {
		this.ps = ps;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "BQueryVo [ps=" + ps + ", offset=" + offset + ", sort=" + sort + ", sortOrder=" + sortOrder + ", id="
				+ id + ", uid=" + uid + ", aname=" + aname + ", ltype=" + ltype + ", lmethod=" + lmethod
				+ ", loperateDate=" + loperateDate + ", ltimeout=" + ltimeout + ", antime=" + antime + ", name=" + name
				+ ", atele=" + atele + ", result=" + result + ", state=" + state + ", hid=" + hid + ", uname=" + uname
				+ ", atime=" + atime + ", cstime=" + cstime + ", cname=" + cname + ", ctele=" + ctele + ", cid=" + cid
				+ ", hposition=" + hposition + ", mtime=" + mtime + ", rname=" + rname + ", rid=" + rid + ", search="
				+ search + ", rtype=" + rtype + "]";
	}
}
