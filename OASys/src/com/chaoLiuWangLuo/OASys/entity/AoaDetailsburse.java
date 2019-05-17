package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaDetailsburse {
    private Long detailsburseId;

    private String descript;

    private Double detailmoney;

    private Integer invoices;

    private Date produceTime;
    
    private String produceDate;

    private String subject;

    private AoaBursement bursment;

	public Long getDetailsburseId() {
		return detailsburseId;
	}

	public void setDetailsburseId(Long detailsburseId) {
		this.detailsburseId = detailsburseId;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Double getDetailmoney() {
		return detailmoney;
	}

	public void setDetailmoney(Double detailmoney) {
		this.detailmoney = detailmoney;
	}

	public Integer getInvoices() {
		return invoices;
	}

	public void setInvoices(Integer invoices) {
		this.invoices = invoices;
	}

	public Date getProduceTime() {
		return produceTime;
	}

	public void setProduceTime(Date produceTime) {
		this.produceTime = produceTime;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public AoaBursement getBursment() {
		return bursment;
	}

	public void setBursment(AoaBursement bursment) {
		this.bursment = bursment;
	}

	public String getProduceDate() {
		return produceDate;
	}

	public void setProduceDate(String produceDate) {
		this.produceDate = produceDate;
	}

  
}