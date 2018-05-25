package com.hss.renthouse.admins.renter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hss.renthouse.admins.renter.entity.Renter;
import com.hss.renthouse.admins.renter.service.interfaces.RenterService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 租客controller
 * @author hss
 *
 */

@Controller
@RequestMapping( value = "/admin")
public class RenterController {

	@Autowired
	private RenterService renterService;
	
	/**
	 * 查询所有的租客
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping( value = "/queryAllRenters.action")
	public BPageBean<Renter> queryAllRenters(BQueryVo vo) {
		return renterService.queryAllRenters(vo);
	}
	
	/**
	 * 跳转到租客管理页面
	 * @return
	 */
	@RequestMapping( value = "/skipRenterManagePage.action")
	public ModelAndView skipRentManagePage(){
		ModelAndView md = new ModelAndView();
		
		md.setViewName("adminjsps/renter");
		return md;
	}
}
