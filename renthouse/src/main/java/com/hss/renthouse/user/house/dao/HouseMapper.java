package com.hss.renthouse.user.house.dao;

import java.util.List;

import com.hss.renthouse.user.house.entity.HAppoint;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.entity.Imgs;
import com.hss.renthouse.user.house.entity.HJoin;
import com.hss.renthouse.user.house.entity.QueryVo;

/**
 * 房源模块dao层接口
 * @author hss
 *
 */
public interface HouseMapper {

	/**
	 * 查找房源
	 * 	首页展示
	 * @return
	 */
	List<House> queryHouses();

	/**
	 * 根据编码查询房子
	 * @param hid
	 * @return
	 */
	House queryHouseByHid(String hid);

	/**
	 * 查找该房子的所有图片
	 * @param hid
	 * @return
	 */
	List<Imgs> getAllImgsByHid(String hid);

	/**
	 * 看房预约
	 * @param app
	 * @return
	 */
	int addAppoint(HAppoint app);

	/**
	 * 查询条件下的总数量
	 * @param vo
	 * @return
	 */
	Integer getCountByCondition(QueryVo vo);

	/**
	 * 查询条件下的所有房源
	 * @param vo
	 * @return
	 */
	List<House> queryHousesByCondition(QueryVo vo);

	/**
	 * 业主加盟
	 * @param join
	 * @return
	 */
	int joinHouse(HJoin join);

	/**
	 * 删除房源的图片集
	 * @param hid
	 */
	void delAllImgsByHid(String hid);

	/**
	 * 删除房源信息
	 * @param hid
	 * @return
	 */
	int delHouseByHid(String hid);

	/**
	 * 增加房源图片
	 * @param imgs
	 */
	void addImgs(Imgs imgs);

	/**
	 * 更新房源信息
	 * @param house
	 * @return
	 */
	int updateHouseByHid(House house);

	/**
	 * 新增房源信息
	 * @param house
	 * @return
	 */
	int addHouse(House house);

	/**
	 * 修改房源状态
	 * @param hid
	 */
	void updateHouseStateByHid(String hid);
}
