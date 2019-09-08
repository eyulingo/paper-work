package io.github.eyulingo.Entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@IdClass(CheckCodesPK.class)
@Table(name = "checkcodes")
public class CheckCodes {
    @Id
    @Column(name = "email_addr")
    private String userEmail;

    @Column(name = "check_code")
    private String checkCode;

    @Column(name = "time")
    private Timestamp time;

    @Id
    @Column(name = "type")
    Long type;

    public CheckCodes(){

    }

    public String getCheckCode() {
        return checkCode;
    }

    public Long getType() {
        return type;
    }

    public void setType(Long type) {
        this.type = type;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
