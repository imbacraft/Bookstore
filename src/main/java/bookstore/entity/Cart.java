/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
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
@Table(name = "cart")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cart.findAll", query = "SELECT c FROM Cart c")
    , @NamedQuery(name = "Cart.findByCartid", query = "SELECT c FROM Cart c WHERE c.cartid = :cartid")
    , @NamedQuery(name = "Cart.findByLocalDateTimetime", query = "SELECT c FROM Cart c WHERE c.datetime = :datetime")
    , @NamedQuery(name = "Cart.findByPayment", query = "SELECT c FROM Cart c WHERE c.payment = :payment")
    , @NamedQuery(name = "Cart.findByShippingcost", query = "SELECT c FROM Cart c WHERE c.shippingcost = :shippingcost")
    , @NamedQuery(name = "Cart.findByTotalprice", query = "SELECT c FROM Cart c WHERE c.totalprice = :totalprice")})
public class Cart implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "datetime")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime datetime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 160)
    @Column(name = "payment")
    private String payment;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "bookprice")
    private double bookprice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "shippingcost")
    private double shippingcost;
    @Basic(optional = false)
    @NotNull
    @Column(name = "totalprice")
    private double totalprice;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cartid")
    private Integer cartid;
    @JoinColumn(name = "customerid", referencedColumnName = "customerid")
    @ManyToOne
    private Customer customer;
    @JoinColumn(name = "visitorid", referencedColumnName = "visitorid")
    @ManyToOne
    private Visitor visitor;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cart")
    private List<Cartitem> cartitemList;

    public Cart() {
    }

    public Cart(Integer cartid) {
        this.cartid = cartid;
    }

    public Cart(Integer cartid, LocalDateTime datetime, String payment, double shippingcost, double totalprice) {
        this.cartid = cartid;
        this.datetime = datetime;
        this.payment = payment;
        this.shippingcost = shippingcost;
        this.totalprice = totalprice;
    }

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }


    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Visitor getVisitor() {
        return visitor;
    }

    public void setVisitor(Visitor visitor) {
        this.visitor = visitor;
    }

    @XmlTransient
    public List<Cartitem> getCartitemList() {
        return cartitemList;
    }

    public void setCartitemList(List<Cartitem> cartitemList) {
        this.cartitemList = cartitemList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartid != null ? cartid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cart)) {
            return false;
        }
        Cart other = (Cart) object;
        if ((this.cartid == null && other.cartid != null) || (this.cartid != null && !this.cartid.equals(other.cartid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Cart[ cartid=" + cartid + " ]";
    }

    public LocalDateTime getDatetime() {
        return datetime;
    }

    public void setDatetime(LocalDateTime datetime) {
        this.datetime = datetime;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public double getBookprice() {
        return bookprice;
    }

    public void setBookprice(double bookprice) {
        this.bookprice = bookprice;
    }

    public double getShippingcost() {
        return shippingcost;
    }

    public void setShippingcost(double shippingcost) {
        this.shippingcost = shippingcost;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
    
}
