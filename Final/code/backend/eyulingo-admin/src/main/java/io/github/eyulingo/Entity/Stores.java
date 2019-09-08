package io.github.eyulingo.Entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "stores")
public class Stores implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "store_id")
    private Long storeId;

    @Column(name = "store_name")
    private String storeName;

    @Column(name = "cover_id")
    private String coverId;

    @Column(name = "store_address")
    private String storeAddress;

    @Column(name = "store_phone")
    private String storePhone;

    @Column(name = "start_time")
    private String startTime;

    @Column(name = "end_time")
    private String endTime;

    @Column(name = "dist_name")
    private String distName;

    @Column(name = "dist_password")
    private String distPassword;

    @Column(name = "dist_location")
    private String distLocation;

    @Column(name ="dist_phone")
    private String distPhone;

    @Column(name = "dist_image_id")
    private String distImageId;

    @Column(name = "deliver_method")
    private String deliverMethod;

    @Column(name = "longitude")
    private double longitude;

    @Column(name = "latitude")
    private double latitude;

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public Stores(){

    }
    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Long getStoreId() {
        return storeId;
    }

    public String getCoverId() {
        return coverId;
    }

    public String getDistName() {
        return distName;
    }

    public String getDistLocation() {
        return distLocation;
    }

    public String getEndTime() {
        return endTime;
    }

    public String getDistPassword() {
        return distPassword;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public String getStoreName() {
        return storeName;
    }

    public String getStorePhone() {
        return storePhone;
    }

    public void setCoverId(String coverId) {
        this.coverId = coverId;
    }

    public void setDistName(String distName) {
        this.distName = distName;
    }

    public void setDistPassword(String distPassword) {
        this.distPassword = distPassword;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setDistLocation(String distLocation) {
        this.distLocation = distLocation;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getDistPhone() {
        return distPhone;
    }

    public void setStorePhone(String storePhone) {
        this.storePhone = storePhone;
    }

    public String getDistImageId() {
        return distImageId;
    }

    public void setDistImageId(String distImageId) {
        this.distImageId = distImageId;
    }

    public void setDistPhone(String distPhone) {
        this.distPhone = distPhone;
    }


    public void setDeliverMethod(String deliverMethod) {
        this.deliverMethod = deliverMethod;
    }

    public String getDeliverMethod() {
        return deliverMethod;
    }

}
