/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
 * @author tmh
 */
@Entity
@Table(name = "items")
//@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Items.findAll", query = "SELECT i FROM Items i"),
//    @NamedQuery(name = "Items.findByItemID", query = "SELECT i FROM Items i WHERE i.itemID = :itemID"),
//    @NamedQuery(name = "Items.findByItemName", query = "SELECT i FROM Items i WHERE i.itemName = :itemName"),
//    @NamedQuery(name = "Items.findByItemPrice", query = "SELECT i FROM Items i WHERE i.itemPrice = :itemPrice"),
//    @NamedQuery(name = "Items.findByItemImageData", query = "SELECT i FROM Items i WHERE i.itemImageData = :itemImageData"),
//    @NamedQuery(name = "Items.findByItemImageName", query = "SELECT i FROM Items i WHERE i.itemImageName = :itemImageName")})
public class Items implements Serializable {

    @OneToMany(mappedBy = "itemID")
    private Collection<Feedback> feedbackCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 220)
    @Column(name = "itemID")
    private String itemID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "itemName")
    private String itemName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "itemPrice")
    private double itemPrice;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 220)
    @Column(name = "itemImageData")
    private String itemImageData;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "itemImageName")
    private String itemImageName;

    public Items() {
    }

    public Items(String itemID) {
        this.itemID = itemID;
    }

    public static Items lookUp(List<Items> listItems, String code) {
        for (Items item : listItems) {
            if (code.equals(item.getItemID())) {
                return item;
            }
        }
        return null;
    }

    public Items(String itemID, String itemName, double itemPrice, String itemImageData, String itemImageName) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.itemImageData = itemImageData;
        this.itemImageName = itemImageName;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public String getItemImageData() {
        return itemImageData;
    }

    public void setItemImageData(String itemImageData) {
        this.itemImageData = itemImageData;
    }

    public String getItemImageName() {
        return itemImageName;
    }

    public void setItemImageName(String itemImageName) {
        this.itemImageName = itemImageName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (itemID != null ? itemID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Items)) {
            return false;
        }
        Items other = (Items) object;
        if ((this.itemID == null && other.itemID != null) || (this.itemID != null && !this.itemID.equals(other.itemID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Items[ itemID=" + itemID + " ]";
    }

    @XmlTransient
    public Collection<Feedback> getFeedbackCollection() {
        return feedbackCollection;
    }

    public void setFeedbackCollection(Collection<Feedback> feedbackCollection) {
        this.feedbackCollection = feedbackCollection;
    }

}
