package com.cy.service.impl;

import com.cy.dao.interfaces.AdminDaoInter;
import com.cy.entity.Admin;
import com.cy.service.interfaces.AdminServiceInter;

public class AdminServiceImpl implements AdminServiceInter{
	
	AdminDaoInter adminDaoInter;
	public AdminDaoInter getAdminDaoInter() {
		return adminDaoInter;
	}
	public void setAdminDaoInter(AdminDaoInter adminDaoInter) {
		this.adminDaoInter = adminDaoInter;
	}
//	@Override
	public Boolean modifyAccount(Admin admin) {
		return adminDaoInter.updateAdminPassword(admin);
	}
//	@Override
	public Admin getAdmin() {
		return adminDaoInter.getAdmin();
	}

}
