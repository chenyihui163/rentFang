package com.hss.renthouse.admins.renter.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hss.renthouse.admins.renter.dao.RenterMapper;
import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.admins.renter.service.interfaces.RenterService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 租客service实现层
 * 
 * @author hss
 *
 */
@Service
public class RenterServiceImpl implements RenterService {

	@Autowired
	private RenterMapper renterMapper;

	@Override
	public BPageBean<Renter> queryAllRenters(BQueryVo vo) {
		// 得到租客的总记录数
		Integer total = renterMapper.queryRentersTotal();
		// 按条件查询用户
		List<Renter> renters = renterMapper.queryAllRenters(vo);

		BPageBean<Renter> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(renters);
		return pb;
	}

}
