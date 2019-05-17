package com.chaoLiuWangLuo.OASys.entity;

import java.util.List;

public class AoaEvectionmoney {
    private Long evectionmoneyId;

    private String financialAdvice;

    private String managerAdvice;

    private Double money;

    private String name;

    private AoaProcessList evectionmoneyPro;

    private AoaProcessList evectionPro;
    
    private List<AoaTraffic> traffic;
    
    private List<AoaStay> stay;

    public Long getEvectionmoneyId() {
        return evectionmoneyId;
    }

    public void setEvectionmoneyId(Long evectionmoneyId) {
        this.evectionmoneyId = evectionmoneyId;
    }

    public String getFinancialAdvice() {
        return financialAdvice;
    }

    public void setFinancialAdvice(String financialAdvice) {
        this.financialAdvice = financialAdvice == null ? null : financialAdvice.trim();
    }

    public String getManagerAdvice() {
        return managerAdvice;
    }

    public void setManagerAdvice(String managerAdvice) {
        this.managerAdvice = managerAdvice == null ? null : managerAdvice.trim();
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

  

    public List<AoaTraffic> getTraffic() {
		return traffic;
	}

	public void setTraffic(List<AoaTraffic> traffic) {
		this.traffic = traffic;
	}

	public List<AoaStay> getStay() {
		return stay;
	}

	public void setStay(List<AoaStay> stay) {
		this.stay = stay;
	}

	public AoaProcessList getEvectionmoneyPro() {
		return evectionmoneyPro;
	}

	public void setEvectionmoneyPro(AoaProcessList evectionmoneyPro) {
		this.evectionmoneyPro = evectionmoneyPro;
	}

	public AoaProcessList getEvectionPro() {
		return evectionPro;
	}

	public void setEvectionPro(AoaProcessList evectionPro) {
		this.evectionPro = evectionPro;
	}

	 
}