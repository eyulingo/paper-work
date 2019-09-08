package io.github.eyulingo.Entity;


import javax.persistence.*;

@Table(name = "useraddresses")
@Entity
public class UserAddress {
        @Id
        @Column(name = "unique_id")
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long addressId;

        @Column(name = "user_id")
        private Long userId;

        @Column(name = "receiver_phone")
        private String recevierPhone;

        @Column(name = "receiver_address")
        private String receiverAddress;

        @Column(name = "receiver_name")
        private String receiverName;

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public Long getAddressId() {
        return addressId;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public String getRecevierPhone() {
        return recevierPhone;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public void setRecevierPhone(String recevierPhone) {
        this.recevierPhone = recevierPhone;
    }
}
