package com.hss.renthouse.user.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.hss.renthouse.admins.bill.service.interfaces.BillService;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.service.interfaces.HouseService;
import com.hss.renthouse.user.user.entity.User;
import com.hss.renthouse.user.user.service.interfaces.UserService;
import com.hss.renthouse.utils.MD5Util;
import com.hss.renthouse.utils.Message;
import com.hss.renthouse.utils.PaymentUtil;

/**
 * 用户控制层 包含登陆注册
 * 
 * @author hss
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private HouseService houseService;
	@Autowired
	private BillService billService;

	/**
	 * 支付方法
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "user/payment.action")
	public String payment(HttpServletRequest req, HttpServletResponse resp, RedirectAttributesModelMap model)
			throws ServletException, IOException {
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		/*
		 * 1. 准备13个参数
		 */
		String p0_Cmd = "Buy";// 业务类型，固定值Buy
		String p1_MerId = props.getProperty("p1_MerId");// 商号编码，在易宝的唯一标识
		String p2_Order = req.getParameter("bid");// 账单编码
		String p3_Amt = "0.01";// 支付金额
		String p4_Cur = "CNY";// 交易币种，固定值CNY
		String p5_Pid = "";// 商品名称
		String p6_Pcat = "";// 商品种类
		String p7_Pdesc = "";// 商品描述
		String p8_Url = props.getProperty("p8_Url");// 在支付成功后，易宝会访问这个地址。
		String p9_SAF = "";// 送货地址
		String pa_MP = "";// 扩展信息
		String pd_FrpId = req.getParameter("yh");// 支付通道
		String pr_NeedResponse = "1";// 应答机制，固定值1

		if (p2_Order == null || StringUtils.isEmpty(p2_Order)) {
			model.addFlashAttribute("msg", "账单不存在，请确认");
			return "redirect:/user/skipPersonInfoPage.action";
		}

		/*
		 * 2. 计算hmac 需要13个参数 需要keyValue 需要加密算法
		 */
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc,
				p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);

		/*
		 * 3. 重定向到易宝的支付网关
		 */
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);

		resp.sendRedirect(sb.toString());
		return null;
	}

	/**
	 * 回馈方法 当支付成功时，易宝会访问这里 用两种方法访问： 1. 引导用户的浏览器重定向(如果用户关闭了浏览器，就不能访问这里了) 2.
	 * 易宝的服务器会使用点对点通讯的方法访问这个方法。（必须回馈success，不然易宝服务器会一直调用这个方法）
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/user/back.action")
	public String back(HttpServletRequest req, HttpServletResponse resp, RedirectAttributesModelMap model)
			throws ServletException, IOException {
		/*
		 * 1. 获取12个参数
		 */
		String p1_MerId = req.getParameter("p1_MerId");
		String r0_Cmd = req.getParameter("r0_Cmd");
		String r1_Code = req.getParameter("r1_Code");
		String r2_TrxId = req.getParameter("r2_TrxId");
		String r3_Amt = req.getParameter("r3_Amt");
		String r4_Cur = req.getParameter("r4_Cur");
		String r5_Pid = req.getParameter("r5_Pid");
		String r6_Order = req.getParameter("r6_Order");
		String r7_Uid = req.getParameter("r7_Uid");
		String r8_MP = req.getParameter("r8_MP");
		String r9_BType = req.getParameter("r9_BType");
		String hmac = req.getParameter("hmac");

		/*
		 * 2. 获取keyValue
		 */
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		String keyValue = props.getProperty("keyValue");

		/*
		 * 3. 调用PaymentUtil的校验方法来校验调用者的身份 >如果校验失败：保存错误信息，转发到msg.jsp >如果校验通过： *
		 * 判断访问的方法是重定向还是点对点，如果要是重定向 修改订单状态，保存成功信息，转发到msg.jsp *
		 * 如果是点对点：修改订单状态，返回success
		 */
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid,
				r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		if (!bool) {
			model.addFlashAttribute("msg", "啊哦,支付失败!,请重试");
			return "redirect:/user/skipPersonInfoPage.action";
		}
		if (r1_Code.equals("1")) {
			// 修改账单状态为已支付, 同时修改租金的本月支付时间，以及计算下次支付时间
			billService.updateStatus(r6_Order, 1);
			if (r9_BType.equals("1")) {
				model.addFlashAttribute("msg", "恭喜，支付成功！");
				// 重定向到个人中心
				return "redirect:/user/skipPersonInfoPage.action";
			} else if (r9_BType.equals("2")) {
				resp.getWriter().print("success");
			}
		}
		return null;
	}

	/**
	 * 更新用户信息
	 * 
	 * @param newPasswd
	 *            新密码
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/user/updateUser.action")
	public String updateUser(String newPasswd, User user, HttpSession session, RedirectAttributesModelMap model) {

		String msg = null;
		if (newPasswd != null && newPasswd.trim().length() > 0) {
			// 赋值新密码
			try {
				String saltpass = MD5Util.EncoderByMd5(newPasswd + user.getUtele() + "huangss");
				user.setUpasswd(saltpass);
			} catch (NoSuchAlgorithmException e) {
				msg = "更新用户信息失败";
			} catch (UnsupportedEncodingException e) {
				msg = "更新用户信息失败";
			}
		}

		try {
			userService.updateUser(user);
			session.setAttribute("user", user);
			msg = "更新用户信息成功";

		} catch (Exception e) {
			msg = e.getMessage();
		}

		model.addFlashAttribute("msg", msg);
		return "redirect:/skipPersonInfoPage.action";
	}

	/**
	 * 校验旧密码是否输入正确
	 * 
	 * @param upasswd
	 *            旧密码
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkUpasswd.action")
	public Message checkUpasswd(String upasswd, HttpSession session) {
		Message mess = null;

		// 得到当前用户
		User user = (User) session.getAttribute("user");
		// 给密码进行加盐处理
		String saltpass = "";
		try {
			saltpass = MD5Util.EncoderByMd5(upasswd + user.getUtele() + "huangss");
		} catch (NoSuchAlgorithmException e) {
			mess = new Message("您输入的旧密码不正确，请重新输入", "false");
		} catch (UnsupportedEncodingException e) {
			mess = new Message("您输入的旧密码不正确，请重新输入", "false");
		}

		// 进行校验
		if (user.getUpasswd().equals(saltpass)) {
			mess = new Message("", "true");
		} else {
			mess = new Message("您输入的旧密码不正确，请重新输入", "false");
		}

		return mess;
	}

	/**
	 * 退出登陆
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/exit.action")
	public String exit(HttpSession session) {
		// 注销session, 返回到首页
		session.invalidate();
		return "redirect:/skipIndexPage.action";
	}

	/**
	 * 登陆
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login.action")
	public String login(User user, HttpSession session, String requri, HttpServletResponse resp,
			RedirectAttributesModelMap model) {

		String msgErr = "";
		String url = "";

		if (user != null) {
			String newpass = null;

			// 对密码进行加密处理，加盐
			try {
				newpass = MD5Util.EncoderByMd5(user.getUpasswd() + user.getUtele() + "huangss");
			} catch (NoSuchAlgorithmException e) {
				msgErr = "电话号码\\密码错误";
			} catch (UnsupportedEncodingException e) {
				msgErr = "电话号码\\密码错误";
			}

			// 登陆
			try {
				user.setUpasswd(newpass);
				user = userService.login(user);

				// 登陆成功，将用户信息存入session中
				session.setAttribute("user", user);
				// 将用户信息出入cookie中
				Cookie c = new Cookie("utele", user.getUtele());
				c.setMaxAge(60 * 60 * 24);
				resp.addCookie(c);

				if (requri != null && !StringUtils.isEmpty(requri)) {
					url = "redirect:" + requri;
				} else {
					url = "redirect:/skipIndexPage.action";
				}
				// 重定向到url
				return url;
			} catch (Exception e) {
				msgErr = e.getMessage();
			}

		} else {
			msgErr = "电话号码\\密码错误";
		}

		// 返回登陆页面
		model.addFlashAttribute("msg", msgErr);
		model.addFlashAttribute("utele", user.getUtele());
		return "redirect:/skipLoginPage.action";
	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/regist.action")
	public String regist(User user, RedirectAttributesModelMap model) {
		try {

			// 对密码进行加密处理，加盐
			String newpass = MD5Util.EncoderByMd5(user.getUpasswd() + user.getUtele() + "huangss");
			user.setUpasswd(newpass);

			userService.regist(user);

			// 注册成功的话，跳转到登陆页面
			model.addFlashAttribute("msg", "恭喜你您呐，注册成功啦，快去登陆吧");
			return "redirect:/skipLoginPage.action";
		} catch (Exception e) {
			// 注册失败，返回注册页面，给出提示
			model.addFlashAttribute("msgErr", e.getMessage());
		}

		// 将用户填写的信息返回给用户
		model.addFlashAttribute("userinput", user);
		return "redirect:/skipRegistPage.action";
	}

	/**
	 * 校验验证码的正确性
	 * 
	 * @param vcode
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkVcode.action")
	public Message checkVcode(String vcode, HttpSession session) {
		Message mess = null;

		// 得到session中存储的验证码
		String code = (String) session.getAttribute("vCode");
		// 判断
		if (vcode == null || !(vcode.equalsIgnoreCase(code))) {
			mess = new Message("验证码输入错误", "false");
		} else {
			mess = new Message("", "true");
		}

		return mess;
	}

	/**
	 * 判断电话号码是否被注册 注册进行的判断，注册了需要提示
	 * 
	 * @param utele
	 *            登陆的电话号码
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkUteleIsExist.action")
	public Message checkUteleIsExist(String utele) {
		Message mess = null;

		try {
			userService.checkUteleIsExist(utele);
			mess = new Message("", "true");
		} catch (Exception e) {
			mess = new Message(e.getMessage(), "false");
		}

		return mess;
	}

	/**
	 * 判断电话号码是否被注册 登陆进行的判断，未注册需要提示
	 * 
	 * @param utele
	 *            登陆的电话号码
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/checkTelephoneIsExist.action")
	public Message checkTelephoneIsExist(String utele) {
		Message mess = null;

		try {
			userService.checkTelephoneIsExist(utele);
			mess = new Message("", "true");
		} catch (Exception e) {
			mess = new Message(e.getMessage(), "false");
		}

		return mess;
	}

	/**
	 * 跳转到个人中心
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/skipPersonInfoPage.action")
	public ModelAndView skipPersonInfoPage(HttpSession session) {
		ModelAndView md = new ModelAndView();
		
		md.setViewName("userjsps/personInfo");
		return md;
	}

	/**
	 * 跳转到注册页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipRegistPage.action")
	public ModelAndView skipRegistPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("userjsps/regist");
		return md;
	}

	/**
	 * 跳转到主页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipIndexPage.action")
	public ModelAndView skipIndexPage() {
		ModelAndView md = new ModelAndView();

		// 获得展示房源
		List<House> hs = houseService.queryHouses();

		md.addObject("hs", hs);
		md.setViewName("userjsps/index");
		return md;
	}

	/**
	 * 跳转到登陆页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/skipLoginPage.action")
	public ModelAndView skipLoginPage() {
		ModelAndView md = new ModelAndView();

		md.setViewName("userjsps/login");
		return md;
	}
}
