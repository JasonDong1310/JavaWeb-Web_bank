package com.cy.action;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.net.ssl.SSLException;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.alibaba.fastjson.JSONObject;
import com.cy.entity.Account;
import com.cy.entity.Admin;
import com.cy.entity.Personinfo;
import com.cy.entity.Status;
import com.cy.service.interfaces.AdminServiceInter;
import com.cy.service.interfaces.PersoninfoServiceInter;
import com.cy.service.interfaces.UserServiceInter;
import com.opensymphony.xwork2.ActionSupport;

import Decoder.BASE64Decoder;

public class AdminAction extends ActionSupport implements RequestAware,SessionAware {

	//使用Resource注解注入UserServiceInter、PersoninfoServiceInter属性，省去set方法
	@Resource 
	private UserServiceInter userServiceInter;
	@Resource 
	private AdminServiceInter adminServiceInter;
	@Resource 
	private PersoninfoServiceInter personinfoServiceInter; 
	Map<String, Object> request;
	Map<String, Object> session;
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	private String oldpwd;
	private String newpwd;
	private Double money;
	private String imgString;
	
	
	
	public String getImgString() {
		return imgString;
	}
	public void setImgString(String imgString) {
		this.imgString = imgString;
	}
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	//定义Admin对象，用于封装管理员登录表单页面
	private Admin admin;
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	//定义status对象，listUsers()方法使用
	private Status status;
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	//定义personinfo对象，search()方法使用
	private Personinfo personinfo;
	public Personinfo getPersoninfo() {
		return personinfo;
	}
	public void setPersoninfo(Personinfo personinfo) {
		this.personinfo = personinfo;
	}
	
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	private Account account;
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	//对登录表单页面进行验证，用户名和密码是否正确
	public void validateLogin() {
		Admin a = userServiceInter.getAdmin(admin.getUsername());
		a = admin;
		if(a == null) {
			this.addFieldError("username", "用户名不存在！");
		} else
		if(!admin.getPassword().equals(a.getPassword())){			
			this.addFieldError("password", "密码不正确！");
		}
		admin = a;
	}
	//登录
	public String login() {
		if(admin != null) {
			Admin a = userServiceInter.getAdmin(admin.getUsername());
			session.put("admin", a);
			return "success";
		}else{
			return "login";
		}
		
	}
	
	//执行修改密码请求
	public String changepwd() {
		Admin admin = adminServiceInter.getAdmin();
		if(!admin.getPassword().equals(oldpwd) ) {
			request.put("message", "当前密码输入有误！");
			return "message";
		} else {
			admin.setUsername(admin.getUsername());
			admin.setPassword(newpwd);
			Boolean modifyAccount = adminServiceInter.modifyAccount(admin);
			if(modifyAccount) {
				session.put("admin", admin);
				request.put("message", "密码修改成功！");
				return "message";
			} else {
				request.put("message", "密码修改失败！");
				return "message";
			}
		}
	}
	
	//管理账户添加金额
		public String addmoney() {
			Admin admin = adminServiceInter.getAdmin();
			Double money = this.money;
			admin.setUsername(admin.getUsername());
			admin.setPassword(admin.getPassword());
			admin.setMoney(admin.getMoney()+money);
			Boolean modifyAccount = adminServiceInter.modifyAccount(admin);
			if(modifyAccount) {
				session.put("admin", admin);
				request.put("message", "充值成功！");
				return "message";
			} else {
				request.put("message", "充值失败！");
				return "message";
			}
		}
	
	// 注销
	public String logout() {
    	session.remove("user");
		session.remove("personinfo");
		return "login";  
}
	
	//管理员查询账户
	public String listUsers() {
		System.out.println("你好"+status.getId());
		List users = personinfoServiceInter.searchPersoninfo(status);
		request.put("users", users);
		return "users";
	}
	
	//根据真实姓名查询账户
	public String search() {
		List users = personinfoServiceInter.searchPersoninfo(personinfo);
		request.put("users", users);
		return "users";
	}
	
	//启用账户
	public String enabled() {
		userServiceInter.enabled(id);
		request.put("message", "启用成功");
		return "message";
	}
	//冻结账户
	public String locking() {
		userServiceInter.locking(id);
		request.put("message", "冻结成功");
		return "message";
	}
	//删除账户
	public String del() {
		userServiceInter.delAccount(id);
		request.put("message", "删除成功");
		return "message";
	}
	
	//对开户页面进行验证，验证用户名是否存在、一张身份证只能拥有一个账户
	public void validateOpenAccount() {
		if(userServiceInter.getAccount(account.getUsername()) != null ) {
			request.put("message", "用户名已存在！");
		}
		//
		
	}
	//开户
	public String openAccount() {
		if(userServiceInter.getAccount(account.getUsername()) != null ) {
			request.put("message", "开户失败，用户名已存在！");
			return "message";
		}else {
			//向account表中添加账户
			userServiceInter.addAccount(account);
			//向personinfo表中添加个人信息
			account = userServiceInter.getAccount(account.getUsername());
			personinfo.setAccount(account);
			personinfoServiceInter.add(personinfo);
			request.put("message", "开户成功！");
			return "message";
		}
		
	}
	
}
