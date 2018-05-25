package com.hss.renthouse.user.house.service.interfaces;

import java.util.List;

import com.hss.renthouse.user.house.entity.HAppoint;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.entity.Imgs;
import com.hss.renthouse.user.house.entity.HJoin;
import com.hss.renthouse.user.house.entity.QueryVo;
import com.hss.renthouse.utils.PageBean;

/**
 * 房源service层接口
 * @author hss
 *
 */
public interface HouseService {

	/**
	 * 查询房源
	 * @return
	 */
	List<House> queryHouses();

	/**
	 * 根据编码查询房子详细
	 * @param hid
	 * @return
	 */
	House queryHouseByHid(String hid);

	/**
	 * 查找该该房子的所有图片
	 * @param hid
	 * @return
	 */
	List<Imgs> getAllImgsByHid(String hid);

	/**
	 * 预约看房
	 * @param app
	 */
	void addAppoint(HAppoint app);

	/**
	 * 按条件查询房源 
	 * @param vo 查询条件实体
	 * @param pc 
	 * @return
	 */
	PageBean<House> queryHousesByCondition(QueryVo vo, int pc);

	/**
	 * 业主加盟
	 * @param join
	 */
	void joinHouse(HJoin join);

	/**
	 * 删除房源的所有图片
	 * @param hid
	 */
	void delAllImgsByHid(String hid);

	/**
	 * 删除房源信息
	 * @param hid
	 */
	void delHouseByHid(String hid);

	/**
	 * 增加房源图片
	 * @param hid
	 * @param newName
	 */
	void addImgs(String hid, String newName);

	/**
	 * 更新房源信息
	 * @param house
	 */
	void updateHouseByHid(House house);

	/**
	 * 新增房源信息
	 * @param house
	 */
	void addHouse(House house);
}
