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
@Table(name = "orderid")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Order.findAll", query = "SELECT o FROM Order o")
    , @NamedQuery(name = "Order.findByOrderid", query = "SELECT o FROM Order o WHERE o.orderid = :orderid")
    , @NamedQuery(name = "Order.findByLocalDatetime", query = "SELECT o FROM Order o WHERE o.datetime = :datetime")
    , @NamedQuery(name = "Order.findByPayment", query = "SELECT o FROM Order o WHERE o.payment = :payment")
    , @NamedQuery(name = "Order.findByQuantity", query = "SELECT o FROM Order o WHERE o.quantity = :quantity")
    , @NamedQuery(name = "Order.findByPricebeforetax", query = "SELECT o FROM Order o WHERE o.pricebeforetax = :pricebeforetax")
    , @NamedQuery(name = "Order.findByShippingcost", query = "SELECT o FROM Order o WHERE o.shippingcost = :shippingcost")
    , @NamedQuery(name = "Order.findByTax", query = "SELECT o FROM Order o WHERE o.tax = :tax")
    , @NamedQuery(name = "Order.findByTotalprice", query = "SELECT o FROM Order o WHERE o.totalprice = :totalprice")})
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "orderid")
    private Integer orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datetime")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate datetime;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order")
    private List<Ticket> ticketList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order")
    private List<BookPerOrder> bookPerOrderList;
    @JoinColumn(name = "customerid", referencedColumnName = "customerid")
    @ManyToOne
    private Customer customer;
    @JoinColumn(name = "visitorid", referencedColumnName = "visitorid")
    @ManyToOne
    private Visitor visitor;

    public Order() {
    }

    public Order(Integer orderid) {
        this.orderid = orderid;
    }

    public Order(Integer orderid, LocalDate datetime, String payment, int quantity, BigDecimal pricebeforetax, BigDecimal shippingcost, BigDecimal tax, BigDecimal totalprice) {
        this.orderid = orderid;
        this.datetime = datetime;
        this.payment = payment;
        this.quantity = quantity;
        this.pricebeforetax = pricebeforetax;
        this.shippingcost = shippingcost;
        this.tax = tax;
        this.totalprice = totalprice;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public LocalDate getLocalDatetime() {
        return datetime;
    }

    public void setLocalDatetime(LocalDate datetime) {
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
    public List<Ticket> getTicketList() {
        return ticketList;
    }

    public void setTicketList(List<Ticket> ticketList) {
        this.ticketList = ticketList;
    }

    @XmlTransient
    public List<BookPerOrder> getBookPerOrderList() {
        return bookPerOrderList;
    }

    public void setBookPerOrderList(List<BookPerOrder> bookPerOrderList) {
        this.bookPerOrderList = bookPerOrderList;
    }

    public Customer getCustomerid() {
        return customer;
    }

    public void setCustomerid(Customer customer) {
        this.customer = customer;
    }

    public Visitor getVisitorid() {
        return visitor;
    }

    public void setVisitorid(Visitor visitor) {
        this.visitor = visitor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Order)) {
            return false;
        }
        Order other = (Order) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Order[ orderid=" + orderid + " ]";
    }
    
}
