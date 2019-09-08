package io.github.eyulingo.Entity;


import lombok.Data;

import java.io.Serializable;


@Data
public class CheckCodesPK implements Serializable {
    private Long type;

    private String userEmail;
}
