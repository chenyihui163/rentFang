package com.hss.renthouse.admins.renter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hss.renthouse.admins.renter.entity.Owner;
import com.hss.renthouse.admins.renter.service.interfaces.OwnerService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;

/**
 * 房东controller层
 * @author hss
 *
 */

@Controller
@RequestMapping( value = "/admin" )
public class OwnerController {

	@Autowired
	private OwnerService ownerService;
	
	/**
	 * 查询所有的租客
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping( value = "/queryAllOwners.action")
	public BPageBean<Owner> queryAllRenters(BQueryVo vo) {
		return ownerService.queryAllOwners(vo);
	}
	
	/**
	 * 跳转到房东管理页面
	 * @return
	 */
	@RequestMapping( value = "/skipOwnerManagePage.action")
	public ModelAndView skipOwnerManagePage(){
		ModelAndView md = new ModelAndView();
		
		md.setViewName("adminjsps/owner");
		return md;
	}
}
