package com.cy.service.interfaces;

import com.cy.entity.Admin;

public interface AdminServiceInter {
	//获取管理员对象
	public Admin getAdmin();
	//修改管理员账号密码
	public Boolean modifyAccount(Admin admin);
}
