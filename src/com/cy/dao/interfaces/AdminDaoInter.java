package com.cy.dao.interfaces;

import com.cy.entity.Admin;

public interface AdminDaoInter {
	//获取管理员对象
	public Admin getAdmin();
	//修改账户密码
	public boolean updateAdminPassword(Admin admin);
}
