package entity;

public class Restaurant {

    private Integer restaurId;

    private String restaurName;

    private String restaurAddress;

    private String phone;

    private String range;

    private String describe;

    private Integer fee;

    public Integer getRestaurId() {
        return restaurId;
    }

    public void setRestaurId(Integer restaurId) {
        this.restaurId = restaurId;
    }

    public String getRestaurName() {
        return restaurName;
    }

    public void setRestaurName(String restaurName) {
        this.restaurName = restaurName == null ? null : restaurName.trim();
    }

    public String getRestaurAddress() {
        return restaurAddress;
    }

    public void setRestaurAddress(String restaurAddress) {
        this.restaurAddress = restaurAddress == null ? null : restaurAddress.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range == null ? null : range.trim();
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe == null ? null : describe.trim();
    }

    public Integer getFee() {
        return fee;
    }

    public void setFee(Integer fee) {
        this.fee = fee;
    }
}