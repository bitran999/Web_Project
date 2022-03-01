package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

@Entity
public class Transactions {
    private int id;
    private int trtotal;
    private String trnote;
    private String traddress;
    private String trphone;
    private byte trstatus;
    private byte trpayment;
    private Timestamp createdat;
    private Timestamp updatedat;
    private List<Orders> ordersById;
    private Collection<Payments> paymentsById;
    private Users usersByTruserid;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "trtotal")
    public int getTrtotal() {
        return trtotal;
    }

    public void setTrtotal(int trtotal) {
        this.trtotal = trtotal;
    }

    @Basic
    @Column(name = "trnote")
    public String getTrnote() {
        return trnote;
    }

    public void setTrnote(String trnote) {
        this.trnote = trnote;
    }

    @Basic
    @Column(name = "traddress")
    public String getTraddress() {
        return traddress;
    }

    public void setTraddress(String traddress) {
        this.traddress = traddress;
    }

    @Basic
    @Column(name = "trphone")
    public String getTrphone() {
        return trphone;
    }

    public void setTrphone(String trphone) {
        this.trphone = trphone;
    }

    @Basic
    @Column(name = "trstatus")
    public byte getTrstatus() {
        return trstatus;
    }

    public void setTrstatus(byte trstatus) {
        this.trstatus = trstatus;
    }

    @Basic
    @Column(name = "trpayment")
    public byte getTrpayment() {
        return trpayment;
    }

    public void setTrpayment(byte trpayment) {
        this.trpayment = trpayment;
    }

    @Basic
    @Column(name = "createdat")
    public Timestamp getCreatedat() {
        return createdat;
    }

    public void setCreatedat(Timestamp createdat) {
        this.createdat = createdat;
    }

    @Basic
    @Column(name = "updatedat")
    public Timestamp getUpdatedat() {
        return updatedat;
    }

    public void setUpdatedat(Timestamp updatedat) {
        this.updatedat = updatedat;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Transactions that = (Transactions) o;

        if (id != that.id) return false;
        if (trtotal != that.trtotal) return false;
        if (trstatus != that.trstatus) return false;
        if (trpayment != that.trpayment) return false;
        if (trnote != null ? !trnote.equals(that.trnote) : that.trnote != null) return false;
        if (traddress != null ? !traddress.equals(that.traddress) : that.traddress != null) return false;
        if (trphone != null ? !trphone.equals(that.trphone) : that.trphone != null) return false;
        if (createdat != null ? !createdat.equals(that.createdat) : that.createdat != null) return false;
        if (updatedat != null ? !updatedat.equals(that.updatedat) : that.updatedat != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + trtotal;
        result = 31 * result + (trnote != null ? trnote.hashCode() : 0);
        result = 31 * result + (traddress != null ? traddress.hashCode() : 0);
        result = 31 * result + (trphone != null ? trphone.hashCode() : 0);
        result = 31 * result + (int) trstatus;
        result = 31 * result + (int) trpayment;
        result = 31 * result + (createdat != null ? createdat.hashCode() : 0);
        result = 31 * result + (updatedat != null ? updatedat.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "transactionsByOrtransactionid")
    public List<Orders> getOrdersById() {
        return ordersById;
    }

    public void setOrdersById(List<Orders> ordersById) {
        this.ordersById = ordersById;
    }

    @OneToMany(mappedBy = "transactionsByPtransactionid")
    public Collection<Payments> getPaymentsById() {
        return paymentsById;
    }

    public void setPaymentsById(Collection<Payments> paymentsById) {
        this.paymentsById = paymentsById;
    }

    @ManyToOne
    @JoinColumn(name = "truserid", referencedColumnName = "id", nullable = false)
    public Users getUsersByTruserid() {
        return usersByTruserid;
    }

    public void setUsersByTruserid(Users usersByTruserid) {
        this.usersByTruserid = usersByTruserid;
    }
}
