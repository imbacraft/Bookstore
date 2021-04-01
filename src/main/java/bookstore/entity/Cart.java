/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;
import static org.springframework.format.annotation.DateTimeFormat.ISO.DATE_TIME;

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
    , @NamedQuery(name = "Cart.findByLocalDatetime", query = "SELECT c FROM Cart c WHERE c.datetime = :datetime")
    , @NamedQuery(name = "Cart.findByPayment", query = "SELECT c FROM Cart c WHERE c.payment = :payment")
    , @NamedQuery(name = "Cart.findByQuantity", query = "SELECT c FROM Cart c WHERE c.quantity = :quantity")
    , @NamedQuery(name = "Cart.findByPricebeforetax", query = "SELECT c FROM Cart c WHERE c.pricebeforetax = :pricebeforetax")
    , @NamedQuery(name = "Cart.findByShippingcost", query = "SELECT c FROM Cart c WHERE c.shippingcost = :shippingcost")
    , @NamedQuery(name = "Cart.findByTax", query = "SELECT c FROM Cart c WHERE c.tax = :tax")
    , @NamedQuery(name = "Cart.findByTotalprice", query = "SELECT c FROM Cart c WHERE c.totalprice = :totalprice")})
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cartid")
    private Integer cartid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datetime")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private LocalDateTime datetime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "payment")
    private String payment;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "pricebeforetax")
    private BigDecimal pricebeforetax;
    @Basic(optional = false)
    @NotNull
    @Column(name = "shippingcost")
    private BigDecimal shippingcost;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tax")
    private BigDecimal tax;
    @Basic(optional = false)
    @NotNull
    @Column(name = "totalprice")
    private BigDecimal totalprice;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cart")
    private List<Bookpercart> bookpercartList;
    @JoinColumn(name = "customerid", referencedColumnName = "customerid")
    @ManyToOne
    private Customer customer;
    @JoinColumn(name = "visitorid", referencedColumnName = "visitorid")
    @ManyToOne(cascade = CascadeType.DETACH)
    private Visitor visitor;

    public Cart() {
    }

    public Cart(Integer cartid) {
        this.cartid = cartid;
    }

    public Cart(Integer cartid, LocalDateTime datetime, String payment, int quantity, BigDecimal pricebeforetax, BigDecimal shippingcost, BigDecimal tax, BigDecimal totalprice) {
        this.cartid = cartid;
        this.datetime = datetime;
        this.payment = payment;
        this.quantity = quantity;
        this.pricebeforetax = pricebeforetax;
        this.shippingcost = shippingcost;
        this.tax = tax;
        this.totalprice = totalprice;
    }

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPricebeforetax() {
        return pricebeforetax;
    }

    public void setPricebeforetax(BigDecimal pricebeforetax) {
        this.pricebeforetax = pricebeforetax;
    }

    public BigDecimal getShippingcost() {
        return shippingcost;
    }

    public void setShippingcost(BigDecimal shippingcost) {
        this.shippingcost = shippingcost;
    }

    public BigDecimal getTax() {
        return tax;
    }

    public void setTax(BigDecimal tax) {
        this.tax = tax;
    }

    public BigDecimal getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(BigDecimal totalprice) {
        this.totalprice = totalprice;
    }

    @XmlTransient
    public List<Bookpercart> getBookpercartList() {
        return bookpercartList;
    }

    public void setBookpercartList(List<Bookpercart> bookpercartList) {
        this.bookpercartList = bookpercartList;
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
    
}
