package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;
import java.util.List;

import com.chaoLiuWangLuo.OASys.entity.*;

public class AoaBursement {
    private Long bursementId;

    private Double allMoney;

    private String allinvoices;

    private Date burseTime;

    private String financialAdvice;

    private String managerAdvice;

    private String name;

    private AoaTypeList bursementType;

    private AoaUser operationUser;

    private AoaProcessList process;

    private AoaUser bursementUser;
    
    private List<AoaDetailsburse> details;

	public Long getBursementId() {
		return bursementId;
	}

	public void setBursementId(Long bursementId) {
		this.bursementId = bursementId;
	}

	public Double getAllMoney() {
		return allMoney;
	}

	public void setAllMoney(Double allMoney) {
		this.allMoney = allMoney;
	}

	public String getAllinvoices() {
		return allinvoices;
	}

	public void setAllinvoices(String allinvoices) {
		this.allinvoices = allinvoices;
	}

	public Date getBurseTime() {
		return burseTime;
	}

	public void setBurseTime(Date burseTime) {
		this.burseTime = burseTime;
	}

	public String getFinancialAdvice() {
		return financialAdvice;
	}

	public void setFinancialAdvice(String financialAdvice) {
		this.financialAdvice = financialAdvice;
	}

	public String getManagerAdvice() {
		return managerAdvice;
	}

	public void setManagerAdvice(String managerAdvice) {
		this.managerAdvice = managerAdvice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AoaTypeList getBursementType() {
		return bursementType;
	}

	public void setBursementType(AoaTypeList bursementType) {
		this.bursementType = bursementType;
	}

	public AoaUser getOperationUser() {
		return operationUser;
	}

	public void setOperationUser(AoaUser operationUser) {
		this.operationUser = operationUser;
	}

	public AoaProcessList getProcess() {
		return process;
	}

	public void setProcess(AoaProcessList process) {
		this.process = process;
	}

	public AoaUser getBursementUser() {
		return bursementUser;
	}

	public void setBursementUser(AoaUser bursementUser) {
		this.bursementUser = bursementUser;
	}

	public List<AoaDetailsburse> getDetails() {
		return details;
	}

	public void setDetails(List<AoaDetailsburse> details) {
		this.details = details;
	}

	 

	 
  
 
}