package com.cy.entity;

import java.io.Serializable;

public class LoanLog implements Serializable {

	private Integer id;
    private Account account;
    private Double loan_money;
    private String datetime;
    private Double huan_money;
    
    public LoanLog() {}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Double getLoan_money() {
		return loan_money;
	}

	public void setLoan_money(Double loan_money) {
		this.loan_money = loan_money;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public Double getHuan_money() {
		return huan_money;
	}

	public void setHuan_money(Double huan_money) {
		this.huan_money = huan_money;
	}
     
}
