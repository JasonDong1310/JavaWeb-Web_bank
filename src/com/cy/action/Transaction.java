package com.cy.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.cy.entity.Account;
import com.cy.entity.Admin;
import com.cy.entity.LoanLog;
import com.cy.entity.Pager;
import com.cy.entity.TransactionLog;
import com.cy.service.interfaces.AdminServiceInter;
import com.cy.service.interfaces.TransactionServiceInter;
import com.cy.service.interfaces.UserServiceInter;
import com.opensymphony.xwork2.ActionSupport;

public class Transaction extends ActionSupport implements RequestAware, SessionAware {

	// 定义属性，添加set方法，实现依赖注入
	private UserServiceInter userServiceInter;
	private TransactionServiceInter transactionServiceInter;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Double loanmoney;
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Resource
	private AdminServiceInter adminServiceInter;

	public Double getLoanmoney() {
		return loanmoney;
	}

	public void setLoanmoney(Double loanmoney) {
		this.loanmoney = loanmoney;
	}

	public UserServiceInter getUserServiceInter() {
		return userServiceInter;
	}

	public void setUserServiceInter(UserServiceInter userServiceInter) {
		this.userServiceInter = userServiceInter;
	}

	public TransactionServiceInter getTransactionServiceInter() {
		return transactionServiceInter;
	}

	public void setTransactionServiceInter(TransactionServiceInter transactionServiceInter) {
		this.transactionServiceInter = transactionServiceInter;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	private Account account;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	// 定义TransactionLog对象并添加get和set方法，用户封装页面表单参数
	private TransactionLog log;

	public TransactionLog getLog() {
		return log;
	}

	public void setLog(TransactionLog log) {
		this.log = log;
	}

	// 定义分页实体类
	private Pager pager;

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	// 存款
	public String deposit() {
		// 调用isEnable方法判断账户是否冻结
		if (isEnable()) {
			// System.out.println(log.getTr_money());
			// 给交易对象log中关联的账户对象属性赋值
			log.setAccount(account);
			session.put("user", account);
			// 调用业务方法，更新账户表account中的余额
			// 并在交易信息表transaction_log表中添加记录
			try {
				return isSuccess(transactionServiceInter.deposit(log));
			} catch (Exception e) {
				request.put("message", "请输入正确信息！");
				return "message";
			}
		}
		return "message";
	}

	// 对取款页面进行验证，判断账户余额是否充足
	public void validateWithdraw() {
		account = (Account) session.get("user");
		// System.out.println(log.getTr_money());
		// System.out.println(account.getBalance());
		try {
			if (log.getTr_money() > account.getBalance()) {
				this.addFieldError("log.tr_money", "您的账户余额不足！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 取款
	public String withdraw() {
		// 调用isEnable方法判断账户是否冻结
		if (isEnable()) {
			// 给交易对象log中关联的账户对象属性赋值
			log.setAccount(account);
			session.put("user", account);
			// 调用业务方法，更新账户表account中的余额
			// 并在交易信息表transaction_log表中添加记录
			try {
				return isSuccess(transactionServiceInter.withdraw(log));
			} catch (Exception e) {
				request.put("message", "请输入正确信息！");
				return "message";
			}
		}
		return "message";
	}

	// 对转账页面表单进行验证
	public String validateTransfer() {
		account = (Account) session.get("user");
		Account other = userServiceInter.getAccount(log.getOtherid());
		if(other!=null){
			if(other.getStatus().getName().equals("冻结")){
				request.put("message", "对方账户已被冻结，无法转入！");
				return "message";
			} 
			if (log.getOtherid().intValue() == account.getAccountid().intValue()) {
				request.put("message", "您不能转给自己！");
				return "message";
			}
			if (userServiceInter.getAccount(log.getOtherid()) == null) {
				request.put("message", "该账户不存在！");
				return "message";
			}
			if (log.getTr_money() > account.getBalance()) {
				request.put("message", "您的账户余额不足！");
				return "message";
			}
		} else {
			request.put("message", "该账户不存在！");
			return "message";
		}
		return "message";
	}

	// 转账
	public String transfer() {
		// 判断账户是否冻结
		if (isEnable()) {
			// 给交易对象log中关联的账户对象属性赋值
			Account other = userServiceInter.getAccount(log.getOtherid());
			if(other != null ){
				if(other.getStatus().getName().equals("冻结")){
					request.put("message", "对方账户已被冻结，无法转入！");
					return "message";
				} 
				if (log.getOtherid().intValue() == account.getAccountid().intValue()) {
					request.put("message", "您不能转给自己！");
					return "message";
				}
				if (userServiceInter.getAccount(log.getOtherid()) == null) {
					request.put("message", "该账户不存在！");
					return "message";
				}
				if (log.getTr_money() > account.getBalance()) {
					request.put("message", "您的账户余额不足！");
					return "message";
				}else {
					log.setAccount(account);
					session.put("user", account);
					// 调用业务方法，更新账户表account中的余额
					// 并在交易信息表transaction_log表中添加记录
					try {
						return isSuccess(transactionServiceInter.transfer(log));
					} catch (Exception e) {
						request.put("message", "请输入正确信息！");
						return "message";
					}
				}
			}
		}
		return "message";
	}

	// 判断账户是否冻结
	public boolean isEnable() {
		// userServiceInter.reflush(account);
		account = (Account) session.get("user");
		// System.out.println(account.getUsername());
		if (account.getStatus().getName().equals("冻结")) {
			request.put("message", "抱歉！该账户已被冻结，无法进行相关操作！<br>");
			return false;
		}
		return true;
	}
	
	//判断对方账户是否冻结


	public String isSuccess(boolean flag) {
		if (flag) {
			request.put("message", "操作成功！");
			return "message";
		}
		request.put("message", "操作失败！<a href='javascript:history.go(-1)'>返回</a>");
		return "message";
	}

	// 显示交易记录
	public String list() {
		account = (Account) session.get("user");
		// 获取待显示页页码
		int curPage = pager.getCurPage();
		// 根据待显示页页码和账户对象获取交易记录
		List<TransactionLog> logs = transactionServiceInter.getLogs(account, curPage);
		// 获得账户的交易记录总数，用来初始化pager对象，
		// 并设置其perPageRows和rowCount属性
		pager = transactionServiceInter.getPagerOfLogs(account);
		// 设置pager对象中待显示页页码
		pager.setCurPage(curPage);
		request.put("logs", logs);
		return "success";
	}

	// 显示贷款记录
	public String loanlist() {
		account = (Account) session.get("user");
		// 获取待显示页页码
		int curPage = pager.getCurPage();
		// 根据待显示页页码和账户对象获取交易记录
		List<LoanLog> logs = transactionServiceInter.getLoanLogs(account, curPage);
		// 获得账户的交易记录总数，用来初始化pager对象，
		// 并设置其perPageRows和rowCount属性
		pager = transactionServiceInter.getPagerOfLoanLogs(account);
		// 设置pager对象中待显示页页码
		pager.setCurPage(curPage);
		request.put("logs", logs);
		return "success";
	}

	// 显示贷款记录
	public String loanlist1() {
		account = userServiceInter.getAccount(id);
		// 获取待显示页页码
		int curPage = pager.getCurPage();
		// 根据待显示页页码和账户对象获取交易记录
		List<LoanLog> logs = transactionServiceInter.getLoanLogs(account, curPage);
		// 获得账户的交易记录总数，用来初始化pager对象，
		// 并设置其perPageRows和rowCount属性
		pager = transactionServiceInter.getPagerOfLoanLogs(account);
		// 设置pager对象中待显示页页码
		pager.setCurPage(curPage);
		request.put("logs", logs);
		return "success";
	}

	// 贷款权限判断
	public String loan() {
		account = (Account) session.get("user");
		List<TransactionLog> logs = transactionServiceInter.getLogsOfC(account);
		Double sum = 0.0;
		int su = 0;
		for (TransactionLog log : logs) {
			if (log.getTransactionType().getId() == 1) {
				sum = sum + log.getTr_money();
				su++;
			}
		}
		Double arg = sum / su;
		session.put("arg", arg);
		return "success";
	}

	// 贷款
	public String loanmoney() {
		if(isEnable()){
			account = (Account) session.get("user");
			Admin a = userServiceInter.getAdmin("admin");
			if (loanmoney > a.getMoney()) {
				request.put("message", "贷款金额大于可待金额！<a href='javascript:history.go(-1)'>返回</a>");
				return "message";
			} else {
				String loanmoney2 = transactionServiceInter.loanmoney(account, a, loanmoney);
				request.put("message", loanmoney2);
				return "message";
			}
		} else {
			request.put("message", "抱歉！该账户已被冻结，无法进行相关操作！<br>");
			return "message";
		}
	}

	// 还款
	public String huan() {
		account = (Account) session.get("user");
		Admin a = userServiceInter.getAdmin("admin");
		String huan = transactionServiceInter.huan(account, a, id);
		request.put("message", huan + "<a href='javascript:history.go(-1)'>返回</a>");
		return "message";
	}
}
