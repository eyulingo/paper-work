package io.github.eyulingo.Entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@IdClass(TagsPK.class)
@Table(name = "tags")
public class Tags implements Serializable {
    @Id
    @Column(name = "good_id")
    private Long goodId;

    @Id
    @Column(name = "tag_name")
    private String tagName;

    public Tags(){

    }

    public Long getGoodId() {
        return goodId;
    }

    public void setGoodId(Long goodId) {
        this.goodId = goodId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }
}
