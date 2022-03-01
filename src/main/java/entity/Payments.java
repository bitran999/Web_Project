package entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class Payments {
    private int id;
    private Integer pmoney;
    private String pnote;
    private String pvnpresponsecode;
    private String pcodevnp;
    private String pcodebank;
    private Timestamp ptime;
    private String ptransactioncode;
    private Timestamp createdAt;
    private Timestamp updatedat;
    private Transactions transactionsByPtransactionid;
    private Users usersByPuserid;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "pmoney")
    public Integer getPmoney() {
        return pmoney;
    }

    public void setPmoney(Integer pmoney) {
        this.pmoney = pmoney;
    }

    @Basic
    @Column(name = "pnote")
    public String getPnote() {
        return pnote;
    }

    public void setPnote(String pnote) {
        this.pnote = pnote;
    }

    @Basic
    @Column(name = "pvnpresponsecode")
    public String getPvnpresponsecode() {
        return pvnpresponsecode;
    }

    public void setPvnpresponsecode(String pvnpresponsecode) {
        this.pvnpresponsecode = pvnpresponsecode;
    }

    @Basic
    @Column(name = "pcodevnp")
    public String getPcodevnp() {
        return pcodevnp;
    }

    public void setPcodevnp(String pcodevnp) {
        this.pcodevnp = pcodevnp;
    }

    @Basic
    @Column(name = "pcodebank")
    public String getPcodebank() {
        return pcodebank;
    }

    public void setPcodebank(String pcodebank) {
        this.pcodebank = pcodebank;
    }

    @Basic
    @Column(name = "ptime")
    public Timestamp getPtime() {
        return ptime;
    }

    public void setPtime(Timestamp ptime) {
        this.ptime = ptime;
    }

    @Basic
    @Column(name = "ptransactioncode")
    public String getPtransactioncode() {
        return ptransactioncode;
    }

    public void setPtransactioncode(String ptransactioncode) {
        this.ptransactioncode = ptransactioncode;
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

        Payments payments = (Payments) o;

        if (id != payments.id) return false;
        if (pmoney != null ? !pmoney.equals(payments.pmoney) : payments.pmoney != null) return false;
        if (pnote != null ? !pnote.equals(payments.pnote) : payments.pnote != null) return false;
        if (pvnpresponsecode != null ? !pvnpresponsecode.equals(payments.pvnpresponsecode) : payments.pvnpresponsecode != null)
            return false;
        if (pcodevnp != null ? !pcodevnp.equals(payments.pcodevnp) : payments.pcodevnp != null) return false;
        if (pcodebank != null ? !pcodebank.equals(payments.pcodebank) : payments.pcodebank != null) return false;
        if (ptime != null ? !ptime.equals(payments.ptime) : payments.ptime != null) return false;
        if (ptransactioncode != null ? !ptransactioncode.equals(payments.ptransactioncode) : payments.ptransactioncode != null)
            return false;
        if (createdAt != null ? !createdAt.equals(payments.createdAt) : payments.createdAt != null) return false;
        if (updatedat != null ? !updatedat.equals(payments.updatedat) : payments.updatedat != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (pmoney != null ? pmoney.hashCode() : 0);
        result = 31 * result + (pnote != null ? pnote.hashCode() : 0);
        result = 31 * result + (pvnpresponsecode != null ? pvnpresponsecode.hashCode() : 0);
        result = 31 * result + (pcodevnp != null ? pcodevnp.hashCode() : 0);
        result = 31 * result + (pcodebank != null ? pcodebank.hashCode() : 0);
        result = 31 * result + (ptime != null ? ptime.hashCode() : 0);
        result = 31 * result + (ptransactioncode != null ? ptransactioncode.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedat != null ? updatedat.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "ptransactionid", referencedColumnName = "id")
    public Transactions getTransactionsByPtransactionid() {
        return transactionsByPtransactionid;
    }

    public void setTransactionsByPtransactionid(Transactions transactionsByPtransactionid) {
        this.transactionsByPtransactionid = transactionsByPtransactionid;
    }

    @ManyToOne
    @JoinColumn(name = "puserid", referencedColumnName = "id")
    public Users getUsersByPuserid() {
        return usersByPuserid;
    }

    public void setUsersByPuserid(Users usersByPuserid) {
        this.usersByPuserid = usersByPuserid;
    }
}
