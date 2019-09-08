package io.github.eyulingo.Entity;


import lombok.Data;

import java.io.Serializable;

@Data
public class GoodCommentsPK implements Serializable {
    private Long goodId;
    private Long userId;
}
