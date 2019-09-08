package io.github.eyulingo.Entity;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "admins")
public class Admins implements UserDetails {
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

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> auths=new ArrayList<GrantedAuthority>();

        auths.add(new SimpleGrantedAuthority("Admins"));

        return auths;
    }

    @Override
    public String getPassword() { return this.adminPassword; }

    @Override
    public String getUsername() {
        return this.adminName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
