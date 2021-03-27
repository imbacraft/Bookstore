/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Dell
 */
@Embeddable
public class BookPerOrderPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "orderid")
    private int orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "bookid")
    private int bookid;

    public BookPerOrderPK() {
    }

    public BookPerOrderPK(int orderid, int bookid) {
        this.orderid = orderid;
        this.bookid = bookid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) orderid;
        hash += (int) bookid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BookPerOrderPK)) {
            return false;
        }
        BookPerOrderPK other = (BookPerOrderPK) object;
        if (this.orderid != other.orderid) {
            return false;
        }
        if (this.bookid != other.bookid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.BookPerOrderPK[ orderid=" + orderid + ", bookid=" + bookid + " ]";
    }
    
}
