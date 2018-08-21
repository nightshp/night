package entity;

import java.util.Date;

public class Deliver {

    private Integer deliverId;

    private String deliverName;

    private String deliverPhone;

    private String homeAddr;

    private Date employDate;

    private Integer restaurId;

    public Integer getDeliverId() {
        return deliverId;
    }

    public void setDeliverId(Integer deliverId) {
        this.deliverId = deliverId;
    }

    public String getDeliverName() {
        return deliverName;
    }

    public void setDeliverName(String deliverName) {
        this.deliverName = deliverName == null ? null : deliverName.trim();
    }

    public String getDeliverPhone() {
        return deliverPhone;
    }

    public void setDeliverPhone(String deliverPhone) {
        this.deliverPhone = deliverPhone == null ? null : deliverPhone.trim();
    }

    public String getHomeAddr() {
        return homeAddr;
    }

    public void setHomeAddr(String homeAddr) {
        this.homeAddr = homeAddr == null ? null : homeAddr.trim();
    }

    public Date getEmployDate() {
        return employDate;
    }

    public void setEmployDate(Date employDate) {
        this.employDate = employDate;
    }

    public Integer getRestaurId() {
        return restaurId;
    }

    public void setRestaurId(Integer restaurId) {
        this.restaurId = restaurId;
    }
}