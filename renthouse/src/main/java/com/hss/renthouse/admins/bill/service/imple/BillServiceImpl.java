package com.hss.renthouse.admins.bill.service.imple;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hss.renthouse.admins.bill.dao.BillMapper;
import com.hss.renthouse.admins.bill.entity.Bill;
import com.hss.renthouse.admins.bill.entity.RenterBill;
import com.hss.renthouse.admins.bill.service.interfaces.BillService;
import com.hss.renthouse.admins.rental.dao.RentalMapper;
import com.hss.renthouse.admins.rental.entity.Rental;
import com.hss.renthouse.admins.renter.dao.RenterMapper;
import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.DateUtils;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 账单service实现
 * 
 * @author hss
 *
 */
@Service
public class BillServiceImpl implements BillService {

	@Autowired
	private BillMapper billMapper;
	@Autowired
	private RenterMapper renterMapper;
	@Autowired
	private RentalMapper rentalMapper;

	@Override
	public BPageBean<Bill> queryAllBills(BQueryVo vo) {
		// 得到合同的总记录数
		Integer total = billMapper.queryBillsTotal(vo);
		// 按条件查询用户
		List<Bill> bills = billMapper.queryAllBills(vo);

		BPageBean<Bill> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(bills);
		return pb;
	}

	@Override
	public List<Bill> queryBillByUid(String uid) {
		return billMapper.queryBillByUid(uid);
	}

	@Override
	@Transactional
	public void updateStatus(String bid, Integer state) {
		Bill bill = new Bill();

		bill.setBid(bid);
		// 设置支付时间
		String time = DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
		bill.setBpaytime(time);
		// 状态
		bill.setBstate(state);

		int count = billMapper.updateStatus(bill);

		// 支付成功
		if (count == 1) {
			// 得到租金信息
			Rental rental = rentalMapper.queryRentalByBId(bid);
			// 修改上次支付时间
			rental.setMptime(rental.getMtime());
			// 设置本月实际支付时间
			rental.setMtime(time);
			// 计算下次交租时间 如果下下交租时间等于本月 那么就要计算下次交租时间
			if (rental.getMntime().split("-")[1].equals(time.split("-")[1])) {
				rental.setMntime(DateUtils.addMonth(1));
			}

			rentalMapper.updateRentalByMid(rental);
		}
	}

	@Override
	@Transactional
	public void sendBill(String mprice, String uid, String cid) {
		Bill bill = new Bill();
		// 设置编码
		bill.setBid(UUIDUtil.getUuid());
		// 设置价钱
		bill.setBprice(Double.parseDouble(mprice));
		// 设置用户编码
		bill.setUid(uid);
		// 设置事由
		bill.setBdue("本月房租账单");
		// 生成时间
		bill.setBtime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		// 设置状态
		bill.setBstate(0);
		bill.setBpaytime("");

		// 查询租客信息
		Renter renter = renterMapper.queryRenterByCid(cid);
		if (renter != null) {
			bill.setRid(renter.getRid());
		} else {
			throw new RuntimeException("发送账单失败");
		}

		// 发送账单
		int count = billMapper.addBill(bill);
		if (count != 1) {
			throw new RuntimeException("发送账单失败");
		}
	}

	@Override
	@Transactional
	public void delBillByBid(String bid) {
		int count = billMapper.delBillByBid(bid);
		if (count != 1) {
			throw new RuntimeException("删除账单失败");
		}
	}

	@Override
	public void updateBill(Bill bill) {
		// 修改账单生成时间
		bill.setBtime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
		int count = billMapper.updateBill(bill);
		if (count != 1) {
			throw new RuntimeException("修改账单失败");
		}
	}

	@Override
	public BPageBean<RenterBill> queryUnPayRenters(BQueryVo vo) {
		// 得到合同的总记录数
		Integer total = billMapper.queryRenterBillsTotal(vo);
		// 按条件查询用户
		List<RenterBill> rb = billMapper.queryUnPayRenters(vo);

		BPageBean<RenterBill> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(rb);
		return pb;
	}

}
