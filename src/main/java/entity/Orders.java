package entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class Orders {
    private int id;
    private byte orqty;
    private int orprice;
    private byte orsale;
    private Timestamp createdat;
    private Timestamp updatedat;
    private Transactions transactionsByOrtransactionid;
    private Products productsByOrproductid;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "orqty")
    public byte getOrqty() {
        return orqty;
    }

    public void setOrqty(byte orqty) {
        this.orqty = orqty;
    }

    @Basic
    @Column(name = "orprice")
    public int getOrprice() {
        return orprice;
    }

    public void setOrprice(int orprice) {
        this.orprice = orprice;
    }

    @Basic
    @Column(name = "orsale")
    public byte getOrsale() {
        return orsale;
    }

    public void setOrsale(byte orsale) {
        this.orsale = orsale;
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

        Orders orders = (Orders) o;

        if (id != orders.id) return false;
        if (orqty != orders.orqty) return false;
        if (orprice != orders.orprice) return false;
        if (orsale != orders.orsale) return false;
        if (createdat != null ? !createdat.equals(orders.createdat) : orders.createdat != null) return false;
        if (updatedat != null ? !updatedat.equals(orders.updatedat) : orders.updatedat != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (int) orqty;
        result = 31 * result + orprice;
        result = 31 * result + (int) orsale;
        result = 31 * result + (createdat != null ? createdat.hashCode() : 0);
        result = 31 * result + (updatedat != null ? updatedat.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "ortransactionid", referencedColumnName = "id", nullable = false)
    public Transactions getTransactionsByOrtransactionid() {
        return transactionsByOrtransactionid;
    }

    public void setTransactionsByOrtransactionid(Transactions transactionsByOrtransactionid) {
        this.transactionsByOrtransactionid = transactionsByOrtransactionid;
    }

    @ManyToOne
    @JoinColumn(name = "orproductid", referencedColumnName = "id", nullable = false)
    public Products getProductsByOrproductid() {
        return productsByOrproductid;
    }

    public void setProductsByOrproductid(Products productsByOrproductid) {
        this.productsByOrproductid = productsByOrproductid;
    }
}
