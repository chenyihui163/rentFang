package com.hss.renthouse.utils;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 验证码
 * 
 * @author hss
 *
 */
@Controller
public class VerifyCodeController {

	@RequestMapping(value = "getVerifyCode.action")
	public void getVerifyCode(HttpServletRequest request, HttpServletResponse response) {
		
		VerifyCode vc = new VerifyCode();
		// 获取一次性验证码图片
		BufferedImage image = vc.getImage();
		// 该方法必须在getImage()方法之后来调用
		// System.out.println(vc.getText());//获取图片上的文本
		try {
			// 把图片写到指定流中
			VerifyCode.output(image, response.getOutputStream());
		} catch (IOException e) {
			request.setAttribute("vCodeError", "验证码生成错误");
		}
		
		// 把文本保存到session中，为LoginServlet验证做准备
		request.getSession().setAttribute("vCode", vc.getText());
	}
}
