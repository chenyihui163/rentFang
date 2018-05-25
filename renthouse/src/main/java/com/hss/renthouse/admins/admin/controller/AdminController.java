package com.hss.renthouse.admins.admin.controller;

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
import com.hss.renthouse.admins.Log.entity.Log;
import com.hss.renthouse.admins.Log.service.interfaces.LogService;
import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.admins.admin.entity.ContractsAndHouseAndRenter;
import com.hss.renthouse.admins.admin.service.interfaces.AdminService;
import com.hss.renthouse.user.user.entity.User;
import com.hss.renthouse.user.user.service.interfaces.UserService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.Message;
import com.hss.renthouse.utils.StringUtils;

/**
 * 管理员模块controller层
 * 
 * @author hss
 *
 */
@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired(required = true)
	private AdminService adminService;
	@Autowired(required = true)
	private LogService logService;
	@Autowired
	private UserService userService;

	/**
	 * 查询用户对应得房源合同租客
	 * 
	 * @param uid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/getUserSubMenuByUId.action")
	public BPageBean<ContractsAndHouseAndRenter> getUserSubMenuByUId(BQueryVo vo) {
		return userService.getUserSubMenuByUId(vo);
	}
	/**
	 * 查询用户
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/queryUsers.action")
	public BPageBean<User> queryUsers(BQueryVo vo) {
		return userService.queryUsers(vo);
	}
	/**
	 * 删除指定的数据
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@SystemControllerAnnotation(value = "删除管理员")
	@RequestMapping(value="/admin/delAdminByids.action")
	public Message delAdminByids(String ids, HttpSession session){
		
		String msg = "";
		//得到当前用户
		Admin admin = (Admin) session.getAttribute("admin");
		
		//不是管理员不能操作
		if(admin.getIsAdmin() != 0){
			msg = "你没有权限删除该用户";
		}else{
			if(ids != null){
				String[] id = ids.split(",");
				for(int i =0; i <id.length; i ++){
					try {
							//不能删除超级管理员
							if("1".equals(id[i])){
								msg = "删除失败， 不能删除超级管理员";
							}else{
								adminService.delAdminByid(id[i]);
								msg = "删除数据成功";
							}
					} catch (Exception e) {
						msg = e.getMessage();
					}
				}
			}
		}
		
		logger.info("{}" + msg + "!", admin.getAname());
		return new Message(msg, "");
	}

	/**
	 * 增加管理员
	 */
	@SystemControllerAnnotation(value = "新增普通管理员")
	@RequestMapping(value = "/admin/addAdmin.action")
	public String addAdmin(Admin admin, RedirectAttributesModelMap model, HttpSession session) {
		String msg = "";

		// 判断当前用户是不是超级管理员，只有超级管理员才有资格增删改
		Admin current = (Admin) session.getAttribute("admin");
		try {
			if (current.getIsAdmin() == 0) {
				adminService.addAdmin(admin);
				msg = "新增管理员成功";
			} else {
				msg = "新增管理员失败, 你没有权限新增管理员";
			}

		} catch (Exception e) {
			msg = e.getMessage();
			model.addFlashAttribute("aadmin", admin);
		}

		logger.info("{}" + msg + "!", admin.getAname());
		model.addFlashAttribute("msg", msg);
		return "redirect:/admin/skipAdminManagePage.action";
	}

	/**
	 * 查询管理员
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/queryAdmins.action")
	public BPageBean<Admin> queryAdmins(BQueryVo vo) {
		return adminService.queryAdmins(vo);
	}

	/**
	 * 分页显示日志信息
	 * 
	 * @param ps
	 *            每页显示的数据
	 * @param offset
	 *            x
	 * @param sort
	 *            排序字段
	 * @param sortOrder
	 *            排序方式
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/querySysLog.action")
	public BPageBean<Log> querySysLog(BQueryVo vo) {
		return logService.querySysLog(vo);
	}

	/**
	 * 退出系统
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/admin/exit.action")
	@SystemControllerAnnotation(value = "退出系统")
	public String exit(HttpSession session) {

		Admin admin = (Admin) session.getAttribute("admin");
		if (admin != null) {
			logger.info("{} 退出系统成功!", admin.getAname());
			session.invalidate();
		}

		return "redirect:/skipAdminLoginPage.action";
	}

	/**
	 * 管理员登陆
	 * 
	 * @param admin
	 * @return
	 */
	@RequestMapping(value = "/adminLogin.action")
	@SystemControllerAnnotation(value = "登陆系统")
	public String adminLogin(Admin admin, String requri
			,HttpSession session, RedirectAttributesModelMap model) {

		String url = "";

		try {
			admin = adminService.adminLogin(admin);
			// 登陆成功将信息存储到session中
			session.setAttribute("admin", admin);

			logger.info("{} 登陆系统成功!", admin.getAname());
			
			if(requri != null && !StringUtils.isBlank(requri)){
					url = "redirect:" + requri;
			}else{
				// 重定向到首页
				url = "redirect:/admin/skipAdminIndexPage.action";
			}
			
		} catch (Exception e) {
			String msgErr = e.getMessage();
			// 回到登陆页面
			url = "redirect:/skipAdminLoginPage.action";

			logger.info("{} 登陆系统失败!", admin.getAname());
			model.addFlashAttribute("msgErr", msgErr);
		}

		return url;
	}

	/**
	 * 跳转到用户管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/skipUserManagePage.action")
	public ModelAndView skipUserManagePage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/user");
		return md;
	}
	/**
	 * 跳转到管理员管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/skipAdminManagePage.action")
	public ModelAndView skipAdminManagePage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/admin");
		return md;
	}

	/**
	 * 跳转到日志页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/skipSysLogPage.action")
	public ModelAndView skipSysLogPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/log");
		return md;
	}

	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/skipAdminIndexPage.action")
	public ModelAndView skipAdminIndexPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/index");
		return md;
	}

	/**
	 * 跳转到登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipAdminLoginPage.action")
	public ModelAndView skipAdminLoginPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("adminjsps/alogin");
		return md;
	}
}
