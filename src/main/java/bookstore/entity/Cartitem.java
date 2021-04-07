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
@Table(name = "cartitem")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cartitem.findAll", query = "SELECT c FROM Cartitem c")
    , @NamedQuery(name = "Cartitem.findByCartitemid", query = "SELECT c FROM Cartitem c WHERE c.cartitemid = :cartitemid")
    , @NamedQuery(name = "Cartitem.findByQuantity", query = "SELECT c FROM Cartitem c WHERE c.quantity = :quantity")})
public class Cartitem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cartitemid")
    private Integer cartitemid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    @JoinColumn(name = "bookdetailsid", referencedColumnName = "bookdetailsid")
    @ManyToOne(optional = false)
    private Bookdetails bookdetails;
    @JoinColumn(name = "cartid", referencedColumnName = "cartid")
    @ManyToOne(optional = false)
    private Cart cart;

    public Cartitem() {
    }

    public Cartitem(Integer cartitemid) {
        this.cartitemid = cartitemid;
    }

    public Cartitem(Integer cartitemid, int quantity) {
        this.cartitemid = cartitemid;
        this.quantity = quantity;
    }

    public Integer getCartitemid() {
        return cartitemid;
    }

    public void setCartitemid(Integer cartitemid) {
        this.cartitemid = cartitemid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Bookdetails getBookdetails() {
        return bookdetails;
    }

    public void setBookdetails(Bookdetails bookdetails) {
        this.bookdetails = bookdetails;
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
        hash += (cartitemid != null ? cartitemid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cartitem)) {
            return false;
        }
        Cartitem other = (Cartitem) object;
        if ((this.cartitemid == null && other.cartitemid != null) || (this.cartitemid != null && !this.cartitemid.equals(other.cartitemid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Cartitem{" + "cartitemid=" + cartitemid + ", quantity=" + quantity + ", bookdetails=" + bookdetails + ", cart=" + cart + '}';
    }


    
}
