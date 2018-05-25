package com.hss.renthouse.utils;

import java.util.UUID;

/**
 * 返回一个随机编码
 * 
 * @author hss
 *
 */
public class UUIDUtil {

	public static String getUuid(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
