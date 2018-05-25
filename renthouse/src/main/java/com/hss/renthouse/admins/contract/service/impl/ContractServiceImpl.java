package com.hss.renthouse.admins.contract.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hss.renthouse.admins.appoint.dao.AppointMapper;
import com.hss.renthouse.admins.appoint.entity.Appoint;
import com.hss.renthouse.admins.appoint.entity.AppointResult;
import com.hss.renthouse.admins.bill.dao.BillMapper;
import com.hss.renthouse.admins.bill.entity.Bill;
import com.hss.renthouse.admins.contract.dao.ContractMapper;
import com.hss.renthouse.admins.contract.entity.Contract;
import com.hss.renthouse.admins.contract.entity.OwnerContract;
import com.hss.renthouse.admins.contract.service.interfaces.ContractService;
import com.hss.renthouse.admins.rental.dao.RentalMapper;
import com.hss.renthouse.admins.rental.entity.Rental;
import com.hss.renthouse.admins.renter.dao.OwnerMapper;
import com.hss.renthouse.admins.renter.dao.RenterMapper;
import com.hss.renthouse.admins.renter.entity.Owner;
import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.user.house.dao.HouseMapper;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.DateUtil;
import com.hss.renthouse.utils.DateUtils;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 合同service层实现
 * @author hss
 *
 */

@Service
public class ContractServiceImpl implements ContractService {

	@Autowired
	private ContractMapper contractMapper;
	@Autowired
	private AppointMapper appointMapper;
	@Autowired
	private HouseMapper houserMapper;
	@Autowired
	private RenterMapper renterMapper;
	@Autowired
	private RentalMapper rentalMapper;
	@Autowired
	private BillMapper billMapper;
	@Autowired
	private HouseMapper houseMapper;
	@Autowired
	private OwnerMapper ownerMapper;
	
	@Override
	@Transactional
	public void addContract(Contract con, String aid) {
		//设置合同编码
		con.setCid(UUIDUtil.getUuid());
		//生成合同
		int count = contractMapper.addContract(con);
		
		if(count != 1){
			throw new RuntimeException("签约失败");
		}else{
			//修改房源为已出租
			houserMapper.updateHouseStateByHid(con.getHid());
			//生成预约结果单
			AppointResult ar = new AppointResult();
			//得到该预约单
			Appoint app = appointMapper.getAppointByAid(aid);
			
			//生成预约结果编码
			ar.setRid(UUIDUtil.getUuid());
			ar.setState(1);
			ar.setResult(1);
			ar.setReason("");
			ar.setAdid(con.getAdid());
			ar.setName(app.getAname());
			ar.setAtele(app.getAtele());
			ar.setAntime(app.getAntime());
			ar.setCtime(DateUtil.getNowTime());
			count = appointMapper.addAppointResult(ar);
			
			//插入租客记录
			Renter renter = new Renter();
			renter.setRid(UUIDUtil.getUuid());
			renter.setUid(con.getUid());
			renter.setHid(con.getHid());
			renter.setCid(con.getCid());
			renterMapper.addRenter(renter);
			
			//插入租金记录
			Rental  rental = new Rental();
			//账单实体
			Bill b = new Bill();
			
			rental.setMid(UUIDUtil.getUuid());
			rental.setMname(con.getCname());
			rental.setMtele(con.getCtele());
			//上个月交租时间
			rental.setMptime("");
			//每月应交租时间
			rental.setMstime(con.getCpaytime());
			//本月实际交租时间
			rental.setMtime("");
			
			//如果押金方式为0，押一付一,月份加1
			if(con.getCcashtype() == 0){
				//计算下次交租时间
				rental.setMntime(DateUtils.addMonth(1));
				//设置账单金额 房租+押金
				b.setBprice(con.getCmoney() + con.getCcash());
			}else if( con.getCcashtype() == 1 ){
				//计算下次交租时间,月份加3
				rental.setMntime(DateUtils.addMonth(3));
				b.setBprice(3*con.getCmoney() + con.getCcash());
			}
			//租金
			rental.setMprice(con.getCmoney());
			rental.setUid(con.getUid());
			rental.setCid(con.getCid());
			rentalMapper.addRental(rental);
			
			//发送账单给用户
			b.setBid(UUIDUtil.getUuid());
			b.setBtime(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
			b.setBdue("本月房组和押金");
			b.setBstate(0);
			b.setBpaytime("");
			b.setUid(con.getUid());
			b.setRid(renter.getRid());
			billMapper.addBill(b);
			
			if(count != 1){
				throw new RuntimeException("签约失败");
			}else{
				//删除预约单
				count = appointMapper.delAppointByAid(aid);
				if(count != 1){
					throw new RuntimeException("签约失败");
				}
			}
		}
	}

	@Override
	public BPageBean<Contract> queryAllContract(BQueryVo vo) {
		// 得到合同的总记录数
		Integer total = contractMapper.queryContractsTotal(vo);
		// 按条件查询用户
		List<Contract> contracts = contractMapper.queryAllContracts(vo);

		BPageBean<Contract> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(contracts);
		return pb;
	}

	@Override
	public List<Contract> queryContractByUid(String uid) {
		return contractMapper.queryContractByUid(uid);
	}

	@Override
	@Transactional
	public void updateContract(Contract contract) {
		int count = contractMapper.updateContract(contract);
		
		if(count != 1){
			throw new RuntimeException("修改合同失败");
		}else{
			//修改租金
			Rental rental = new Rental();
			rental.setMprice(contract.getCmoney());
			rental.setMstime(contract.getCpaytime());
			rental.setMname(contract.getCname());
			rental.setMtele(contract.getCtele());
			rental.setCid(contract.getCid());
			count = rentalMapper.updateRental(rental);
			if(count != 1){
				throw new RuntimeException("修改合同失败");
			}
		}
	}

	@Override
	@Transactional
	public void delContractByCid(Contract con) {
		
		//得到该合同下的租客信息
		Renter renter = renterMapper.queryRenterByCid(con.getCid());
		if( renter != null ){
			//查询该租客下是否有没有缴清的账单
			List<Bill> bills = billMapper.queryBillByRid(renter.getRid());
			if(bills != null && bills.size() != 0){
				throw new RuntimeException("删除合同失败, 该合同下还有未缴清的账单");
			}else{
				//删除该用户下的所有账单
				//billMapper.delBillByRid(renter.getRid());
				//删除该合同的租金
				rentalMapper.delRentalByCid(con.getCid());
				//删除该租客信息
				renterMapper.delRenterByCid(con.getCid());
				//删除该合同
				contractMapper.delContractBycid(con.getCid());
				
				//修改房源的状态未0
				houseMapper.updateHouseStateByHid(renter.getHid());
			}
		}else{
			throw new RuntimeException("删除合同失败");
		}
	}

	@Override
	public void addOwnerContract(String oid, OwnerContract con) {
		//设置房东合同编码
		con.setCid(UUIDUtil.getUuid());
		//生成合同
		int count = contractMapper.addOwnerContract(con);
		if(count != 1){
			throw new RuntimeException("生成房东合同失败");
		}else{
			//修改房东信息
			Owner o = new Owner();
			o.setOid(oid);
			o.setCid(con.getCid());
			ownerMapper.updateOwnerByOid(o);
		}
	}

	@Override
	public BPageBean<OwnerContract> queryAllOwnerContract(BQueryVo vo) {
		// 得到合同的总记录数
		Integer total = contractMapper.queryOwnerContractsTotal(vo);
		// 按条件查询用户
		List<OwnerContract> cons = contractMapper.queryAllOwnerContracts(vo);

		BPageBean<OwnerContract> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(cons);
		return pb;
	}

	@Override
	public void updateOwnerContract(OwnerContract contract) {
		int count = contractMapper.updateOwnerContract(contract);
		if(count != 1){
			throw new RuntimeException("修改房东合同失败");
		}
	}

	@Override
	public void delOwnerContractByCid(OwnerContract con) {
		int count = contractMapper.delOwnerConByCid(con.getCid());
		if(count != 1){
			throw new RuntimeException("删除房东合同失败");
		}else{
			//删除房东信息
			ownerMapper.delOwnerByCid(con.getCid());
		}
	}

	@Override
	public BPageBean<Contract> queryEndContract(BQueryVo vo) {
		// 得到合同的总记录数
		Integer total = contractMapper.queryEndContractsTotal(vo);
		// 按条件查询用户
		List<Contract> cons = contractMapper.queryEndContracts(vo);

		BPageBean<Contract> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(cons);
		return pb;
	}
}
