package io.github.eyulingo.Entity;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@IdClass(CartsPK.class)
@Table(name="carts")
public class Carts implements Serializable {
    @Id
    @Column(name = "user_id")
    private Long userId;

    @Id
    @Column(name = "good_id")
    private Long goodId;

    @Column(name = "amount")
    private Long amount;

    public Carts(){

    }

    public void setGoodId(Long goodId) {
        this.goodId = goodId;
    }

    public Long getGoodId() {
        return goodId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

}
