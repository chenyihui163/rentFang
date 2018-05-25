package com.hss.renthouse.admins.appoint.dao;

import java.util.List;

import com.hss.renthouse.admins.appoint.entity.Appoint;
import com.hss.renthouse.admins.appoint.entity.AppointResult;
import com.hss.renthouse.admins.appoint.entity.Join;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 预约dao层接口
 * 
 * @author hss
 *
 */

public interface AppointMapper {

	/**
	 * 查询预约总数
	 * 
	 * @param vo
	 * @return
	 */
	Integer queryAppointTotal(BQueryVo vo);

	/**
	 * 查询所有的预约
	 * 
	 * @param vo
	 * @return
	 */
	List<Appoint> queryAllAppoints(BQueryVo vo);

	/**
	 * 查询所有的加盟
	 * 
	 * @param vo
	 * @return
	 */
	List<Join> queryAllJoins(BQueryVo vo);

	/**
	 * 查询业主加盟总数
	 * 
	 * @param vo
	 * @return
	 */
	Integer queryJoinsTotal(BQueryVo vo);

	/**
	 * 删除预约单
	 * 
	 * @param aid
	 * @return
	 */
	int delAppointByAid(String aid);

	/**
	 * 新增预约结果
	 * 
	 * @param appointResult
	 * @return
	 */
	int addAppointResult(AppointResult appointResult);

	/**
	 * 查询预约结果总数
	 * 
	 * @param vo
	 * @return
	 */
	Integer queryAppointResultsTotal(BQueryVo vo);

	/**
	 * 查询所有预约结果
	 * 
	 * @param vo
	 * @return
	 */
	List<AppointResult> queryAllAppointResults(BQueryVo vo);

	/**
	 * 查询指定预约单
	 * 
	 * @param aid
	 *            预约单编码
	 * @return
	 */
	Appoint getAppointByAid(String aid);

	/**
	 * 删除业主加盟预约单
	 * 
	 * @param jid
	 * @return
	 */
	int delJoinAppointByAid(String jid);

	/**
	 * 删除预约结果单
	 * 
	 * @param jid
	 */
	void delJoinByJid(String jid);

}
