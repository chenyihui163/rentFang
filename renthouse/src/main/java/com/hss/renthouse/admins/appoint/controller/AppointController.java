package com.hss.renthouse.admins.appoint.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.hss.renthouse.admins.Log.annotation.SystemControllerAnnotation;
import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.admins.appoint.entity.Appoint;
import com.hss.renthouse.admins.appoint.entity.AppointResult;
import com.hss.renthouse.admins.appoint.entity.Join;
import com.hss.renthouse.admins.appoint.service.interfaces.AppointService;
import com.hss.renthouse.admins.renter.service.interfaces.OwnerService;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.service.interfaces.HouseService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 预约管理控制层
 * @author hss
 *
 */

@Controller
@RequestMapping( value = "/admin")
public class AppointController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppointController.class);
	
	@Autowired
	private AppointService appointService;
	@Autowired
	private HouseService houseService;
	@Autowired
	private OwnerService ownerService;
	
	/**
	 * 增加房东房源信息
	 * @param house
	 * @param join
	 * @param picFile
	 * @param session
	 * @param model
	 * @return
	 */
	@SystemControllerAnnotation(value = "增加房东房源信息")
	@RequestMapping(value = "/addJoinHouse.action")
	public String addHouse(House house, Join join, MultipartFile[] picFile, 
			HttpSession session, RedirectAttributesModelMap model) {

		String msg = "";

		Admin admin = (Admin) session.getAttribute("admin");
		
		//设置房源编码
		String hid = UUIDUtil.getUuid();
		house.setHid(hid);
		//房源状态默认为未出租
		house.setHstate("0");
		
		try {
			
			// 判断更新信息里是否上传了图片
			if (picFile != null && picFile[0].getSize() > 0) {
				// 遍历MultipartFile,对每张图片进行处理
				for (int i= 0; i < picFile.length; i++) {
					// 更换名字
					String newName = UUIDUtil.getUuid() + "_" + picFile[i].getOriginalFilename();
					String savePath = "D:\\img\\";
					// 保存图片前先判断保存图片的文件夹是否存在
					File f = new File(savePath);
					if (!f.exists()) {
						f.mkdir();
					}

					// 保存
					File target = new File(savePath, newName);
					try {
						picFile[i].transferTo(target);
					} catch (Exception e) {
						msg = "上传房源[" + house.getHid() + "]图片失败";
					}
					
					if(i == 1){
						house.setHimg("\\img\\" + newName);
					}else{
						// 将图片保存到数据库中
						houseService.addImgs(house.getHid(), "\\img\\" + newName);
					}
				}
			}
			
			// 将图片保存到数据库中
			houseService.addHouse(house);
			
			//增加房东信息
			ownerService.addOwner(join, hid, admin.getAid());
			
			msg = "增加房源信息成功";
		} catch (Exception e) {
			msg = e.getMessage();
			model.addFlashAttribute("house", house);
			return "redirect:/admin/skipJoinAppointPage.action";
		}
		
		logger.info("{}" + msg + "!", admin.getAname());
		model.addFlashAttribute("msg", msg);
		
		//跳到房东管理页面
		return "redirect:/admin/skipOwnerManagePage.action";
	}
	
	/**
	 * 取消业主加盟预约
	 * @param jid 正在取消的预约
	 * @param appointResult
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping( value = "/cancelJoinAppoint.action")
	@SystemControllerAnnotation(value = " 取消业主加盟预约")
	public String cancelJoinAppoint(String jid, AppointResult appointResult, HttpSession session,
			RedirectAttributesModelMap model){
		
		Admin admin = (Admin) session.getAttribute("admin");
		String msg = "";
		String returnUrl = "";
		
		//取消预约，将该编码的预约从预约表中删除，同时在预约结果表中增加一条结果
		try {
			//设置操作人
			appointResult.setAdid(admin.getAid());
			appointService.cancelJoinAppoint(appointResult, jid);
			msg = "取消预约[" + jid + "]成功";
			//跳转到预约结果页面
			returnUrl = "redirect:/admin/skipAppointResultPage.action";
		} catch (Exception e) {
			msg = e.getMessage();
			//回到原页面
			returnUrl = "redirect:/admin/skipJoinAppointPage.action";
		}
		
		logger.info("{}" + msg + "!", admin.getAname());
		model.addFlashAttribute("msg", msg);
		return returnUrl;
	}
	
	/**
	 * 取消看房预约
	 * @param aid 正在取消的预约
	 * @param appointResult
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping( value = "/cancelAppoint.action")
	@SystemControllerAnnotation(value = "取消看房预约")
	public String cancelAppoint(String aid, AppointResult appointResult, HttpSession session,
			RedirectAttributesModelMap model){
		
		Admin admin = (Admin) session.getAttribute("admin");
		String msg = "";
		String returnUrl = "";
		
		//取消预约，将该编码的预约从预约表中删除，同时在预约结果表中增加一条结果
		try {
			//设置操作人
			appointResult.setAdid(admin.getAid());
			appointService.cancelAppiontByAid(appointResult, aid);
			msg = "取消预约[" + aid + "]成功";
			//跳转到预约结果页面
			returnUrl = "redirect:/admin/skipAppointResultPage.action";
		} catch (Exception e) {
			msg = e.getMessage();
			//回到原页面
			returnUrl = "redirect:/admin/skipAppointPage.action";
		}
		
		logger.info("{}" + msg + "!", admin.getAname());
		model.addFlashAttribute("msg", msg);
		return returnUrl;
	}
	
	/**
	 * 查询所有的预约结果
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping( value = "/queryAllAppointResults.action")
	public BPageBean<AppointResult> queryAllAppointResults(BQueryVo vo) {
		return appointService.queryAllAppointResults(vo);
	}
	/**
	 * 查询所有的业主加盟
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping( value = "/queryAllJoins.action")
	public BPageBean<Join> queryAllJoins(BQueryVo vo) {
		return appointService.queryAllJoins(vo);
	}
	
	/**
	 * 查询所有的预约
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping( value = "/queryAllAppoints.action")
	public BPageBean<Appoint> queryAllAppoints(BQueryVo vo) {
		return appointService.queryAllAppoints(vo);
	}
	
	/**
	 * 跳转到预约结果页面
	 * @return
	 */
	@RequestMapping( value="/skipAppointResultPage.action" )
	public ModelAndView skipAppointResultPage(){
		ModelAndView md = new ModelAndView();
		
		md.setViewName("adminjsps/appointResult");
		return md;
	}
	
	/**
	 * 跳转到业主加盟管理页面
	 * @return
	 */
	@RequestMapping( value="/skipJoinAppointPage.action" )
	public ModelAndView skipJoinAppointPage(){
		ModelAndView md = new ModelAndView();
		
		md.setViewName("adminjsps/joins");
		return md;
	}
	
	/**
	 * 跳转到看房预约页面
	 * @return
	 */
	@RequestMapping( value = "/skipAppointPage.action")
	public ModelAndView skipAppointPage(){
		ModelAndView md = new ModelAndView();
		
		md.setViewName("adminjsps/appoint");
		return md;
	}

}
