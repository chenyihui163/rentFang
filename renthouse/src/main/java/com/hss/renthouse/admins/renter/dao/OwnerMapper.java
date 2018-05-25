package com.hss.renthouse.admins.renter.dao;

import java.util.List;

import com.hss.renthouse.admins.renter.entity.Owner;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 房东dao层
 * @author hss
 *
 */
public interface OwnerMapper {

	/**
	 * 新增房东信息
	 * @param o
	 * @return
	 */
	int addOwner(Owner o);

	/**
	 * 统计房东总数
	 * @return
	 */
	Integer queryOwnersTotal();

	/**
	 * 查询所有得房东
	 * @param vo
	 * @return
	 */
	List<Owner> queryAllOwners(BQueryVo vo);

	/**
	 * 修改房东信息
	 * @param o
	 */
	void updateOwnerByOid(Owner o);

	/**
	 * 删除房东信息
	 * @param cid
	 */
	void delOwnerByCid(String cid);

}
