package com.chaoLiuWangLuo.OASys.entity;

import java.util.Date;

public class AoaVoteList {
    private Long voteId;

    private Date endTime;

    private Integer selectone;

    private Date startTime;

    public Long getVoteId() {
        return voteId;
    }

    public void setVoteId(Long voteId) {
        this.voteId = voteId;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getSelectone() {
        return selectone;
    }

    public void setSelectone(Integer selectone) {
        this.selectone = selectone;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
}