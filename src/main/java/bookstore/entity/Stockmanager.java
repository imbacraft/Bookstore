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
@Table(name = "stockmanager")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Stockmanager.findAll", query = "SELECT s FROM Stockmanager s")
    , @NamedQuery(name = "Stockmanager.findByStockid", query = "SELECT s FROM Stockmanager s WHERE s.stockid = :stockid")
    , @NamedQuery(name = "Stockmanager.findByUsername", query = "SELECT s FROM Stockmanager s WHERE s.username = :username")
    , @NamedQuery(name = "Stockmanager.findByPassword", query = "SELECT s FROM Stockmanager s WHERE s.password = :password")})
public class Stockmanager implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "stockid")
    private Integer stockid;
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

    public Stockmanager() {
    }

    public Stockmanager(Integer stockid) {
        this.stockid = stockid;
    }

    public Stockmanager(Integer stockid, String username, String password) {
        this.stockid = stockid;
        this.username = username;
        this.password = password;
    }

    public Integer getStockid() {
        return stockid;
    }

    public void setStockid(Integer stockid) {
        this.stockid = stockid;
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

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (stockid != null ? stockid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Stockmanager)) {
            return false;
        }
        Stockmanager other = (Stockmanager) object;
        if ((this.stockid == null && other.stockid != null) || (this.stockid != null && !this.stockid.equals(other.stockid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bookstore.entity.Stockmanager[ stockid=" + stockid + " ]";
    }
    
}
