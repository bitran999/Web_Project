package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class Users {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String avatar;
    private byte active;
    private String password;
    private String rememberToken;
    private int totalPay;
    private String address;
    private String provider;
    private String providerId;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Collection<Payments> paymentsById;
    private Collection<Transactions> transactionsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "avatar")
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Basic
    @Column(name = "active")
    public byte getActive() {
        return active;
    }

    public void setActive(byte active) {
        this.active = active;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "remember_token")
    public String getRememberToken() {
        return rememberToken;
    }

    public void setRememberToken(String rememberToken) {
        this.rememberToken = rememberToken;
    }

    @Basic
    @Column(name = "total_pay")
    public int getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(int totalPay) {
        this.totalPay = totalPay;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "provider")
    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    @Basic
    @Column(name = "provider_id")
    public String getProviderId() {
        return providerId;
    }

    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }

    @Basic
    @Column(name = "created_at")
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Basic
    @Column(name = "updated_at")
    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (id != users.id) return false;
        if (active != users.active) return false;
        if (totalPay != users.totalPay) return false;
        if (name != null ? !name.equals(users.name) : users.name != null) return false;
        if (email != null ? !email.equals(users.email) : users.email != null) return false;
        if (phone != null ? !phone.equals(users.phone) : users.phone != null) return false;
        if (avatar != null ? !avatar.equals(users.avatar) : users.avatar != null) return false;
        if (password != null ? !password.equals(users.password) : users.password != null) return false;
        if (rememberToken != null ? !rememberToken.equals(users.rememberToken) : users.rememberToken != null)
            return false;
        if (address != null ? !address.equals(users.address) : users.address != null) return false;
        if (provider != null ? !provider.equals(users.provider) : users.provider != null) return false;
        if (providerId != null ? !providerId.equals(users.providerId) : users.providerId != null) return false;
        if (createdAt != null ? !createdAt.equals(users.createdAt) : users.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(users.updatedAt) : users.updatedAt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (avatar != null ? avatar.hashCode() : 0);
        result = 31 * result + (int) active;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (rememberToken != null ? rememberToken.hashCode() : 0);
        result = 31 * result + totalPay;
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (provider != null ? provider.hashCode() : 0);
        result = 31 * result + (providerId != null ? providerId.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedAt != null ? updatedAt.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "usersByPuserid")
    public Collection<Payments> getPaymentsById() {
        return paymentsById;
    }

    public void setPaymentsById(Collection<Payments> paymentsById) {
        this.paymentsById = paymentsById;
    }

    @OneToMany(mappedBy = "usersByTruserid")
    public Collection<Transactions> getTransactionsById() {
        return transactionsById;
    }

    public void setTransactionsById(Collection<Transactions> transactionsById) {
        this.transactionsById = transactionsById;
    }
}
