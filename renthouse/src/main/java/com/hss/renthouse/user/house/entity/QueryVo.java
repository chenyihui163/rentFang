package com.hss.renthouse.user.house.entity;

/**
 * 查询条件实体
 * @author hss
 *
 */
public class QueryVo {

	//房子编码
	private String hid;
	//房子标题
	private String hname;
	//地铁
	private String hsubway;
	//户型
	private String hmodel;
	//出租类型
	private String htype;
	//居住类型
	private String hmethod;
	//位置
	private String hposition;
	//价格区间 低价
	private Double lprice;
	//价格区间 高价价
	private Double hpric;
	//limit x
	private Integer x;
	//limit , y
	private Integer y;
	//区分前台还是后台访问 
	private Integer method;
	
	//搜索框不定查询
	private String searchVal;
	
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
	public String getHsubway() {
		return hsubway;
	}
	public void setHsubway(String hsubway) {
		this.hsubway = hsubway;
	}
	public String getHmodel() {
		return hmodel;
	}
	public void setHmodel(String hmodel) {
		this.hmodel = hmodel;
	}
	
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}
	public String getHmethod() {
		return hmethod;
	}
	public void setHmethod(String hmethod) {
		this.hmethod = hmethod;
	}
	public String getHposition() {
		return hposition;
	}
	public void setHposition(String hposition) {
		this.hposition = hposition;
	}
	public Double getLprice() {
		return lprice;
	}
	public void setLprice(Double lprice) {
		this.lprice = lprice;
	}
	public Double getHpric() {
		return hpric;
	}
	public void setHpric(Double hpric) {
		this.hpric = hpric;
	}
	public Integer getX() {
		return x;
	}
	public void setX(Integer x) {
		this.x = x;
	}
	public Integer getY() {
		return y;
	}
	public void setY(Integer y) {
		this.y = y;
	}
	
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	
	public Integer getMethod() {
		return method;
	}
	public void setMethod(Integer method) {
		this.method = method;
	}
	@Override
	public String toString() {
		return "QueryVo [hid=" + hid + ", hname=" + hname + ", hsubway=" + hsubway + ", hmodel=" + hmodel + ", htype="
				+ htype + ", hmethod=" + hmethod + ", hposition=" + hposition + ", lprice=" + lprice + ", hpric="
				+ hpric + ", x=" + x + ", y=" + y + ", searchVal=" + searchVal + "]";
	}
}
