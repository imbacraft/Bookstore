/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "bookdetails")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookdetails.findAll", query = "SELECT b FROM Bookdetails b")
    , @NamedQuery(name = "Bookdetails.findByBookdetailsid", query = "SELECT b FROM Bookdetails b WHERE b.bookdetailsid = :bookdetailsid")
    , @NamedQuery(name = "Bookdetails.findByPrice", query = "SELECT b FROM Bookdetails b WHERE b.price = :price")
    , @NamedQuery(name = "Bookdetails.findByPublisher", query = "SELECT b FROM Bookdetails b WHERE b.publisher = :publisher")
    , @NamedQuery(name = "Bookdetails.findByPublicationdate", query = "SELECT b FROM Bookdetails b WHERE b.publicationdate = :publicationdate")
    , @NamedQuery(name = "Bookdetails.findByEdition", query = "SELECT b FROM Bookdetails b WHERE b.edition = :edition")
    , @NamedQuery(name = "Bookdetails.findByPages", query = "SELECT b FROM Bookdetails b WHERE b.pages = :pages")
    , @NamedQuery(name = "Bookdetails.findByLanguage", query = "SELECT b FROM Bookdetails b WHERE b.language = :language")
    , @NamedQuery(name = "Bookdetails.findByFrontcover", query = "SELECT b FROM Bookdetails b WHERE b.frontcover = :frontcover")
    , @NamedQuery(name = "Bookdetails.findByCount", query = "SELECT b FROM Bookdetails b WHERE b.count = :count")
    , @NamedQuery(name = "Bookdetails.findByIsbn10", query = "SELECT b FROM Bookdetails b WHERE b.isbn10 = :isbn10")
    , @NamedQuery(name = "Bookdetails.findByIsbn13", query = "SELECT b FROM Bookdetails b WHERE b.isbn13 = :isbn13")})
public class Bookdetails implements Serializable {

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "price")
    private double price;
    @Size(max = 145)
    @Column(name = "publisher")
    private String publisher;
    @Column(name = "publicationdate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate publicationdate;
    @Size(max = 145)
    @Column(name = "language")
    private String language;
    @Size(max = 245)
    @Column(name = "frontcover")
    private String frontcover;
    @Size(max = 245)
    @Column(name = "isbn10")
    private String isbn10;
    @Size(max = 245)
    @Column(name = "isbn13")
    private String isbn13;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bookdetails")
    private List<Cartitem> cartitemList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "bookdetailsid")
    private Integer bookdetailsid;
    @Column(name = "edition")
    private Integer edition;
    @Column(name = "pages")
    private Integer pages;
    @Column(name = "count")
    private Integer count;
    @JoinColumn(name = "bookid", referencedColumnName = "bookid")
    @ManyToOne
    private Book book;
    @JoinColumn(name = "formatid", referencedColumnName = "formatid")
    @ManyToOne(optional = false)
    private Format format;

    public Bookdetails() {
    }

    public Bookdetails(Integer bookdetailsid) {
        this.bookdetailsid = bookdetailsid;
    }

    public Integer getBookdetailsid() {
        return bookdetailsid;
    }

    public void setBookdetailsid(Integer bookdetailsid) {
        this.bookdetailsid = bookdetailsid;
    }


    public Integer getEdition() {
        return edition;
    }

    public void setEdition(Integer edition) {
        this.edition = edition;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }


    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }


    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Format getFormat() {
        return format;
    }

    public void setFormatid(Format format) {
        this.format = format;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookdetailsid != null ? bookdetailsid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bookdetails)) {
            return false;
        }
        Bookdetails other = (Bookdetails) object;
        if ((this.bookdetailsid == null && other.bookdetailsid != null) || (this.bookdetailsid != null && !this.bookdetailsid.equals(other.bookdetailsid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Bookdetails[ bookdetailsid=" + bookdetailsid + " ]";
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public LocalDate getPublicationdate() {
        return publicationdate;
    }

    public void setPublicationdate(LocalDate publicationdate) {
        this.publicationdate = publicationdate;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getFrontcover() {
        return frontcover;
    }

    public void setFrontcover(String frontcover) {
        this.frontcover = frontcover;
    }

    public String getIsbn10() {
        return isbn10;
    }

    public void setIsbn10(String isbn10) {
        this.isbn10 = isbn10;
    }

    public String getIsbn13() {
        return isbn13;
    }

    public void setIsbn13(String isbn13) {
        this.isbn13 = isbn13;
    }

    @XmlTransient
    public List<Cartitem> getCartitemList() {
        return cartitemList;
    }

    public void setCartitemList(List<Cartitem> cartitemList) {
        this.cartitemList = cartitemList;
    }
    
}
