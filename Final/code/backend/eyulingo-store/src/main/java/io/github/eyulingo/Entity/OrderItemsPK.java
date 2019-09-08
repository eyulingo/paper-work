package io.github.eyulingo.Entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderItemsPK implements Serializable {
    private Long orderId;
    private Long goodId;
}
