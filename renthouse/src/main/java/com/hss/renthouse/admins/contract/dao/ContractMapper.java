package com.hss.renthouse.admins.contract.dao;

import java.util.List;

import com.hss.renthouse.admins.contract.entity.Contract;
import com.hss.renthouse.admins.contract.entity.OwnerContract;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 合同dao层接口
 * @author hss
 *
 */
public interface ContractMapper {

	/**
	 * 生成合同
	 * @param con
	 * @return
	 */
	public int addContract(Contract con);

	/**
	 * 查询合同的总数
	 * @param vo 
	 * @return
	 */
	public Integer queryContractsTotal(BQueryVo vo);

	/**
	 * 查询所有合同
	 * @param vo
	 * @return
	 */
	public List<Contract> queryAllContracts(BQueryVo vo);

	/**
	 * 查询指定用户的合同
	 * @param uid
	 * @return
	 */
	public List<Contract> queryContractByUid(String uid);

	/**
	 * 修改合同
	 * @param contract
	 * @return
	 */
	public int updateContract(Contract contract);

	/**
	 * 删除指定合同
	 * @param cid
	 */
	public void delContractBycid(String cid);

	/**
	 * 新增房东合同
	 * @param con
	 * @return
	 */
	public int addOwnerContract(OwnerContract con);

	/**
	 * 统计房东合同总数
	 * @param vo
	 * @return
	 */
	public Integer queryOwnerContractsTotal(BQueryVo vo);

	/**
	 * 查询所有房东合同
	 * @param vo
	 * @return
	 */
	public List<OwnerContract> queryAllOwnerContracts(BQueryVo vo);

	/**
	 * 修改房东合同
	 * @param contract
	 * @return
	 */
	public int updateOwnerContract(OwnerContract contract);

	/**
	 * 删除房东合同
	 * @param cid
	 * @return
	 */
	public int delOwnerConByCid(String cid);

	/**
	 * 查询即将到期合同总数
	 * @param vo
	 * @return
	 */
	public Integer queryEndContractsTotal(BQueryVo vo);

	/**
	 * 查询所有到期合同
	 * @param vo
	 * @return
	 */
	public List<Contract> queryEndContracts(BQueryVo vo);

}
