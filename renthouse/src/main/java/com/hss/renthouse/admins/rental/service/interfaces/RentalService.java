package com.hss.renthouse.admins.rental.service.interfaces;

import com.hss.renthouse.admins.rental.entity.Rental;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 租金service层
 * @author hss
 *
 */
public interface RentalService {

	/**
	 * 查询所有的租金单
	 * @param vo
	 * @return
	 */
	BPageBean<Rental> queryAllRenters(BQueryVo vo);

	/**
	 * 检查勾选的用户是否已经存在了本月账单
	 * @param cid 合同编码
	 */
	void checkSendBill(String cid);

}
