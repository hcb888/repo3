package com.chaoLiuWangLuo.OASys.entity;

public class AoaVoteTitleUser {
    private Long voteTitleUserId;

    private Long voteId;

    private Long userId;

    private Long titleId;

    public Long getVoteTitleUserId() {
        return voteTitleUserId;
    }

    public void setVoteTitleUserId(Long voteTitleUserId) {
        this.voteTitleUserId = voteTitleUserId;
    }

    public Long getVoteId() {
        return voteId;
    }

    public void setVoteId(Long voteId) {
        this.voteId = voteId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getTitleId() {
        return titleId;
    }

    public void setTitleId(Long titleId) {
        this.titleId = titleId;
    }
}