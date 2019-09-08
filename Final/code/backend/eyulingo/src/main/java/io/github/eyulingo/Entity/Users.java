package io.github.eyulingo.Entity;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@Table(name = "users")
@Entity
public class Users implements UserDetails {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "cover_id")
    private String imageId;


    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getUserId() {
        return userId;
    }

    public String getImageId() {
        return imageId;
    }


    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> auths=new ArrayList<GrantedAuthority>();

        auths.add(new SimpleGrantedAuthority("User"));

        return auths;
    }

    @Override
    public String getUsername() {
        return this.userName;
    }

    @Override
    public String getPassword() { return this.password; }

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

    @Override
    public boolean equals(Object rhs) {
        return rhs instanceof Users ? this.userName.equals(((Users)rhs).userName) : false;
    }

    /**
     * Returns the hashcode of the {@code username}.
     */
    @Override
    public int hashCode() {
        return userName.hashCode();
    }

}

