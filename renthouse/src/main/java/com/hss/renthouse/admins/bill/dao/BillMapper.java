package com.hss.renthouse.admins.bill.dao;

import java.util.List;

import com.hss.renthouse.admins.bill.entity.Bill;
import com.hss.renthouse.admins.bill.entity.RenterBill;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 账单dao
 * @author hss
 *
 */
public interface BillMapper {

	/**
	 * 添加账单信息
	 * @param b
	 * @return 
	 */
	int addBill(Bill b);

	/**
	 * 统计账单总数
	 * @param vo 
	 * @return
	 */
	Integer queryBillsTotal(BQueryVo vo);

	/**
	 * 查询所有账单
	 * @param vo
	 * @return
	 */
	List<Bill> queryAllBills(BQueryVo vo);

	/**
	 * 查询用户的账单
	 * @param uid
	 * @return
	 */
	List<Bill> queryBillByUid(String uid);

	/**
	 * 更新账单
	 * @param bill
	 * @return 
	 */
	int updateStatus(Bill bill);

	/**
	 * 查询指定租客的账单
	 * @param rid
	 * @return
	 */
	List<Bill> queryBillByRid(String rid);

	/**
	 * 删除指定账单
	 * @param bid
	 * @return 
	 */
	void delBillByRid(String rid);

	/**
	 * 检查勾选的用户是否已经存在了本月账单
	 * @param cid 合同编码
	 * @return
	 */
	Bill checkSendBill(String cid);

	/**
	 * 删除指定账单
	 * @param bid
	 * @return
	 */
	int delBillByBid(String bid);

	/**
	 * 修改账单
	 * @param bill
	 * @return
	 */
	int updateBill(Bill bill);

	/**
	 * 查询本月未支付人数
	 * @param vo
	 * @return
	 */
	Integer queryRenterBillsTotal(BQueryVo vo);

	/**
	 * 查询所有未支付的记录
	 * @param vo
	 * @return
	 */
	List<RenterBill> queryUnPayRenters(BQueryVo vo);

}
