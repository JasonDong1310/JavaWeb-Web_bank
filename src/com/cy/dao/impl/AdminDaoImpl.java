package com.cy.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.cy.dao.interfaces.AdminDaoInter;
import com.cy.entity.Admin;

@Transactional
public class AdminDaoImpl implements AdminDaoInter{
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

//	@Override
	public boolean updateAdminPassword(Admin admin) {
		Session session = sessionFactory.getCurrentSession();
        session.merge(admin);
		return true;
	}
//	@Override
	public Admin getAdmin() {
		Session session = sessionFactory.getCurrentSession();
        String hql = "from Admin";
        Query query = session.createQuery(hql);
		return (Admin) query.uniqueResult();
	}

}
