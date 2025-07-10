package model.bean;

import java.sql.Date;

public class Info {

    private int id;
    private String type; // "coupon" or "promotion"

    // Coupon fields
    private String code;
    private int discount;
    private Date validFrom;
    private Date validUntil;
    private int usageLimit;

    // Promotion fields
    private String title;
    private String description;
    private Date startDate;
    private Date endDate;
    private String audience;

    // Constructor
    public Info() {}

    // === Common ===
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    // === Coupon ===
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public int getDiscount() {
        return discount;
    }
    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getValidFrom() {
        return validFrom;
    }
    public void setValidFrom(Date validFrom) {
        this.validFrom = validFrom;
    }

    public Date getValidUntil() {
        return validUntil;
    }
    public void setValidUntil(Date validUntil) {
        this.validUntil = validUntil;
    }

    public int getUsageLimit() {
        return usageLimit;
    }
    public void setUsageLimit(int usageLimit) {
        this.usageLimit = usageLimit;
    }

    // === Promotion ===
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getAudience() {
        return audience;
    }
    public void setAudience(String audience) {
        this.audience = audience;
    }
}