package io.github.eyulingo.Entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class TagsPK implements Serializable{
    private Long goodId;

    private String tagName;
}
