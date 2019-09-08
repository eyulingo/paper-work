package io.github.eyulingo.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "delivers")
public class Delivers {
    @Id
    @Column(name="deliver_name")
    private String deliverName;

    public Delivers(){

    }

    public String getDeliverName() {
        return deliverName;
    }

    public void setDeliverName(String deliverName) {
        this.deliverName = deliverName;
    }
}
