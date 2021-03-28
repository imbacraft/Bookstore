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
public class BookpercartPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "cartid")
    private int cartid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "bookid")
    private int bookid;

    public BookpercartPK() {
    }

    public BookpercartPK(int cartid, int bookid) {
        this.cartid = cartid;
        this.bookid = bookid;
    }

    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
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
        hash += (int) cartid;
        hash += (int) bookid;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BookpercartPK)) {
            return false;
        }
        BookpercartPK other = (BookpercartPK) object;
        if (this.cartid != other.cartid) {
            return false;
        }
        if (this.bookid != other.bookid) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.BookpercartPK[ cartid=" + cartid + ", bookid=" + bookid + " ]";
    }
    
}
