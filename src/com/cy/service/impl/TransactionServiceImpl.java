package com.cy.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.cy.dao.interfaces.AdminDaoInter;
import com.cy.dao.interfaces.TransactionDaoInter;
import com.cy.dao.interfaces.UserDaoInter;
import com.cy.entity.Account;
import com.cy.entity.Admin;
import com.cy.entity.LoanLog;
import com.cy.entity.Pager;
import com.cy.entity.TransactionLog;
import com.cy.entity.TransactionType;
import com.cy.service.interfaces.TransactionServiceInter;

import antlr.Parser;

@Transactional
public class TransactionServiceImpl implements TransactionServiceInter {

	private TransactionDaoInter transactionDaoInter;
	private UserDaoInter userDaoInter;
	AdminDaoInter adminDaoInter;
	
	public void setAdminDaoInter(AdminDaoInter adminDaoInter) {
		this.adminDaoInter = adminDaoInter;
	}
	public void setTransactionDaoInter(TransactionDaoInter transactionDaoInter) {
		this.transactionDaoInter = transactionDaoInter;
	}
	public void setUserDaoInter(UserDaoInter userDaoInter) {
		this.userDaoInter = userDaoInter;
	}
	//存款
//	@Override
	public boolean deposit(TransactionLog log) {
		//从交易对象log中获取账户对象
        Account self = log.getAccount();
        //将账户余额与存款相加  
        //使用log.getTr_money()可以获取表单中填入的存款金额，原理是封装Transaction对象，实现action接收表单参数
        self.setBalance(log.getTr_money()+log.getAccount().getBalance());
        //更新账户表，修改余额
        userDaoInter.updateAccount(self);
        //根据交易类型获取交易对象
        TransactionType type = transactionDaoInter.getTranactionType("存款");
        log.setTransactionType(type);
        log.setOtherid(self.getAccountid());
        log.setDatetime(log.getDatetime());
		//调用接口中的addlog方法，向transaction_log中添加交易记录
        return transactionDaoInter.addLog(log);
	}
	//取款
//	@Override
	public boolean withdraw(TransactionLog log) {
		//从交易对象log中获取账户对象
		Account self = log.getAccount();
		 //将账户余额与存款相加  
        //使用log.getTr_money()可以获取表单中填入的存款金额，原理是封装Transaction对象，实现action接收表单参数
		self.setBalance(log.getAccount().getBalance()-log.getTr_money());
        //更新账户表，修改余额
		userDaoInter.updateAccount(self);
        //根据交易类型获取交易对象
		TransactionType type = transactionDaoInter.getTranactionType("取款");
		log.setTransactionType(type);
		log.setOtherid(self.getAccountid());
		log.setDatetime(log.getDatetime());
		//调用接口中的addlog方法，向transaction_log中添加交易记录
		return transactionDaoInter.addLog(log);
	}
	//转账
//	@Override
	@Transactional
	public boolean transfer(TransactionLog log) {
		//获取对方账户对象
		Account other = userDaoInter.getAccount(log.getOtherid());
        //获取自己账户对象		
		Account self = log.getAccount();
		if(other!=null) {
			//修改对方账户余额
			other.setBalance(other.getBalance()+log.getTr_money());
			//修改自己账户金额
			self.setBalance(self.getBalance()-log.getTr_money());
			//更新对方、自己账户的余额
			userDaoInter.updateAccount(other);
			userDaoInter.updateAccount(self);
			//根据交易类型获取交易对象
			TransactionType type = transactionDaoInter.getTranactionType("转账");
			log.setTransactionType(type);
			log.setOtherid(log.getOtherid());
			log.setDatetime(log.getDatetime());
			//向表transaction_log中添加交易记录
			return transactionDaoInter.addLog(log);
		}
		return false;
	}
	
//	@Override
	//获取交易记录
	public List getLogs(Account account, int page) {
		return transactionDaoInter.getLogs(account, page);
	}
	public List getLoanLogs(Account account, int page) {
		return transactionDaoInter.getLoanLogs(account, page);
	}
	//获取交易记录
	public List getLogsOfC(Account account) {
		return transactionDaoInter.getLogsOfC(account);
	}
	public String loanmoney(Account account,Admin a,Double money) {
		Double mon = a.getMoney()-money;
		a.setMoney(mon);
		boolean updateAdminPassword = adminDaoInter.updateAdminPassword(a);
		Double mon1 = account.getBalance() + money;
		account.setBalance(mon1);
		boolean updateAccount = userDaoInter.updateAccount(account);
		if(updateAdminPassword && updateAccount) {
			LoanLog log = new LoanLog();
			log.setAccount(account);
			log.setLoan_money(money);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	        String format = df.format(new Date());// new Date()为获取当前系统时间
			log.setDatetime(format);
			log.setHuan_money(money);
			transactionDaoInter.addloanLog(log);
			return "贷款成功";
		}else {
			return "贷款失败";
		}
	}
	public String huan(Account account,Admin a,int id) {
		LoanLog loanLog = transactionDaoInter.getLoanLog(id);
		if(loanLog != null) {
			Double huan_money = loanLog.getHuan_money();
			Double balance = account.getBalance();
			if(balance < huan_money) {
				return "余额不足，不能还款";
			}else {
				Double mon = a.getMoney()+huan_money;
				a.setMoney(mon);
				boolean updateAdminPassword = adminDaoInter.updateAdminPassword(a);
				Double mon1 = account.getBalance() - huan_money;
				account.setBalance(mon1);
				boolean updateAccount = userDaoInter.updateAccount(account);
				if(updateAdminPassword && updateAccount) {
					loanLog.setHuan_money(0.0);
					boolean uploanLog = transactionDaoInter.uploanLog(loanLog);
					return "还款成功";
				}else {
					return "还款失败";
				}
			}
		} else {
			return "还款失败";
		}
	}
//	@Override
	//获得账户的交易记录总数，用来初始化分页类Pager对象，
	//并设置其perPagerRows和rowCount属性
	public Pager getPagerOfLogs(Account account) {
		//从表Transaction_Log中获取与账户相关的交易记录数
		int count = transactionDaoInter.getCountOfLogs(account);
		//
		Pager pager = new Pager();
		//设置pager对象中PerPageRows属性，表示每页显示10条记录
		pager.setPerPageRows(8);
		//设置rowCount属性，表示记录总数
		pager.setRowCount(count);
		double parseDouble = Double.parseDouble(Integer.toString(count));
		Double a = Math.ceil(parseDouble/8.00);
		pager.setPageCount(a.intValue());
		return pager;
	}
	
	public Pager getPagerOfLoanLogs(Account account) {
		//从表Transaction_Log中获取与账户相关的交易记录数
		int count = transactionDaoInter.getCountOfLoanLogs(account);
		//
		Pager pager = new Pager();
		//设置pager对象中PerPageRows属性，表示每页显示8条记录
		pager.setPerPageRows(8);
		//设置rowCount属性，表示记录总数
		pager.setRowCount(count);
		double parseDouble = Double.parseDouble(Integer.toString(count));
		Double a = Math.ceil(parseDouble/8.00);
		pager.setPageCount(a.intValue());
		return pager;
	}
}
