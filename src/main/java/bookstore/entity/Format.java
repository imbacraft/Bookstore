/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "format")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Format.findAll", query = "SELECT f FROM Format f")
    , @NamedQuery(name = "Format.findByFormatid", query = "SELECT f FROM Format f WHERE f.formatid = :formatid")
    , @NamedQuery(name = "Format.findByName", query = "SELECT f FROM Format f WHERE f.name = :name")})
public class Format implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "name")
    private String name;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "formatid")
    private Integer formatid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "format")
    private List<Bookdetails> bookdetailsList;

    public Format() {
    }

    public Format(Integer formatid) {
        this.formatid = formatid;
    }

    public Format(Integer formatid, String name) {
        this.formatid = formatid;
        this.name = name;
    }

    public Integer getFormatid() {
        return formatid;
    }

    public void setFormatid(Integer formatid) {
        this.formatid = formatid;
    }


    @XmlTransient
    public List<Bookdetails> getBookdetailsList() {
        return bookdetailsList;
    }

    public void setBookdetailsList(List<Bookdetails> bookdetailsList) {
        this.bookdetailsList = bookdetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (formatid != null ? formatid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Format)) {
            return false;
        }
        Format other = (Format) object;
        if ((this.formatid == null && other.formatid != null) || (this.formatid != null && !this.formatid.equals(other.formatid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Format[ formatid=" + formatid + " ]";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
