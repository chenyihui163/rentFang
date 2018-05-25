package com.hss.renthouse.admins.admin.dao;

import java.util.List;

import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 管理员模块dao层
 * @author hss
 *
 */
public interface AdminMapper {

	/**
	 * 管理员登陆
	 * @param admin
	 * @return
	 */
	Admin adminLogin(Admin admin);

	/**
	 * 查询条件下的用户总数
	 * @param vo
	 * @return
	 */
	List<Admin> queryAdmins(BQueryVo vo);

	/**
	 * 查询用户的总数
	 * @return
	 */
	Integer queryAdminsTotal();

	/**
	 * 新增管理员
	 * @param admin
	 * @return
	 */
	int addAdmin(Admin admin);

	/**
	 * 删除指定数据
	 * @param id
	 * @return
	 */
	int delAdminByid(String id);

}
