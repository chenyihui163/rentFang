package com.hss.renthouse.admins.Log.dao;

import java.util.List;

import com.hss.renthouse.admins.Log.entity.Log;
import com.hss.renthouse.utils.BQueryVo;

public interface LogMapper {

	/**
	 * 插入日志
	 * @param log
	 */
	void insertLog(Log log);

	/**
	 * 更新日志
	 * @param log
	 */
	void updateLog(Log log);

	/**
	 * 获取日志的总数
	 * @param vo 
	 * @return
	 */
	Integer queryTotalLogs(BQueryVo vo);

	/**
	 * 查询日志
	 * @param vo
	 * @return
	 */
	List<Log> querySysLog(BQueryVo vo);
}
