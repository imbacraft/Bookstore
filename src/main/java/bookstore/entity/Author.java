/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "author")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Author.findAll", query = "SELECT a FROM Author a")
    , @NamedQuery(name = "Author.findByAuthorid", query = "SELECT a FROM Author a WHERE a.authorid = :authorid")
    , @NamedQuery(name = "Author.findByFirstname", query = "SELECT a FROM Author a WHERE a.firstname = :firstname")
    , @NamedQuery(name = "Author.findByLastname", query = "SELECT a FROM Author a WHERE a.lastname = :lastname")
    , @NamedQuery(name = "Author.findByBiography", query = "SELECT a FROM Author a WHERE a.biography = :biography")
    , @NamedQuery(name = "Author.findByPortrait", query = "SELECT a FROM Author a WHERE a.portrait = :portrait")})
public class Author implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "authorid")
    private Integer authorid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "lastname")
    private String lastname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2500)
    @Column(name = "biography")
    private String biography;
    @Size(max = 250)
    @Column(name = "portrait")
    private String portrait;
    @JoinTable(name = "joinedbookauthor", joinColumns = {
        @JoinColumn(name = "authorid", referencedColumnName = "authorid")}, inverseJoinColumns = {
        @JoinColumn(name = "bookid", referencedColumnName = "bookid")})
    @ManyToMany
    private List<Book> bookList;

    public Author() {
    }

    public Author(Integer authorid) {
        this.authorid = authorid;
    }

    public Author(Integer authorid, String firstname, String lastname, String biography) {
        this.authorid = authorid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.biography = biography;
    }

    public Integer getAuthorid() {
        return authorid;
    }

    public void setAuthorid(Integer authorid) {
        this.authorid = authorid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
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
        hash += (authorid != null ? authorid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Author)) {
            return false;
        }
        Author other = (Author) object;
        if ((this.authorid == null && other.authorid != null) || (this.authorid != null && !this.authorid.equals(other.authorid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Author[ authorid=" + authorid + " ]";
    }
    
}
