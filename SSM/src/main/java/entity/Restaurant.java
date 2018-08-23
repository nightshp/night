package entity;

public class Restaurant {

    private Integer restaurId;

    private String restaurName;

    private String restaurAddress;

    private String phone;

    private String restaurRange;

    private String restaurDescribe;

    private Integer fee;

    private String restaurPic;

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


    public String getRestaurRange() {
        return restaurRange;
    }


    public void setRestaurRange(String restaurRange) {
        this.restaurRange = restaurRange == null ? null : restaurRange.trim();
    }


    public String getRestaurDescribe() {
        return restaurDescribe;
    }


    public void setRestaurDescribe(String restaurDescribe) {
        this.restaurDescribe = restaurDescribe == null ? null : restaurDescribe.trim();
    }

    public Integer getFee() {
        return fee;
    }


    public void setFee(Integer fee) {
        this.fee = fee;
    }


    public String getRestaurPic() {
        return restaurPic;
    }

    public void setRestaurPic(String restaurPic) {
        this.restaurPic = restaurPic == null ? null : restaurPic.trim();
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "restaurId=" + restaurId +
                ", restaurName='" + restaurName + '\'' +
                ", restaurAddress='" + restaurAddress + '\'' +
                ", phone='" + phone + '\'' +
                ", restaurRange='" + restaurRange + '\'' +
                ", restaurDescribe='" + restaurDescribe + '\'' +
                ", fee=" + fee +
                ", restaurPic='" + restaurPic + '\'' +
                '}';
    }
}