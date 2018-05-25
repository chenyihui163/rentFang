package com.hss.renthouse.admins.Log.service.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hss.renthouse.admins.Log.dao.LogMapper;
import com.hss.renthouse.admins.Log.entity.Log;
import com.hss.renthouse.admins.Log.service.interfaces.LogService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 日志管理service层实现
 * @author hss
 *
 */

@Service
public class LogServiceImpl implements LogService{

	@Autowired
	private LogMapper logMapper;
	
	@Override
	@Transactional
	public void insertLog(Log log) {
		logMapper.insertLog(log);
	}

	@Override
	@Transactional
	public void updateLog(Log log) {
		logMapper.updateLog(log);
	}

	@Override
	public BPageBean<Log> querySysLog(BQueryVo vo) {
		
		//得到日志的总记录数
		Integer total = logMapper.queryTotalLogs(vo);
		//按条件查询日志
		List<Log> logs = logMapper.querySysLog(vo);
		
		BPageBean<Log> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(logs);
		return pb;
	}

}
