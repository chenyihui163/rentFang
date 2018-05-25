package com.hss.renthouse.utils;

import java.util.List;

/**
 * BootStrap Table的参数实体
 * 
 * @author hss
 *
 */
public class BPageBean<T> {

	// 总记录数
	private Integer total;
	// 分页数据
	private List<T> rows;

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "BPageBean [total=" + total + ", rows=" + rows + "]";
	}

}
