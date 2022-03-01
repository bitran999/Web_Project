package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class Products {
    private int id;
    private String proname;
    private String proslug;
    private int proprice;
    private int proauthorid;
    private short prosale;
    private byte proactive;
    private byte prohot;
    private int proview;
    private String prodescription;
    private String proavatar;
    private String prodescriptionseo;
    private String prokeywordseo;
    private String protitleseo;
    private String procontent;
    private byte propay;
    private byte pronumber;
    private int prototalrating;
    private int prototalnumber;
    private Timestamp createdat;
    private Timestamp updatedat;
    private Collection<Orders> ordersById;
    private Categories categoriesByProcategoryid;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "proname")
    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    @Basic
    @Column(name = "proslug")
    public String getProslug() {
        return proslug;
    }

    public void setProslug(String proslug) {
        this.proslug = proslug;
    }

    @Basic
    @Column(name = "proprice")
    public int getProprice() {
        return proprice;
    }

    public void setProprice(int proprice) {
        this.proprice = proprice;
    }

    @Basic
    @Column(name = "proauthorid")
    public int getProauthorid() {
        return proauthorid;
    }

    public void setProauthorid(int proauthorid) {
        this.proauthorid = proauthorid;
    }

    @Basic
    @Column(name = "prosale")
    public short getProsale() {
        return prosale;
    }

    public void setProsale(short prosale) {
        this.prosale = prosale;
    }

    @Basic
    @Column(name = "proactive")
    public byte getProactive() {
        return proactive;
    }

    public void setProactive(byte proactive) {
        this.proactive = proactive;
    }

    @Basic
    @Column(name = "prohot")
    public byte getProhot() {
        return prohot;
    }

    public void setProhot(byte prohot) {
        this.prohot = prohot;
    }

    @Basic
    @Column(name = "proview")
    public int getProview() {
        return proview;
    }

    public void setProview(int proview) {
        this.proview = proview;
    }

    @Basic
    @Column(name = "prodescription")
    public String getProdescription() {
        return prodescription;
    }

    public void setProdescription(String prodescription) {
        this.prodescription = prodescription;
    }

    @Basic
    @Column(name = "proavatar")
    public String getProavatar() {
        return proavatar;
    }

    public void setProavatar(String proavatar) {
        this.proavatar = proavatar;
    }

    @Basic
    @Column(name = "prodescriptionseo")
    public String getProdescriptionseo() {
        return prodescriptionseo;
    }

    public void setProdescriptionseo(String prodescriptionseo) {
        this.prodescriptionseo = prodescriptionseo;
    }

    @Basic
    @Column(name = "prokeywordseo")
    public String getProkeywordseo() {
        return prokeywordseo;
    }

    public void setProkeywordseo(String prokeywordseo) {
        this.prokeywordseo = prokeywordseo;
    }

    @Basic
    @Column(name = "protitleseo")
    public String getProtitleseo() {
        return protitleseo;
    }

    public void setProtitleseo(String protitleseo) {
        this.protitleseo = protitleseo;
    }

    @Basic
    @Column(name = "procontent")
    public String getProcontent() {
        return procontent;
    }

    public void setProcontent(String procontent) {
        this.procontent = procontent;
    }

    @Basic
    @Column(name = "propay")
    public byte getPropay() {
        return propay;
    }

    public void setPropay(byte propay) {
        this.propay = propay;
    }

    @Basic
    @Column(name = "pronumber")
    public byte getPronumber() {
        return pronumber;
    }

    public void setPronumber(byte pronumber) {
        this.pronumber = pronumber;
    }

    @Basic
    @Column(name = "prototalrating")
    public int getPrototalrating() {
        return prototalrating;
    }

    public void setPrototalrating(int prototalrating) {
        this.prototalrating = prototalrating;
    }

    @Basic
    @Column(name = "prototalnumber")
    public int getPrototalnumber() {
        return prototalnumber;
    }

    public void setPrototalnumber(int prototalnumber) {
        this.prototalnumber = prototalnumber;
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

        Products products = (Products) o;

        if (id != products.id) return false;
        if (proprice != products.proprice) return false;
        if (proauthorid != products.proauthorid) return false;
        if (prosale != products.prosale) return false;
        if (proactive != products.proactive) return false;
        if (prohot != products.prohot) return false;
        if (proview != products.proview) return false;
        if (propay != products.propay) return false;
        if (pronumber != products.pronumber) return false;
        if (prototalrating != products.prototalrating) return false;
        if (prototalnumber != products.prototalnumber) return false;
        if (proname != null ? !proname.equals(products.proname) : products.proname != null) return false;
        if (proslug != null ? !proslug.equals(products.proslug) : products.proslug != null) return false;
        if (prodescription != null ? !prodescription.equals(products.prodescription) : products.prodescription != null)
            return false;
        if (proavatar != null ? !proavatar.equals(products.proavatar) : products.proavatar != null) return false;
        if (prodescriptionseo != null ? !prodescriptionseo.equals(products.prodescriptionseo) : products.prodescriptionseo != null)
            return false;
        if (prokeywordseo != null ? !prokeywordseo.equals(products.prokeywordseo) : products.prokeywordseo != null)
            return false;
        if (protitleseo != null ? !protitleseo.equals(products.protitleseo) : products.protitleseo != null)
            return false;
        if (procontent != null ? !procontent.equals(products.procontent) : products.procontent != null) return false;
        if (createdat != null ? !createdat.equals(products.createdat) : products.createdat != null) return false;
        if (updatedat != null ? !updatedat.equals(products.updatedat) : products.updatedat != null) return false;

        return true;
    }


    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (proname != null ? proname.hashCode() : 0);
        result = 31 * result + (proslug != null ? proslug.hashCode() : 0);
        result = 31 * result + proprice;
        result = 31 * result + proauthorid;
        result = 31 * result + (int) prosale;
        result = 31 * result + (int) proactive;
        result = 31 * result + (int) prohot;
        result = 31 * result + proview;
        result = 31 * result + (prodescription != null ? prodescription.hashCode() : 0);
        result = 31 * result + (proavatar != null ? proavatar.hashCode() : 0);
        result = 31 * result + (prodescriptionseo != null ? prodescriptionseo.hashCode() : 0);
        result = 31 * result + (prokeywordseo != null ? prokeywordseo.hashCode() : 0);
        result = 31 * result + (protitleseo != null ? protitleseo.hashCode() : 0);
        result = 31 * result + (procontent != null ? procontent.hashCode() : 0);
        result = 31 * result + (int) propay;
        result = 31 * result + (int) pronumber;
        result = 31 * result + prototalrating;
        result = 31 * result + prototalnumber;
        result = 31 * result + (createdat != null ? createdat.hashCode() : 0);
        result = 31 * result + (updatedat != null ? updatedat.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "productsByOrproductid")
    public Collection<Orders> getOrdersById() {
        return ordersById;
    }

    public void setOrdersById(Collection<Orders> ordersById) {
        this.ordersById = ordersById;
    }

    @ManyToOne
    @JoinColumn(name = "procategoryid", referencedColumnName = "id", nullable = false)
    public Categories getCategoriesByProcategoryid() {
        return categoriesByProcategoryid;
    }

    public void setCategoriesByProcategoryid(Categories categoriesByProcategoryid) {
        this.categoriesByProcategoryid = categoriesByProcategoryid;
    }
}
