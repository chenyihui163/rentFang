package com.hss.renthouse.admins.rental.controller;

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
import com.hss.renthouse.admins.bill.service.interfaces.BillService;
import com.hss.renthouse.admins.rental.entity.Rental;
import com.hss.renthouse.admins.rental.service.interfaces.RentalService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.Message;

/**
 * 租金controller
 * 
 * @author hss
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class RentalController {

	private static final Logger logger = LoggerFactory.getLogger(RentalController.class);

	@Autowired
	private RentalService rentalService;
	@Autowired
	private BillService billService;

	/**
	 * 发送账单
	 * 
	 * @param bill
	 * @param cid
	 *            合同编码
	 * @return
	 */
	@RequestMapping(value = "/sendBill.action")
	@SystemControllerAnnotation(value = "发送账单")
	public String sendBill(String mprice, String uid, String cid, RedirectAttributesModelMap model,
			HttpSession session) {
		
		Admin admin = (Admin) session.getAttribute("admin");
		String msg = "";
		String returnUrl = "";
		
		try {
			billService.sendBill(mprice, uid, cid);
			returnUrl = "redirect:/admin/skipBillManagePage.action";
			msg = "发送账单成功";
		} catch (Exception e) {
			msg = e.getMessage();
			//回到租金页面
			returnUrl = "redirect:/admin/skipRMoneyPage.action";
		}

		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return returnUrl;
	}

	/**
	 * 检查勾选的用户是否已经存在了本月账单
	 * 
	 * @param cid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkSendBill.action")
	public Message checkSendBill(String cid) {
		Message mess = null;

		try {
			rentalService.checkSendBill(cid);
			mess = new Message("", "true");
		} catch (Exception e) {
			mess = new Message("", "false");
		}
		return mess;
	}

	/**
	 * 查询所有的租金
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/queryAllRentals.action")
	public BPageBean<Rental> queryAllRentals(BQueryVo vo) {
		return rentalService.queryAllRenters(vo);
	}

	/**
	 * 跳转到租金管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipRMoneyPage.action")
	public ModelAndView skipRMoneyPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/rental");
		return md;
	}
}
