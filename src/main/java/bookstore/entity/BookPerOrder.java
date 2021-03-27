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
@Table(name = "bookPerOrder")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BookPerOrder.findAll", query = "SELECT b FROM BookPerOrder b")
    , @NamedQuery(name = "BookPerOrder.findByOrderid", query = "SELECT b FROM BookPerOrder b WHERE b.bookPerOrderPK.orderid = :orderid")
    , @NamedQuery(name = "BookPerOrder.findByBookid", query = "SELECT b FROM BookPerOrder b WHERE b.bookPerOrderPK.bookid = :bookid")
    , @NamedQuery(name = "BookPerOrder.findByQuantity", query = "SELECT b FROM BookPerOrder b WHERE b.quantity = :quantity")})
public class BookPerOrder implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BookPerOrderPK bookPerOrderPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    @JoinColumn(name = "orderid", referencedColumnName = "orderid", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Order order;

    public BookPerOrder() {
    }

    public BookPerOrder(BookPerOrderPK bookPerOrderPK) {
        this.bookPerOrderPK = bookPerOrderPK;
    }

    public BookPerOrder(BookPerOrderPK bookPerOrderPK, int quantity) {
        this.bookPerOrderPK = bookPerOrderPK;
        this.quantity = quantity;
    }

    public BookPerOrder(int orderid, int bookid) {
        this.bookPerOrderPK = new BookPerOrderPK(orderid, bookid);
    }

    public BookPerOrderPK getBookPerOrderPK() {
        return bookPerOrderPK;
    }

    public void setBookPerOrderPK(BookPerOrderPK bookPerOrderPK) {
        this.bookPerOrderPK = bookPerOrderPK;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order getOrder1() {
        return order;
    }

    public void setOrder1(Order order) {
        this.order = order;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookPerOrderPK != null ? bookPerOrderPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BookPerOrder)) {
            return false;
        }
        BookPerOrder other = (BookPerOrder) object;
        if ((this.bookPerOrderPK == null && other.bookPerOrderPK != null) || (this.bookPerOrderPK != null && !this.bookPerOrderPK.equals(other.bookPerOrderPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.BookPerOrder[ bookPerOrderPK=" + bookPerOrderPK + " ]";
    }
    
}
