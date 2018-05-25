package com.hss.renthouse.admins.house.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.hss.renthouse.admins.Log.annotation.SystemControllerAnnotation;
import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.user.house.entity.House;
import com.hss.renthouse.user.house.entity.Imgs;
import com.hss.renthouse.user.house.entity.QueryVo;
import com.hss.renthouse.user.house.service.interfaces.HouseService;
import com.hss.renthouse.utils.PageBean;
import com.hss.renthouse.utils.PageUtil;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 房源管理controller层
 * 
 * @author hss
 *
 */

@Controller
public class HouseManageController {

	private static final Logger logger = LoggerFactory.getLogger(HouseManageController.class);

	@Autowired
	private HouseService houseService;

	/**
	 * 增加房源信息
	 * @param house
	 * @param picFile
	 * @param session
	 * @param model
	 * @return
	 */
	@SystemControllerAnnotation(value = "增加房源信息")
	@RequestMapping(value = "/admin/addHouse.action")
	public String addHouse(House house, MultipartFile[] picFile, 
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
			
			msg = "增加房源信息成功";
		} catch (Exception e) {
			msg = e.getMessage();
			model.addFlashAttribute("house", house);
			return "redirect:/admin/skipHouseManagePage.action";
		}
		
		logger.info("{}" + msg + "!", admin.getAname());
		model.addFlashAttribute("msg", msg);
		
		return "redirect:/admin/skipAdminHouseDetailPage.action?hid=" + hid;
	}

	/**
	 * 更新指定的房源信息
	 * 
	 * @param house
	 * @param picFile
	 *            上传的图片
	 * @param model
	 * @return
	 */
	@SystemControllerAnnotation(value = "更新房源信息")
	@RequestMapping(value = "/admin/updateHouseByHid.action")
	public String updateHouseByHid(House house, MultipartFile[] picFile, HttpSession session,
			RedirectAttributesModelMap model) {

		String msg = "";

		Admin admin = (Admin) session.getAttribute("admin");

		// 更新其它数据
		try {
			houseService.updateHouseByHid(house);

			// 判断更新信息里是否上传了图片
			if (picFile != null && picFile[0].getSize() > 0) {
				// 遍历MultipartFile,对每张图片就行处理
				for (MultipartFile m : picFile) {
					// 更换名字
					String newName = UUIDUtil.getUuid() + "_" + m.getOriginalFilename();
					String savePath = "D:\\img\\";
					// 保存图片前先判断保存图片的文件夹是否存在
					File f = new File(savePath);
					if (!f.exists()) {
						f.mkdir();
					}

					// 保存
					File target = new File(savePath, newName);
					try {
						m.transferTo(target);
					} catch (Exception e) {
						msg = "上传房源[" + house.getHid() + "]图片失败";
					}
					// 将图片保存到数据库中
					houseService.addImgs(house.getHid(), "\\img\\" + newName);
				}
			}

			msg = "更新房源[" + house.getHid() + "]信息成功";
		} catch (Exception e) {
			msg = e.getMessage();
			model.addFlashAttribute("house", house);

		}

		logger.info("{}" + msg + "!", admin.getAname());
		model.addFlashAttribute("msg", msg);
		return "redirect:/admin/skipAdminHouseDetailPage.action?hid=" + house.getHid();
	}

	/**
	 * 删除指定的房源 已出租的房源不能删除
	 * 
	 * @param house
	 * @return
	 */
	@SystemControllerAnnotation(value = "删除指定的房源信息 ")
	@RequestMapping(value = "/admin/delHouseByHid.action")
	public String delHouseByHid(House house, RedirectAttributesModelMap model, HttpSession session) {

		String msg = "";

		Admin admin = (Admin) session.getAttribute("admin");

		// 已出租的房源不能删除
		if (house == null || "1".equals(house.getHstate())) {
			msg = "已出租的房源[" + house.getHid() + "]不能删除";
		} else {
			try {
				// 删除房源信息
				houseService.delHouseByHid(house.getHid());
				// 删除房源对应的图片
				File f = new File("D:\\" + house.getHimg());
				if (f != null) {
					f.delete();
				}
				f = null;

				// 查找出该房源对应的其它图片
				List<Imgs> imgs = houseService.getAllImgsByHid(house.getHid());
				if (imgs != null && imgs.size() > 0) {
					// 删除数据库中的记录
					houseService.delAllImgsByHid(house.getHid());
					// 删除所有图片
					for (Imgs img : imgs) {
						f = new File("D:\\" + img.getIimg());
						if (f != null) {
							f.delete();
						}
					}
				}

				msg = "删除房源信息[" + house.getHid() + "]成功";
			} catch (Exception e) {
				msg = e.getMessage();
			}
		}

		model.addFlashAttribute("msg", msg);
		logger.info("{}" + msg + "!", admin.getAname());
		return "redirect:/admin/skipHouseManagePage.action";
	}

	/**
	 * 跳转到房源详细页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/skipAdminHouseDetailPage.action")
	public ModelAndView skipAdminHouseDetailPage(House house) {
		ModelAndView md = new ModelAndView();

		// 得到指定的房源
		house = houseService.queryHouseByHid(house.getHid());

		md.setViewName("adminjsps/houseDetail");
		md.addObject("house", house);
		return md;
	}

	/**
	 * 跳转到房源管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/admin/skipHouseManagePage.action")
	public ModelAndView skipHouseManagePage(QueryVo vo, HttpServletRequest request) {
		ModelAndView md = new ModelAndView();

		// 获取当前页码
		int pc = PageUtil.getPc(request);
		// 获得请求url
		String url = PageUtil.getUrl(request);

		//设置为后台访问
		vo.setMethod(0);
		// 查询数据
		PageBean<House> pb = houseService.queryHousesByCondition(vo, pc);

		// 设置当前页
		pb.setPc(pc);
		// 设置请求路径
		pb.setUrl(url);

		md.addObject("pb", pb);
		md.setViewName("adminjsps/house");
		return md;
	}
}
