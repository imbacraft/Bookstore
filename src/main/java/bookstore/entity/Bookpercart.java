/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
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
    , @NamedQuery(name = "Bookpercart.findByCartid", query = "SELECT b FROM Bookpercart b WHERE b.bookpercartPK.cartid = :cartid")
    , @NamedQuery(name = "Bookpercart.findByBookid", query = "SELECT b FROM Bookpercart b WHERE b.bookpercartPK.bookid = :bookid")
    , @NamedQuery(name = "Bookpercart.findByQuantity", query = "SELECT b FROM Bookpercart b WHERE b.quantity = :quantity")})
public class Bookpercart implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BookpercartPK bookpercartPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    @JoinColumn(name = "cartid", referencedColumnName = "cartid", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Cart cart;

    public Bookpercart() {
    }

    public Bookpercart(BookpercartPK bookpercartPK) {
        this.bookpercartPK = bookpercartPK;
    }

    public Bookpercart(BookpercartPK bookpercartPK, int quantity) {
        this.bookpercartPK = bookpercartPK;
        this.quantity = quantity;
    }

    public Bookpercart(int cartid, int bookid) {
        this.bookpercartPK = new BookpercartPK(cartid, bookid);
    }

    public BookpercartPK getBookpercartPK() {
        return bookpercartPK;
    }

    public void setBookpercartPK(BookpercartPK bookpercartPK) {
        this.bookpercartPK = bookpercartPK;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookpercartPK != null ? bookpercartPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bookpercart)) {
            return false;
        }
        Bookpercart other = (Bookpercart) object;
        if ((this.bookpercartPK == null && other.bookpercartPK != null) || (this.bookpercartPK != null && !this.bookpercartPK.equals(other.bookpercartPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Bookpercart[ bookpercartPK=" + bookpercartPK + " ]";
    }
    
}
