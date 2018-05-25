package com.hss.renthouse.admins.rental.dao;

import java.util.List;

import com.hss.renthouse.admins.rental.entity.Rental;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 租金dao层
 * @author hss
 *
 */
public interface RentalMapper {

	/**
	 * 新增租金记录
	 * @param rental
	 */
	void addRental(Rental rental);

	/**
	 * 查询租金总数
	 * @return
	 */
	Integer queryRentalsTotal();

	/**
	 * 查询所有租金记录
	 * @param vo
	 * @return
	 */
	List<Rental> queryAllRentals(BQueryVo vo);

	/**
	 * 修改租金信息
	 * @param rental
	 * @return 
	 */
	int updateRental(Rental rental);

	/**
	 * 删除指定租金
	 * @param cid
	 */
	void delRentalByCid(String cid);

	/**
	 * 根据账单编码查找对应的租金信息
	 * @param bid 账单编码
	 * @return
	 */
	Rental queryRentalByBId(String bid);

	/**
	 * 修改租金的支付状态
	 * @param rental
	 */
	void updateRentalByMid(Rental rental);

}
