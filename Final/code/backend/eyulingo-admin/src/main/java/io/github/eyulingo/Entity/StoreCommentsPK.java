package io.github.eyulingo.Entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class StoreCommentsPK implements Serializable{
    private Long storeId;

    private Long userId;
}
