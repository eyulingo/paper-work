package io.github.eyulingo.Entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admins")
public class Admins {
    @Id
    @Column(name = "admin_name")
    private String adminName;

    @Column(name = "admin_password")
    private String adminPassword;

    public Admins(){}

    public String getAdminName() {
        return adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }
}
