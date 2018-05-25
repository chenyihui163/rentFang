package com.hss.renthouse.admins.renter.service.interfaces;

import com.hss.renthouse.admins.appoint.entity.Join;
import com.hss.renthouse.admins.renter.entity.Owner;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 房东service层
 * @author hss
 *
 */
public interface OwnerService {

	/**
	 * 增加房源新形象
	 * @param join
	 * @param hid 房源编码
	 * @param aid 管理员编码
	 */
	void addOwner(Join join, String hid, String aid);

	/**
	 * 查询所有得房东信息
	 * @param vo
	 * @return
	 */
	BPageBean<Owner> queryAllOwners(BQueryVo vo);

}
