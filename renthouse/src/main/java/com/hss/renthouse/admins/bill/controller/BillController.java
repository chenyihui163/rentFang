package com.hss.renthouse.admins.bill.controller;

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
import com.hss.renthouse.admins.bill.entity.Bill;
import com.hss.renthouse.admins.bill.entity.RenterBill;
import com.hss.renthouse.admins.bill.service.interfaces.BillService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 账单controller
 * 
 * @author hss
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class BillController {

	private static final Logger logger = LoggerFactory.getLogger(BillController.class);
	
	@Autowired
	private BillService billService;

	/**
	 * 查询账单
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryUnPayRenters.action")
	public BPageBean<RenterBill> queryUnPayRenters(BQueryVo vo) {
		return billService.queryUnPayRenters(vo);
	}
	
	/**
	 * 修改账单
	 * @param bill
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping( value = "/updateBill.action" )
	@SystemControllerAnnotation( value = "修改账单")
	public String updateBill(Bill bill, RedirectAttributesModelMap model, HttpSession session){
		String msg = "";
		Admin admin = (Admin) session.getAttribute("admin");
		
		try {
			billService.updateBill(bill);
			msg = "修改账单成功";
		} catch (Exception e) {
			msg = e.getMessage();
		}
		
		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return "redirect:/admin/skipBillManagePage.action";
	}
	
	/**
	 * 删除指定的账单
	 * 
	 * @param bid
	 *            账单编码
	 * @return
	 */
	@RequestMapping(value = "/delBillByBid.action")
	@SystemControllerAnnotation(value = "删除账单")
	public String delBillByBid(String bid, RedirectAttributesModelMap model, HttpSession session) {
		String msg = "";
		Admin admin = (Admin) session.getAttribute("admin");
		
		try {
			billService.delBillByBid(bid);
			msg = "删除账单成功";
		} catch (Exception e) {
			msg = e.getMessage();
		}
		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return "redirect:admin/skipBillManagePage.action";
	}

	/**
	 * 查询账单
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryAllBills.action")
	public BPageBean<Bill> queryAllBills(BQueryVo vo) {
		return billService.queryAllBills(vo);
	}

	/**
	 * 跳转到租客管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipBillManagePage.action")
	public ModelAndView skipBillManagePage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/bill");
		return md;
	}

}
