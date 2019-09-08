package io.github.eyulingo.Entity;


import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Long orderId;

    @Column(name = "receiver")
    private String receiver;

    @Column(name = "re_phone")
    private String rePhone;

    @Column(name="re_address")
    private String reAddress;

    @Column(name="deliver_method")
    private String deliverMethod;

    @Column(name = "status")
    private String status;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "order_time")
    private Timestamp orderTime;

    @Column(name = "store_id")
    private  Long storeId;

    @Column(name = "rated")
    private  Boolean rated;

    @Column(name = "rate_level")
    private  float rateLevel;

    @Column(name = "comment_content")
    private String commentContent;

    public Boolean getRated() {
        return rated;
    }

    public float getRateLevel() {
        return rateLevel;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public void setRated(Boolean rated) {
        this.rated = rated;
    }

    public void setRateLevel(float rateLevel) {
        this.rateLevel = rateLevel;
    }

    public Orders(){

    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public String getDeliverMethod() {
        return deliverMethod;
    }

    public String getReAddress() {
        return reAddress;
    }

    public String getReceiver() {
        return receiver;
    }

    public String getRePhone() {
        return rePhone;
    }

    public void setDeliverMethod(String deliverMethod) {
        this.deliverMethod = deliverMethod;
    }

    public String getStatus() {
        return status;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public void setReAddress(String reAddress) {
        this.reAddress = reAddress;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public void setRePhone(String rePhone) {
        this.rePhone = rePhone;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Long getStoreId() {
        return storeId;
    }
}
