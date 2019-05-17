package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaDirectorUsers {
    private Long directorUsersId;
    
    private Date sharetime;
    
    private String shareDate;

    private Integer isHandle;
    
    private AoaTypeList duType;

    private AoaDirector director;

    private AoaUser user;

    private AoaUser shareUser;

   

    public String getShareDate() {
		return shareDate;
	}

	public void setShareDate(String shareDate) {
		this.shareDate = shareDate;
	}

	public Long getDirectorUsersId() {
        return directorUsersId;
    }

    public void setDirectorUsersId(Long directorUsersId) {
        this.directorUsersId = directorUsersId;
    }

   
    public Integer getIsHandle() {
        return isHandle;
    }

    public void setIsHandle(Integer isHandle) {
        this.isHandle = isHandle;
    }

   

    
 

	public AoaTypeList getDuType() {
		return duType;
	}

	public void setDuType(AoaTypeList duType) {
		this.duType = duType;
	}

	public AoaDirector getDirector() {
		return director;
	}

	public void setDirector(AoaDirector director) {
		this.director = director;
	}

	public AoaUser getUser() {
		return user;
	}

	public void setUser(AoaUser user) {
		this.user = user;
	}

	public AoaUser getShareUser() {
		return shareUser;
	}

	public void setShareUser(AoaUser shareUser) {
		this.shareUser = shareUser;
	}

	public Date getSharetime() {
        return sharetime;
    }

    public void setSharetime(Date sharetime) {
        this.sharetime = sharetime;
    }
}