package com.hss.renthouse.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.user.user.entity.User;

/**
 * 对用户请求进行过滤
 * 
 * @author hss
 *
 */
public class RequestFilter implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 得到session
		HttpSession session = request.getSession();

		String url = null;

		// 如果发送的请求中有admin,需要跳转到后台登陆页面
		String uri = request.getRequestURI();
		if (uri != null && uri.contains("/admin/")) {
			// 得到当前用户
			Admin admin = (Admin) session.getAttribute("admin");
			if (admin != null) {
				// 已经登陆，放行
				return true;
			}
			url = "/skipAdminLoginPage.action";
		} else if (uri != null && uri.contains("/user/")) {
			// 得到当前用户
			User user = (User) session.getAttribute("user");
			if (user != null) {
				// 已经登陆，放行
				return true;
			}

			url = "/skipLoginPage.action";
		}

		// 拿到限制访问的请求路径
		String requri = request.getRequestURI();
		// 得到请求参数
		String param = request.getQueryString();
		if (param != null) {
			requri += "?" + param;
		}

		// 将请求的url带到页面上去
		request.setAttribute("requri", requri);
		// 带消息
		request.setAttribute("msg", "您还没有登陆,请先登陆");
		// 没有登陆，跳转到登陆页面
		request.getRequestDispatcher(url).forward(request, response);
		return false;
	}
}
