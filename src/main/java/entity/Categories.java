package entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class Categories {
    private int id;
    private String cname;
    private String cslug;
    private String cicon;
    private byte cactive;
    private String ctitleseo;
    private String cdescriptionseo;
    private String ckeywordseo;
    private byte chome;
    private Timestamp createdat;
    private Timestamp updatedat;
    private transient Collection<Products> productsById;



    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "cname")
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Basic
    @Column(name = "cslug")
    public String getCslug() {
        return cslug;
    }

    public void setCslug(String cslug) {
        this.cslug = cslug;
    }

    @Basic
    @Column(name = "cicon")
    public String getCicon() {
        return cicon;
    }

    public void setCicon(String cicon) {
        this.cicon = cicon;
    }

    @Basic
    @Column(name = "cactive")
    public byte getCactive() {
        return cactive;
    }

    public void setCactive(byte cactive) {
        this.cactive = cactive;
    }

    @Basic
    @Column(name = "ctitleseo")
    public String getCtitleseo() {
        return ctitleseo;
    }

    public void setCtitleseo(String ctitleseo) {
        this.ctitleseo = ctitleseo;
    }

    @Basic
    @Column(name = "cdescriptionseo")
    public String getCdescriptionseo() {
        return cdescriptionseo;
    }

    public void setCdescriptionseo(String cdescriptionseo) {
        this.cdescriptionseo = cdescriptionseo;
    }

    @Basic
    @Column(name = "ckeywordseo")
    public String getCkeywordseo() {
        return ckeywordseo;
    }

    public void setCkeywordseo(String ckeywordseo) {
        this.ckeywordseo = ckeywordseo;
    }

    @Basic
    @Column(name = "chome")
    public byte getChome() {
        return chome;
    }

    public void setChome(byte chome) {
        this.chome = chome;
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

        Categories that = (Categories) o;

        if (id != that.id) return false;
        if (cactive != that.cactive) return false;
        if (chome != that.chome) return false;
        if (cname != null ? !cname.equals(that.cname) : that.cname != null) return false;
        if (cslug != null ? !cslug.equals(that.cslug) : that.cslug != null) return false;
        if (cicon != null ? !cicon.equals(that.cicon) : that.cicon != null) return false;
        if (ctitleseo != null ? !ctitleseo.equals(that.ctitleseo) : that.ctitleseo != null) return false;
        if (cdescriptionseo != null ? !cdescriptionseo.equals(that.cdescriptionseo) : that.cdescriptionseo != null)
            return false;
        if (ckeywordseo != null ? !ckeywordseo.equals(that.ckeywordseo) : that.ckeywordseo != null) return false;
        if (createdat != null ? !createdat.equals(that.createdat) : that.createdat != null) return false;
        if (updatedat != null ? !updatedat.equals(that.updatedat) : that.updatedat != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (cname != null ? cname.hashCode() : 0);
        result = 31 * result + (cslug != null ? cslug.hashCode() : 0);
        result = 31 * result + (cicon != null ? cicon.hashCode() : 0);
        result = 31 * result + (int) cactive;
        result = 31 * result + (ctitleseo != null ? ctitleseo.hashCode() : 0);
        result = 31 * result + (cdescriptionseo != null ? cdescriptionseo.hashCode() : 0);
        result = 31 * result + (ckeywordseo != null ? ckeywordseo.hashCode() : 0);
        result = 31 * result + (int) chome;
        result = 31 * result + (createdat != null ? createdat.hashCode() : 0);
        result = 31 * result + (updatedat != null ? updatedat.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "categoriesByProcategoryid")
    public Collection<Products> getProductsById() {
        return productsById;
    }

    public void setProductsById(Collection<Products> productsById) {
        this.productsById = productsById;
    }
}
