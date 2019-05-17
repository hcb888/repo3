package com.chaoLiuWangLuo.OASys.entity;

public class AoaStatusList {
    private Long statusId;

    private String statusColor;

    private String statusModel;

    private String statusName;

    private Integer sortValue;

    private String sortPrecent;

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public String getStatusColor() {
        return statusColor;
    }

    public void setStatusColor(String statusColor) {
        this.statusColor = statusColor == null ? null : statusColor.trim();
    }

    public String getStatusModel() {
        return statusModel;
    }

    public void setStatusModel(String statusModel) {
        this.statusModel = statusModel == null ? null : statusModel.trim();
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName == null ? null : statusName.trim();
    }

    public Integer getSortValue() {
        return sortValue;
    }

    public void setSortValue(Integer sortValue) {
        this.sortValue = sortValue;
    }

    public String getSortPrecent() {
        return sortPrecent;
    }

    public void setSortPrecent(String sortPrecent) {
        this.sortPrecent = sortPrecent == null ? null : sortPrecent.trim();
    }
}