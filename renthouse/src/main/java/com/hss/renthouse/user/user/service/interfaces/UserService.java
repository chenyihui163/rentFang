package com.hss.renthouse.user.user.service.interfaces;

import com.hss.renthouse.admins.admin.entity.ContractsAndHouseAndRenter;
import com.hss.renthouse.user.user.entity.User;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 用户模块service层
 * 
 * @author hss
 *
 */
public interface UserService {

	/**
	 * 校验手机号码是否被注册
	 * @param utele
	 */
	void checkTelephoneIsExist(String utele);

	/**
	 * 登陆
	 * @param user
	 */
	User login(User user);

	/**
	 * 校验手机号码是否被注册
	 * @param utele
	 */
	void checkUteleIsExist(String utele);

	/**
	 * 用户注册
	 * @param user
	 */
	void regist(User user);

	/**
	 * 更新用户信息
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 查询所有用户
	 * @param vo
	 * @return
	 */
	BPageBean<User> queryUsers(BQueryVo vo);

	/**
	 * 查询用户对应得房源合同租客
	 * @param vo
	 * @return
	 */
	BPageBean<ContractsAndHouseAndRenter> getUserSubMenuByUId(BQueryVo vo);
}
