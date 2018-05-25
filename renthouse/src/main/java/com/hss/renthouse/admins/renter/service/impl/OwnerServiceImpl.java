package com.hss.renthouse.admins.renter.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hss.renthouse.admins.appoint.dao.AppointMapper;
import com.hss.renthouse.admins.appoint.entity.AppointResult;
import com.hss.renthouse.admins.appoint.entity.Join;
import com.hss.renthouse.admins.renter.dao.OwnerMapper;
import com.hss.renthouse.admins.renter.entity.Owner;
import com.hss.renthouse.admins.renter.service.interfaces.OwnerService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.DateUtils;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 房东service实现层
 * 
 * @author hss
 *
 */
@Service
public class OwnerServiceImpl implements OwnerService {

	@Autowired
	private OwnerMapper ownerMapper;
	@Autowired
	private AppointMapper appointMapper;
	
	@Override
	public void addOwner(Join join, String hid, String aid) {
		Owner o = new Owner();
		//设置编码
		o.setOid(UUIDUtil.getUuid());
		if(join != null){
			//设置房东名
			o.setOname(join.getJname());
			//设置联系方式
			o.setOtele(join.getJtele());
			//设置房源编码
			o.setHid(hid);
			//设置合同编码
			o.setCid("");
			
			//新增房东信息
			int count = ownerMapper.addOwner(o);
			if(count != 1){
				throw new RuntimeException("新增房东信息失败");
			}else{
				AppointResult ar = new AppointResult();
				ar.setRid(UUIDUtil.getUuid());
				ar.setState(1);
				ar.setResult(1);
				ar.setReason("");
				ar.setName(join.getJname());
				ar.setAtele(join.getJtele());
				ar.setAntime(join.getJtime());
				ar.setAdid(aid);
				ar.setCtime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH-mm-ss"));
				ar.setRtype(1);
				//增加预约结果单
				appointMapper.addAppointResult(ar);
				//删除加盟预约单
				appointMapper.delJoinByJid(join.getJid());
			}
			
		}else{
			throw new RuntimeException("录入房源信息失败");
		}
	}

	@Override
	public BPageBean<Owner> queryAllOwners(BQueryVo vo) {
		// 得到租客的总记录数
		Integer total = ownerMapper.queryOwnersTotal();
		// 按条件查询用户
		List<Owner> owners = ownerMapper.queryAllOwners(vo);

		BPageBean<Owner> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(owners);
		return pb;
	}

}
