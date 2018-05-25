package com.hss.renthouse.user.user.dao;

import java.util.List;

import com.hss.renthouse.admins.admin.entity.ContractsAndHouseAndRenter;
import com.hss.renthouse.user.user.entity.User;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 用户模块dao层接口
 * @author hss
 *
 */
public interface UserMapper {

	/**
	 * 校验电话号码是否被注册
	 * @param utele
	 * @return
	 */
	int checkTelephoneIsExist(String utele);

	/**
	 * 根据电话号码和密码查找用户
	 * @param user
	 * @return
	 */
	User getUserByUteleAndUpasswd(User user);

	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	Integer regist(User user);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	int updateUser(User user);

	/**
	 * 查询用户总数
	 * @param vo
	 * @return
	 */
	Integer queryUsersTotal(BQueryVo vo);

	/**
	 * 查询所有用户
	 * @param vo
	 * @return
	 */
	List<User> queryUsers(BQueryVo vo);

	/**
	 * 查询用户对应得房源合同租客总数
	 * @param vo
	 * @return
	 */
	Integer queryContractsAndHouseAndRenterTotal(BQueryVo vo);

	/**
	 * 查询用户对应得房源合同租客
	 * @param vo
	 * @return
	 */
	List<ContractsAndHouseAndRenter> queryContractsAndHouseAndRenters(BQueryVo vo);

}
