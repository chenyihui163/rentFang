package com.hss.renthouse.admins.appoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hss.renthouse.admins.appoint.dao.AppointMapper;
import com.hss.renthouse.admins.appoint.entity.Appoint;
import com.hss.renthouse.admins.appoint.entity.AppointResult;
import com.hss.renthouse.admins.appoint.entity.Join;
import com.hss.renthouse.admins.appoint.service.interfaces.AppointService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.DateUtil;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 预约管理service实现层
 * 
 * @author hss
 *
 */

@Service
public class AppointServiceImpl implements AppointService {

	@Autowired
	private AppointMapper appointMapper;

	@Override
	public BPageBean<Appoint> queryAllAppoints(BQueryVo vo) {
		// 得到用户的总记录数
		Integer total = appointMapper.queryAppointTotal(vo);
		// 按条件查询用户
		List<Appoint> appoints = appointMapper.queryAllAppoints(vo);

		BPageBean<Appoint> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(appoints);
		return pb;
	}

	@Override
	public BPageBean<Join> queryAllJoins(BQueryVo vo) {
		// 得到用户的总记录数
		Integer total = appointMapper.queryJoinsTotal(vo);
		// 按条件查询用户
		List<Join> joins = appointMapper.queryAllJoins(vo);

		BPageBean<Join> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(joins);
		return pb;
	}

	@Override
	@Transactional
	public void cancelAppiontByAid(AppointResult appointResult, String aid) {
		//设置编码
		appointResult.setRid(UUIDUtil.getUuid());
		//设置结果
		appointResult.setResult(0);
		//设置操作时间
		String date = DateUtil.getNowTime();
		appointResult.setCtime(date);
		
		//删除预约单
		int count = appointMapper.delAppointByAid(aid);
		if(count != 1){
			throw new RuntimeException("删除预约单[" + aid + "]失败");
		}
		
		//设置结果类型
		appointResult.setRtype(0);
		//新增预约结果
		count = appointMapper.addAppointResult(appointResult);
		if(count != 1){
			throw new RuntimeException("增加预约结果失败");
		}
	}

	@Override
	public BPageBean<AppointResult> queryAllAppointResults(BQueryVo vo) {
		// 得到预约结果的总记录数
		Integer total = appointMapper.queryAppointResultsTotal(vo);
		// 按条件查询用户
		List<AppointResult> appointResult = appointMapper.queryAllAppointResults(vo);

		BPageBean<AppointResult> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(appointResult);
		return pb;
	}

	@Override
	@Transactional
	public void cancelJoinAppoint(AppointResult appointResult, String jid) {
		//设置编码
		appointResult.setRid(UUIDUtil.getUuid());
		//设置结果
		appointResult.setResult(0);
		//设置操作时间
		String date = DateUtil.getNowTime();
		appointResult.setCtime(date);
		
		//删除加盟预约单
		int count = appointMapper.delJoinAppointByAid(jid);
		if(count != 1){
			throw new RuntimeException("删除预约单[" + jid + "]失败");
		}
		
		//设置结果类型
		appointResult.setRtype(1);
		//新增预约结果
		count = appointMapper.addAppointResult(appointResult);
		if(count != 1){
			throw new RuntimeException("增加预约结果失败");
		}
	}
}
