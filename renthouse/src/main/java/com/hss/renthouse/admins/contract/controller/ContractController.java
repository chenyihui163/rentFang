package com.hss.renthouse.admins.contract.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.hss.renthouse.admins.Log.annotation.SystemControllerAnnotation;
import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.admins.contract.entity.Contract;
import com.hss.renthouse.admins.contract.entity.OwnerContract;
import com.hss.renthouse.admins.contract.service.interfaces.ContractService;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.service.interfaces.HouseService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.Message;

/**
 * 合同controller层
 * 
 * @author hss
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class ContractController {

	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);

	@Autowired
	private ContractService contractService;
	@Autowired
	private HouseService houseService;

	/**
	 * 查询所有的即将到期合同
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryEndContract.action")
	public BPageBean<Contract> queryEndContract(BQueryVo vo) {
		return contractService.queryEndContract(vo);
	}
	/**
	 * 生成房东合同
	 * @param con
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/addOwnerContract.action")
	@SystemControllerAnnotation(value = "生成房东合同")
	public String addOwnerContract(String oid, OwnerContract con, RedirectAttributesModelMap model, HttpSession session) {
		String msg = "";
		String returnUrl = "";
		Admin admin = (Admin) session.getAttribute("admin");
		
		try {
			con.setAdid(admin.getAid());
			contractService.addOwnerContract(oid, con);
			msg = "生成合同成功";
			returnUrl = "redirect:/admin/skipOwnerContractPage.action";
		} catch (Exception e) {
			msg = e.getMessage();
			returnUrl = "redirect:/admin/skipOwnerManagePage.action";
		}
		
		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return returnUrl;
	}
	/**
	 * 删除房东合同
	 * @param con
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/delOwnerContractByCid.action")
	@SystemControllerAnnotation(value = "删除房东合同")
	public String delOwnerContractByCid(OwnerContract con, RedirectAttributesModelMap model, HttpSession session) {
		String msg = "";
		Admin admin = (Admin) session.getAttribute("admin");

		try {
			contractService.delOwnerContractByCid(con);
			msg = "删除房东合同成功";
		} catch (Exception e) {
			msg = e.getMessage();
		} 
		
		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return "redirect:/admin/skipOwnerContractPage.action";
	}
	
	/**
	 * 删除合同
	 * @param con
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/delContractByCid.action")
	@SystemControllerAnnotation(value = "删除合同")
	public Message delContractByCid(Contract con, RedirectAttributesModelMap model, HttpSession session) {
		
		Message mess = null;
		String msg = "";
		Admin admin = (Admin) session.getAttribute("admin");

		try {
			contractService.delContractByCid(con);
			msg = "删除合同成功";
			mess = new Message(msg, "true");
		} catch (Exception e) {
			msg = e.getMessage();
			mess = new Message(msg, "false");
		} 
		
		logger.info("{}" + msg + "!", admin.getAname());
		return mess;
	}

	/**
	 * 修改房东合同
	 * 
	 * @param contract
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/updateOwnerContract.action")
	@SystemControllerAnnotation(value = "修改房东合同")
	public String updateOwnerContract(OwnerContract contract, RedirectAttributesModelMap model, HttpSession session) {
		String msg = "";

		Admin admin = (Admin) session.getAttribute("admin");

		try {
			// 重新设置操作人
			contract.setAdid(admin.getAid());
			contractService.updateOwnerContract(contract);
			msg = "修改房东合同成功";
		} catch (Exception e) {
			msg = e.getMessage();
		}

		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return "redirect:/admin/skipOwnerContractPage.action";
	}
	
	/**
	 * 修改合同
	 * 
	 * @param contract
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/updateContract.action")
	@SystemControllerAnnotation(value = "修改合同")
	public String updateContract(Contract contract, RedirectAttributesModelMap model, HttpSession session) {
		String msg = "";

		Admin admin = (Admin) session.getAttribute("admin");

		try {
			// 重新设置操作人
			contract.setAdid(admin.getAid());
			contractService.updateContract(contract);
			msg = "修改合同成功";
		} catch (Exception e) {
			msg = e.getMessage();
		}

		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return "redirect:/admin/skipRenterContractPage.action";
	}

	/**
	 * 查询所有的房东合同
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryAllOwnerContract.action")
	public BPageBean<OwnerContract> queryAllOwnerContract(BQueryVo vo) {
		return contractService.queryAllOwnerContract(vo);
	}

	/**
	 * 查询所有的合同
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryAllContract.action")
	public BPageBean<Contract> queryAllContract(BQueryVo vo) {
		return contractService.queryAllContract(vo);
	}

	/**
	 * 生成合同
	 * 
	 * @param aid
	 *            预约编码
	 * @param con
	 *            合同
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addContract.action")
	@SystemControllerAnnotation(value = "生成合同")
	public String addContract(String aid, Contract con, HttpSession session, RedirectAttributesModelMap model) {

		Admin admin = (Admin) session.getAttribute("admin");
		String msg = "";
		String returnUrl = "";

		// 生成合同成功后，需要将预约中的该条预约删除，同时在预约结果中加入一条记录
		try {
			// 判断改房源是否出租了，防止多个预约租用用一个房源
			House house = houseService.queryHouseByHid(con.getHid());
			if ("1".equals(house.getHstate())) {
				// 房子出租了
				returnUrl = "redirect:/admin/skipAppointPage.action";
				model.addFlashAttribute("msg", "该预约的房源已经租出去啦，请及时通知该客户");
				return returnUrl;
			}
			// 设置操作者
			con.setAdid(admin.getAid());
			contractService.addContract(con, aid);
			msg = "签约成功";
			returnUrl = "redirect:/admin/skipRenterContractPage.action";
		} catch (Exception e) {
			msg = e.getMessage();
			model.addFlashAttribute("contract", con);
			// 回到看房预约页面
			returnUrl = "redirect:/admin/skipAppointPage.action";
		}

		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return returnUrl;
	}

	/**
	 * 跳转到房东合同管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipOwnerContractPage.action")
	public ModelAndView skipOwnerContractPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/ownerContract");
		return md;
	}
	/**
	 * 跳转到房客合同管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipRenterContractPage.action")
	public ModelAndView skipRenterPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/contract");
		return md;
	}
}
