/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "book")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Book.findAll", query = "SELECT b FROM Book b")
    , @NamedQuery(name = "Book.findByBookid", query = "SELECT b FROM Book b WHERE b.bookid = :bookid")
    , @NamedQuery(name = "Book.findByTitle", query = "SELECT b FROM Book b WHERE b.title = :title")
    , @NamedQuery(name = "Book.findByDescription", query = "SELECT b FROM Book b WHERE b.description = :description")
    , @NamedQuery(name = "Book.findByPrice", query = "SELECT b FROM Book b WHERE b.price = :price")
    , @NamedQuery(name = "Book.findByPublisher", query = "SELECT b FROM Book b WHERE b.publisher = :publisher")
    , @NamedQuery(name = "Book.findByPublicationdate", query = "SELECT b FROM Book b WHERE b.publicationdate = :publicationdate")
    , @NamedQuery(name = "Book.findByEdition", query = "SELECT b FROM Book b WHERE b.edition = :edition")
    , @NamedQuery(name = "Book.findByPages", query = "SELECT b FROM Book b WHERE b.pages = :pages")
    , @NamedQuery(name = "Book.findByLanguage", query = "SELECT b FROM Book b WHERE b.language = :language")
    , @NamedQuery(name = "Book.findByFrontcover", query = "SELECT b FROM Book b WHERE b.frontcover = :frontcover")
    , @NamedQuery(name = "Book.findByBackcover", query = "SELECT b FROM Book b WHERE b.backcover = :backcover")
    , @NamedQuery(name = "Book.findByCount", query = "SELECT b FROM Book b WHERE b.count = :count")
    , @NamedQuery(name = "Book.findByIsbn10", query = "SELECT b FROM Book b WHERE b.isbn10 = :isbn10")
    , @NamedQuery(name = "Book.findByIsbn13", query = "SELECT b FROM Book b WHERE b.isbn13 = :isbn13")})
public class Book implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "bookid")
    private Integer bookid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3000)
    @Column(name = "description")
    private String description;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private BigDecimal price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "publisher")
    private String publisher;
    @Basic(optional = false)
    @NotNull
    @Column(name = "publicationdate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate publicationdate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "edition")
    private int edition;
    @Basic(optional = false)
    @NotNull
    @Column(name = "pages")
    private int pages;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "language")
    private String language;
    @Size(max = 80)
    @Column(name = "frontcover")
    private String frontcover;
    @Size(max = 80)
    @Column(name = "backcover")
    private String backcover;
    @Basic(optional = false)
    @NotNull
    @Column(name = "count")
    private int count;
    @Size(max = 45)
    @Column(name = "isbn10")
    private String isbn10;
    @Size(max = 45)
    @Column(name = "isbn13")
    private String isbn13;
    @JoinTable(name = "joinedbookcategory", joinColumns = {
        @JoinColumn(name = "bookid", referencedColumnName = "bookid")}, inverseJoinColumns = {
        @JoinColumn(name = "category", referencedColumnName = "categid")})
    @ManyToMany
    private List<Category> categoryList;
    @ManyToMany(mappedBy = "bookList")
    private List<Author> authorList;
    @JoinColumn(name = "booktype", referencedColumnName = "booktypeid")
    @ManyToOne(optional = false)
    private Booktype booktype;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bookid")
    private List<Review> reviewList;

    public Book() {
    }

    public Book(Integer bookid) {
        this.bookid = bookid;
    }

    public Book(Integer bookid, String title, String description, BigDecimal price, String publisher, LocalDate publicationdate, int edition, int pages, String language, int count) {
        this.bookid = bookid;
        this.title = title;
        this.description = description;
        this.price = price;
        this.publisher = publisher;
        this.publicationdate = publicationdate;
        this.edition = edition;
        this.pages = pages;
        this.language = language;
        this.count = count;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
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

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
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

    public String getBackcover() {
        return backcover;
    }

    public void setBackcover(String backcover) {
        this.backcover = backcover;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
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
    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

    @XmlTransient
    public List<Author> getAuthorList() {
        return authorList;
    }

    public void setAuthorList(List<Author> authorList) {
        this.authorList = authorList;
    }

    public Booktype getBooktype() {
        return booktype;
    }

    public void setBooktype(Booktype booktype) {
        this.booktype = booktype;
    }

    @XmlTransient
    public List<Review> getReviewList() {
        return reviewList;
    }

    public void setReviewList(List<Review> reviewList) {
        this.reviewList = reviewList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookid != null ? bookid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Book)) {
            return false;
        }
        Book other = (Book) object;
        if ((this.bookid == null && other.bookid != null) || (this.bookid != null && !this.bookid.equals(other.bookid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Book[ bookid=" + bookid + " ]";
    }
    
}
