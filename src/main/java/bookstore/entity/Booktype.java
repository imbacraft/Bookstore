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
import javax.persistence.FetchType;
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
@Table(name = "booktype")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Booktype.findAll", query = "SELECT b FROM Booktype b")
    , @NamedQuery(name = "Booktype.findByBooktypeid", query = "SELECT b FROM Booktype b WHERE b.booktypeid = :booktypeid")
    , @NamedQuery(name = "Booktype.findByName", query = "SELECT b FROM Booktype b WHERE b.name = :name")})
public class Booktype implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "booktypeid")
    private Integer booktypeid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "name")
    private String name;
    @OneToMany(mappedBy = "booktype")
    private List<Book> bookList;

    public Booktype() {
    }

    public Booktype(Integer booktypeid) {
        this.booktypeid = booktypeid;
    }

    public Booktype(Integer booktypeid, String name) {
        this.booktypeid = booktypeid;
        this.name = name;
    }

    public Integer getBooktypeid() {
        return booktypeid;
    }

    public void setBooktypeid(Integer booktypeid) {
        this.booktypeid = booktypeid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (booktypeid != null ? booktypeid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Booktype)) {
            return false;
        }
        Booktype other = (Booktype) object;
        if ((this.booktypeid == null && other.booktypeid != null) || (this.booktypeid != null && !this.booktypeid.equals(other.booktypeid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Booktype[ booktypeid=" + booktypeid + " ]";
    }
    
}
