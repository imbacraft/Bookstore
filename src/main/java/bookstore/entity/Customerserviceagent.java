/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore.entity;

import java.io.Serializable;
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

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "customerserviceagent")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Customerserviceagent.findAll", query = "SELECT c FROM Customerserviceagent c")
    , @NamedQuery(name = "Customerserviceagent.findByCustserviceid", query = "SELECT c FROM Customerserviceagent c WHERE c.custserviceid = :custserviceid")
    , @NamedQuery(name = "Customerserviceagent.findByUsername", query = "SELECT c FROM Customerserviceagent c WHERE c.username = :username")
    , @NamedQuery(name = "Customerserviceagent.findByPassword", query = "SELECT c FROM Customerserviceagent c WHERE c.password = :password")})
public class Customerserviceagent implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "custserviceid")
    private Integer custserviceid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "password")
    private String password;
    @JoinColumn(name = "roleid", referencedColumnName = "roleid")
    @ManyToOne(optional = false)
    private Role role;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customeragentid")
    private List<Ticketanswer> ticketanswerList;

    public Customerserviceagent() {
    }

    public Customerserviceagent(Integer custserviceid) {
        this.custserviceid = custserviceid;
    }

    public Customerserviceagent(Integer custserviceid, String username, String password) {
        this.custserviceid = custserviceid;
        this.username = username;
        this.password = password;
    }

    public Integer getCustserviceid() {
        return custserviceid;
    }

    public void setCustserviceid(Integer custserviceid) {
        this.custserviceid = custserviceid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRoleid(Role role) {
        this.role = role;
    }

    @XmlTransient
    public List<Ticketanswer> getTicketanswerList() {
        return ticketanswerList;
    }

    public void setTicketanswerList(List<Ticketanswer> ticketanswerList) {
        this.ticketanswerList = ticketanswerList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (custserviceid != null ? custserviceid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Customerserviceagent)) {
            return false;
        }
        Customerserviceagent other = (Customerserviceagent) object;
        if ((this.custserviceid == null && other.custserviceid != null) || (this.custserviceid != null && !this.custserviceid.equals(other.custserviceid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Customerserviceagent[ custserviceid=" + custserviceid + " ]";
    }
    
}
