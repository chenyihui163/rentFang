package com.hss.renthouse.admins.renter.service.interfaces;

import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 租客service层
 * @author hss
 *
 */
public interface RenterService {

	/**
	 * 查询所有的租客
	 * @param vo
	 * @return
	 */
	BPageBean<Renter> queryAllRenters(BQueryVo vo);

}
