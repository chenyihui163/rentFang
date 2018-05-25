package com.hss.renthouse.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间提供工具类
 * @author hss
 *
 */
public class DateUtil {

	public static String getNowTime(){
		
		//当前时间
		Date date = new Date();
		//模板
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date).toString();
	}
}
