package com.hss.renthouse.admins.admin.service.interfaces;

import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 管理员模块service层接口
 * @author hss
 *
 */
public interface AdminService {

	/**
	 * 管理员登陆
	 * @param admin
	 */
	Admin adminLogin(Admin admin);

	BPageBean<Admin> queryAdmins(BQueryVo vo);

	/**
	 * 新增普通管理员
	 * @param admin
	 */
	void addAdmin(Admin admin);

	/**
	 * 删除指定数据
	 * @param id
	 */
	void delAdminByid(String id);

}
