package com.hss.renthouse.admins.Log.entity;

import java.io.Serializable;

import java.util.Map;

import com.hss.renthouse.utils.StringUtils;

/**
 * 日志类-记录用户操作行为
 * 
 * @author hss
 *
 */
public class Log implements Serializable {
	private static final long serialVersionUID = 1L;

	private String lid; // 日志主键
	private String ltype; // 日志类型
	private String ltitle; // 日志标题
	private String lremoteAddr; // 请求地址
	private String lrequestUri; // URI
	private String lmethod; // 请求方式
	private String lparams; // 提交参数
	private String lexception; // 异常
	private String loperateDate; // 开始时间
	private String ltimeout; // 结束时间
	private String aid; // 用户ID

	private String aname;

	public String getLid() {
		return lid;
	}

	public void setLid(String lid) {
		this.lid = lid;
	}

	public String getLtype() {
		return ltype;
	}

	public void setLtype(String ltype) {
		this.ltype = ltype;
	}

	public String getLtitle() {
		return ltitle;
	}

	public void setLtitle(String ltitle) {
		this.ltitle = ltitle;
	}

	public String getLremoteAddr() {
		return lremoteAddr;
	}

	public void setLremoteAddr(String lremoteAddr) {
		this.lremoteAddr = lremoteAddr;
	}

	public String getLrequestUri() {
		return lrequestUri;
	}

	public void setLrequestUri(String lrequestUri) {
		this.lrequestUri = lrequestUri;
	}

	public String getLmethod() {
		return lmethod;
	}

	public void setLmethod(String lmethod) {
		this.lmethod = lmethod;
	}

	public String getLparams() {
		return lparams;
	}

	public void setLparams(String lparams) {
		this.lparams = lparams;
	}

	public String getLexception() {
		return lexception;
	}

	public void setLexception(String lexception) {
		this.lexception = lexception;
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

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "Log [lid=" + lid + ", ltype=" + ltype + ", ltitle=" + ltitle + ", lremoteAddr=" + lremoteAddr
				+ ", lrequestUri=" + lrequestUri + ", lmethod=" + lmethod + ", lparams=" + lparams + ", lexception="
				+ lexception + ", loperateDate=" + loperateDate + ", ltimeout=" + ltimeout + ", aid=" + aid + ", aname="
				+ aname + "]";
	}

	/**
	 * 设置请求参数
	 * 
	 * @param paramMap
	 */
	public void setMapToParams(Map<String, String[]> paramMap) {
		if (paramMap == null) {
			return;
		}
		StringBuilder params = new StringBuilder();
		for (Map.Entry<String, String[]> param : ((Map<String, String[]>) paramMap).entrySet()) {
			params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
			String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
			params.append(StringUtils.abbr(StringUtils.endsWithIgnoreCase(param.getKey(), "apasswd") ? "" : paramValue,
					100));
		}
		this.lparams = params.toString();
	}

}