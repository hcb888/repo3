package com.chaoLiuWangLuo.OASys.entity;

public class AoaDirector {
    private Long directorId;

    private String address;

    private String companyNumber;

    private String email;

    private AoaAttachmentList image;

    private String phoneNumber;

    private String pinyin;

    private String remark;

    private String sex;

    private String userName;

    private AoaUser directorUser;

    private String companyname;

    public Long getDirectorId() {
        return directorId;
    }

    public void setDirectorId(Long directorId) {
        this.directorId = directorId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCompanyNumber() {
        return companyNumber;
    }

    public void setCompanyNumber(String companyNumber) {
        this.companyNumber = companyNumber == null ? null : companyNumber.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

  

  

	public AoaAttachmentList getImage() {
		return image;
	}

	public void setImage(AoaAttachmentList image) {
		this.image = image;
	}

	public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }

    public String getPinyin() {
        return pinyin;
    }

    public void setPinyin(String pinyin) {
        this.pinyin = pinyin == null ? null : pinyin.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

   

    public AoaUser getDirectorUser() {
		return directorUser;
	}

	public void setDirectorUser(AoaUser directorUser) {
		this.directorUser = directorUser;
	}

	public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }
}