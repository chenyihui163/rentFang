package com.hss.renthouse.admins.renter.dao;

import java.util.List;

import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 租客模块dao层
 * @author hss
 *
 */
public interface RenterMapper {

	/**
	 * 新增租客
	 * @param renter
	 */
	void addRenter(Renter renter);

	/**
	 * 查询租客总数
	 * @return
	 */
	Integer queryRentersTotal();

	/**
	 * 查询所有租客
	 * @param vo
	 * @return
	 */
	List<Renter> queryAllRenters(BQueryVo vo);

	/**
	 * 查询租客信息
	 * @param cid
	 * @return
	 */
	Renter queryRenterByCid(String cid);

	/**
	 * 删除指定租客
	 * @param cid
	 */
	void delRenterByCid(String cid);

}
