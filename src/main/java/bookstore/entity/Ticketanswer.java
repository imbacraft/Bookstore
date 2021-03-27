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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "ticketanswer")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ticketanswer.findAll", query = "SELECT t FROM Ticketanswer t")
    , @NamedQuery(name = "Ticketanswer.findById", query = "SELECT t FROM Ticketanswer t WHERE t.id = :id")
    , @NamedQuery(name = "Ticketanswer.findByAnswerbody", query = "SELECT t FROM Ticketanswer t WHERE t.answerbody = :answerbody")})
public class Ticketanswer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2500)
    @Column(name = "answerbody")
    private String answerbody;
    @JoinColumn(name = "customeragentid", referencedColumnName = "custserviceid")
    @ManyToOne(optional = false)
    private Customerserviceagent customeragentid;
    @JoinColumn(name = "ticketid", referencedColumnName = "ticketid")
    @ManyToOne(optional = false)
    private Ticket ticket;

    public Ticketanswer() {
    }

    public Ticketanswer(Integer id) {
        this.id = id;
    }

    public Ticketanswer(Integer id, String answerbody) {
        this.id = id;
        this.answerbody = answerbody;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswerbody() {
        return answerbody;
    }

    public void setAnswerbody(String answerbody) {
        this.answerbody = answerbody;
    }

    public Customerserviceagent getCustomeragentid() {
        return customeragentid;
    }

    public void setCustomeragentid(Customerserviceagent customeragentid) {
        this.customeragentid = customeragentid;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ticketanswer)) {
            return false;
        }
        Ticketanswer other = (Ticketanswer) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Ticketanswer[ id=" + id + " ]";
    }
    
}
