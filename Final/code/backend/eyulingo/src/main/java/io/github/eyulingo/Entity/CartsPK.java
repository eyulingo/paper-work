package io.github.eyulingo.Entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class CartsPK implements Serializable {
    private Long userId;

    private Long goodId;
}
