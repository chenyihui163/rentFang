package com.hss.renthouse.user.house.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hss.renthouse.user.house.dao.HouseMapper;
import com.hss.renthouse.user.house.entity.HAppoint;
import com.hss.renthouse.user.house.entity.HJoin;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.entity.Imgs;
import com.hss.renthouse.user.house.entity.QueryVo;
import com.hss.renthouse.user.house.service.interfaces.HouseService;
import com.hss.renthouse.utils.DateUtils;
import com.hss.renthouse.utils.PageBean;
import com.hss.renthouse.utils.PageEnum;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 房源service实现层
 * @author hss
 *
 */

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseMapper houseMapper;
	
	@Override
	public List<House> queryHouses() {
		return houseMapper.queryHouses();
	}

	@Override
	public House queryHouseByHid(String hid) {
		return houseMapper.queryHouseByHid(hid);
	}

	@Override
	public List<Imgs> getAllImgsByHid(String hid) {
		return houseMapper.getAllImgsByHid(hid);
	}

	@Override
	@Transactional
	public void addAppoint(HAppoint app) {
		
		//预约编码
		String aid = UUIDUtil.getUuid();
		//预约状态
		app.setState(0);
		app.setAid(aid);
		
		int count = houseMapper.addAppoint(app);
		
		if(count != 1){
			throw new RuntimeException("预约失败，请重新预约");
		}
	}

	@Override
	public PageBean<House> queryHousesByCondition(QueryVo vo, int pc) {
		
		//设置每页显示的数量
		Integer ps = PageEnum.HOUSES_PAGE_SIZE;
		//设置limit x, y
		vo.setX((pc-1)*ps);
		vo.setY(ps);
		
		//得到条件下的总记录数
		Integer tr = houseMapper.getCountByCondition(vo);
		if(tr == null){
			tr = 1;
		}
		
		//查询条件下的所有房源
		List<House> hs = houseMapper.queryHousesByCondition(vo);
		
		PageBean<House> pb = new PageBean<>();
		
		pb.setBeanList(hs);
		pb.setPs(ps);
		pb.setTr(tr);
		
		return pb;
	}

	@Override
	@Transactional
	public void joinHouse(HJoin join) {
		String jid = UUIDUtil.getUuid();
		join.setJid(jid);
		join.setState(0);
		join.setJtime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		int count = houseMapper.joinHouse(join);
		if(count != 1){
			throw new RuntimeException("不好意思，委托失败，请您稍后再试");
		}

	}

	@Override
	@Transactional
	public void delAllImgsByHid(String hid) {
		houseMapper.delAllImgsByHid(hid);
	}

	@Override
	@Transactional
	public void delHouseByHid(String hid) {
		int count = houseMapper.delHouseByHid(hid);
		if(count != 1){
			throw new RuntimeException("删除房源信息[" + hid + "]失败");
		}
	}

	@Override
	@Transactional
	public void addImgs(String hid, String newName) {
		Imgs imgs = new Imgs();
		imgs.setIid(UUIDUtil.getUuid());
		imgs.setIimg(newName);
		imgs.setHid(hid);
		houseMapper.addImgs(imgs);
	}

	@Override
	@Transactional
	public void updateHouseByHid(House house) {
		
		int count = houseMapper.updateHouseByHid(house);
		
		if(count != 1){
			throw new RuntimeException("更新房源信息[" + house.getHid() + "]失败");
		}
	}

	@Override
	@Transactional
	public void addHouse(House house) {
		
		int count = houseMapper.addHouse(house);
		
		if(count != 1){
			throw new RuntimeException("新增房源信息失败");
		}
	}
}
