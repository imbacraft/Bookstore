/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
import java.util.List;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "visitor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Visitor.findAll", query = "SELECT v FROM Visitor v")
    , @NamedQuery(name = "Visitor.findByVisitorid", query = "SELECT v FROM Visitor v WHERE v.visitorid = :visitorid")
    , @NamedQuery(name = "Visitor.findByFirstname", query = "SELECT v FROM Visitor v WHERE v.firstname = :firstname")
    , @NamedQuery(name = "Visitor.findByLastname", query = "SELECT v FROM Visitor v WHERE v.lastname = :lastname")
    , @NamedQuery(name = "Visitor.findByEmail", query = "SELECT v FROM Visitor v WHERE v.email = :email")
    , @NamedQuery(name = "Visitor.findByCountry", query = "SELECT v FROM Visitor v WHERE v.country = :country")
    , @NamedQuery(name = "Visitor.findByStreet", query = "SELECT v FROM Visitor v WHERE v.street = :street")
    , @NamedQuery(name = "Visitor.findByStreetnumber", query = "SELECT v FROM Visitor v WHERE v.streetnumber = :streetnumber")
    , @NamedQuery(name = "Visitor.findByPostalcode", query = "SELECT v FROM Visitor v WHERE v.postalcode = :postalcode")
    , @NamedQuery(name = "Visitor.findByPhone", query = "SELECT v FROM Visitor v WHERE v.phone = :phone")})
public class Visitor implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "lastname")
    private String lastname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "city")
    private String city;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "street")
    private String street;
    @Basic(optional = false)
    @NotNull
    @Column(name = "streetnumber")
    private int streetnumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "postalcode")
    private int postalcode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "phone")
    private int phone;
    @OneToMany(mappedBy = "visitor")
    private List<Cart> cartList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "visitorid")
    private Integer visitorid;
    @JoinColumn(name = "country", referencedColumnName = "countryid")
    @ManyToOne(optional = false)
    private Country country;
    @JoinColumn(name = "roleid", referencedColumnName = "roleid")
    @ManyToOne(optional = false)
    private Role role;

    public Visitor() {
    }

    public Visitor(Integer visitorid) {
        this.visitorid = visitorid;
    }

    public Visitor(Integer visitorid, String firstname, String lastname, String email, Country country, String street, int streetnumber, int postalcode, int phone) {
        this.visitorid = visitorid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.country = country;
        this.street = street;
        this.streetnumber = streetnumber;
        this.postalcode = postalcode;
        this.phone = phone;
    }

    public Integer getVisitorid() {
        return visitorid;
    }

    public void setVisitorid(Integer visitorid) {
        this.visitorid = visitorid;
    }


    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }


    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (visitorid != null ? visitorid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Visitor)) {
            return false;
        }
        Visitor other = (Visitor) object;
        if ((this.visitorid == null && other.visitorid != null) || (this.visitorid != null && !this.visitorid.equals(other.visitorid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Visitor[ visitorid=" + visitorid + " ]";
    }
    @XmlTransient
    public List<Cart> getCartList() {
        return cartList;
    }
    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public int getStreetnumber() {
        return streetnumber;
    }

    public void setStreetnumber(int streetnumber) {
        this.streetnumber = streetnumber;
    }

    public int getPostalcode() {
        return postalcode;
    }

    public void setPostalcode(int postalcode) {
        this.postalcode = postalcode;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }
    
}
