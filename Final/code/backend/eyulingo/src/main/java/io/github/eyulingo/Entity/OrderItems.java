package io.github.eyulingo.Entity;


import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@IdClass(OrderItemsPK.class)
@Table(name = "orderitems")
public class OrderItems implements Serializable {
    @Id
    @Column(name = "order_id")
    private Long orderId;

    @Id
    @Column(name = "good_id")
    private Long goodId;

    @Column(name = "current_price")
    private BigDecimal currentPrice;

    @Column(name = "amount")
    private Long amount;

    public OrderItems(){}

    public void setOrderId(Long storeId) {
        this.orderId = storeId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Long getAmount() {
        return amount;
    }

    public Long getGoodId() {
        return goodId;
    }

    public void setGoodId(Long goodId) {
        this.goodId = goodId;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }
}
