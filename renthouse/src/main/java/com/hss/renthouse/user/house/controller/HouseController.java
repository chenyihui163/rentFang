package com.hss.renthouse.user.house.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.hss.renthouse.user.house.entity.HAppoint;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.entity.Imgs;
import com.hss.renthouse.user.house.entity.HJoin;
import com.hss.renthouse.user.house.entity.QueryVo;
import com.hss.renthouse.user.house.service.interfaces.HouseService;
import com.hss.renthouse.user.user.entity.User;
import com.hss.renthouse.utils.DateUtil;
import com.hss.renthouse.utils.PageBean;
import com.hss.renthouse.utils.PageUtil;

/**
 * 房源controller层
 * @author hss
 *
 */
@Controller
public class HouseController {

	@Autowired
	private HouseService houseService;
	
	/**
	 * 业主加盟
	 * @param join
	 * @return
	 */
	@RequestMapping(value="/joinHouse.action")
	public String joinHouse(HJoin join, RedirectAttributesModelMap model){
		
		String msg = "";
		
		try {
			houseService.joinHouse(join);
			msg = "委托成功，稍后我们的工作人员将与您联系，诚挚欢迎您的加入";
		} catch (Exception e) {
			model.addFlashAttribute("join", join);
			msg = e.getMessage();
		}
		
		model.addFlashAttribute("msg", msg);
		return "redirect:/skipJoinPage.action";
	}
	/**
	 * 根据条件查找房源
	 * 	进行分页
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@GetMapping( value="/queryHousesByCondition.action" )
	public PageBean<House> queryHousesByCondition(QueryVo vo, String hprice, 
			HttpServletRequest request){
		
		// 获取当前页码
		int pc = PageUtil.getPc(request);
		// 获得请求url
		String url = PageUtil.getUrl(request);
		
		//转换出租方式
		if(vo.getHmethod() != null){
			if("合租".equals(vo.getHmethod())){
				vo.setHmethod("0");
			}else{
				vo.setHmethod("1");
			}
		}
		
		//转换居住方式
		if(vo.getHtype() != null){
			if("日租".equals(vo.getHtype())){
				vo.setHtype("0");
			}else if("月租".equals(vo.getHtype())){
				vo.setHtype("1");
			}else{
				vo.setHtype("2");
			}
		}
		
		//转换价钱
		if(hprice != null){
			if(hprice.contains("以上")){
				String price = hprice.substring(0, hprice.indexOf("以上"));
				vo.setLprice(Double.parseDouble(price));
			}else{
				vo.setLprice(Double.parseDouble(hprice.split("-")[0]));
				vo.setHpric(Double.parseDouble(hprice.split("-")[1]));
			}
		}
		
		vo.setMethod(1);
		//查询数据
		PageBean<House> pb = houseService.queryHousesByCondition(vo, pc); 
		
		// 设置当前页
		pb.setPc(pc);
		// 设置请求路径
		pb.setUrl(url);

		return pb;
	}
	
	/**
	 * 跳转到条件查询页面
	 * @return
	 */
	@RequestMapping( value="/skipHousesPage.action" )
	public ModelAndView skipHousesPage(String searchVal){
		ModelAndView md = new ModelAndView();
		
		//默认请求路径
		String url = "/queryHousesByCondition.action?query=1";
		
		if(searchVal != null && !StringUtils.isEmpty(searchVal)){
			url += "&searchVal=" + searchVal;
		}
		
		md.addObject("url", url);
		md.setViewName("userjsps/houses");
		return md;
	}
	
	/**
	 * 预约看房
	 * @param app
	 * @return
	 */
	@RequestMapping( value="/user/addAppoint.action" )
	public String appoint(HAppoint app, HttpSession session, RedirectAttributesModelMap model){
		
		String msg = "";
		
		//设置用户编码
		User u = (User) session.getAttribute("user");
		app.setUid(u.getUid());
		
		//生成预约时间
		String antime = DateUtil.getNowTime();
		app.setAntime(antime);
		
		try {
			houseService.addAppoint(app);
			msg = "预约成功，稍后我们工作人员将与您联系，请注意接听来电";
		} catch (Exception e) {
			msg = e.getMessage();
			model.addFlashAttribute("appoint", app);
		}
		
		model.addFlashAttribute("msg", msg);
		return "redirect:/skipHouseDetailPage.action?hid=" + app.getHid();
	}
	
	/**
	 * 查看房子详细
	 * @param hid
	 * @return
	 */
	@RequestMapping( value="/skipHouseDetailPage.action" )
	public ModelAndView skipHouseDetailPage(String hid){
		
		ModelAndView md = new ModelAndView();
		
		//先查询该房子的所有信息
		House h = houseService.queryHouseByHid(hid);
		//带出该房子所有的图片
		List<Imgs> imgs = houseService.getAllImgsByHid(hid);
		
		md.addObject("len", imgs.size());
		md.addObject("h", h);
		md.addObject("imgs", imgs);
		md.setViewName("userjsps/houseDetail");
		return md;
	}
	
	/**
	 * 跳转到业主加盟页面
	 * @return
	 */
	@RequestMapping(value="/skipJoinPage.action")
	public ModelAndView skipJoinPage(){
		ModelAndView md = new ModelAndView();
		
		md.setViewName("/userjsps/join");
		return md;
	}
}
