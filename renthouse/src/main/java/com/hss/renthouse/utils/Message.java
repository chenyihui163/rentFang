package com.hss.renthouse.utils;

/**
 * 负责给前端页面传递信息
 * 
 * @author hss
 *
 */
public class Message {

	private String mess;
	private String bool;

	public Message(String mess, String bool) {
		super();
		this.mess = mess;
		this.bool = bool;
	}

	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	public String getBool() {
		return bool;
	}

	public void setBool(String bool) {
		this.bool = bool;
	}

}
