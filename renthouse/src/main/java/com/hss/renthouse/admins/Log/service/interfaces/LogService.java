package com.hss.renthouse.admins.Log.service.interfaces;

import com.hss.renthouse.admins.Log.entity.Log;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 日志管理service层接口
 * @author hss
 *
 */
public interface LogService {

	/**
	 * 插入日志
	 * @param log
	 */
	void insertLog(Log log);

	/**
	 * 跟新日志
	 * @param log
	 */
	void updateLog(Log log);

	/**
	 * 查询日志
	 * @param vo 
	 * @return
	 */
	BPageBean<Log> querySysLog(BQueryVo vo);

}
