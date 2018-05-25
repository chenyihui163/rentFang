package com.hss.renthouse.utils;

import java.util.List;

/**
 * 分页实体
 * 
 * @author hss
 * @param <T>
 *
 */
public class PageBean<T> {

	// 当前页的数据条数
	private int ps;
	// 总数据
	private int tr;
	// 当前页码
	private int pc;
	// 请求条件
	private String url;
	// 查询的记录
	private List<T> beanList;

	// 返回总页数
	public int getTp() {
		if (tr == 0) {
			return 1;
		}
		int tp = tr / ps;
		return tr % ps == 0 ? tp : tp + 1;
	}

	public int getPs() {
		return ps;
	}

	public void setPs(int ps) {
		this.ps = ps;
	}

	public int getTr() {
		return tr;
	}

	public void setTr(int tr) {
		this.tr = tr;
	}

	public int getPc() {
		return pc;
	}

	public void setPc(int pc) {
		this.pc = pc;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

	@Override
	public String toString() {
		return "PageBean [ps=" + ps + ", tr=" + tr + ", pc=" + pc + ", url=" + url + ", beanList=" + beanList + "]";
	}

}
