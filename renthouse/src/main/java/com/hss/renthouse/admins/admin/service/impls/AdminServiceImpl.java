package com.hss.renthouse.admins.admin.service.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hss.renthouse.admins.admin.dao.AdminMapper;
import com.hss.renthouse.admins.admin.entity.Admin;
import com.hss.renthouse.admins.admin.service.interfaces.AdminService;
import com.hss.renthouse.utils.BPageBean;
import com.hss.renthouse.utils.BQueryVo;
import com.hss.renthouse.utils.UUIDUtil;

/**
 * 管理员模块service层实现
 * @author hss
 *
 */

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminMapper;
	
	
	public Admin adminLogin(Admin admin) {
		admin = adminMapper.adminLogin(admin);
		
		if(admin == null){
			throw new RuntimeException("用户名\\密码错误");
		}
		
		return admin;
	}

	
	public BPageBean<Admin> queryAdmins(BQueryVo vo) {
		//得到用户的总记录数
		Integer total = adminMapper.queryAdminsTotal();
		//按条件查询用户
		List<Admin> admins = adminMapper.queryAdmins(vo);
		
		BPageBean<Admin> pb = new BPageBean<>();
		pb.setTotal(total);
		pb.setRows(admins);
		return pb;
	}

	
	@Transactional
	public void addAdmin(Admin admin) {
		admin.setAid(UUIDUtil.getUuid());
		int count = adminMapper.addAdmin(admin);
		if(count != 1){
			throw new RuntimeException("新增管理员失败");
		}
	}

	
	@Transactional
	public void delAdminByid(String id) {
		int count = adminMapper.delAdminByid(id);
		
		if(count != 1){
			throw new RuntimeException("删除数据失败");
		}
	}
}
