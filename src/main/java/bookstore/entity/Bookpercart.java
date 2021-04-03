/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "bookpercart")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookpercart.findAll", query = "SELECT b FROM Bookpercart b")
    , @NamedQuery(name = "Bookpercart.findByBookpercartid", query = "SELECT b FROM Bookpercart b WHERE b.bookpercartid = :bookpercartid")
    , @NamedQuery(name = "Bookpercart.findByQuantity", query = "SELECT b FROM Bookpercart b WHERE b.quantity = :quantity")})
public class Bookpercart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "bookpercartid")
    private Integer bookpercartid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    @JoinColumn(name = "bookid", referencedColumnName = "bookid")
    @ManyToOne(optional = false)
    private Book book;
    @JoinColumn(name = "cartid", referencedColumnName = "cartid")
    @ManyToOne(optional = false)
    private Cart cart;
    
    public Bookpercart() {
    }

    public Bookpercart(Integer bookpercartid) {
        this.bookpercartid = bookpercartid;
    }

    public Bookpercart(Integer bookpercartid, int quantity) {
        this.bookpercartid = bookpercartid;
        this.quantity = quantity;
    }

    public Integer getBookpercartid() {
        return bookpercartid;
    }

    public void setBookpercartid(Integer bookpercartid) {
        this.bookpercartid = bookpercartid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCartid(Cart cart) {
        this.cart = cart;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookpercartid != null ? bookpercartid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bookpercart)) {
            return false;
        }
        Bookpercart other = (Bookpercart) object;
        if ((this.bookpercartid == null && other.bookpercartid != null) || (this.bookpercartid != null && !this.bookpercartid.equals(other.bookpercartid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Bookpercart[ bookpercartid=" + bookpercartid + " ]";
    }
    
}
