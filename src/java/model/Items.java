/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import dao.ItemDB;

/**
 *
 * @author LEQUANGHUY
 */
@Entity
@Table(name = "items")

public class Items implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "itemID")
    private String itemID;
    @Basic(optional = false)
    @Column(name = "itemName")
    private String itemName;
    @Basic(optional = false)
    @Column(name = "itemPrice")
    private double itemPrice;
    @Basic(optional = false)
    @Column(name = "itemImageData")
    private String itemImageData;
    @Basic(optional = false)
    @Column(name = "itemImageName")
    private String itemImageName;
    @Basic(optional = false)
    @Column(name = "quantity")
    private int itemQuantity;

    public Items() {
    }

    public Items(String itemID) {
        this.itemID = itemID;
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

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public void decQuantity(int num) {
        this.itemQuantity -= num;
        ItemDB.updateItem(this);
    }

    public void incQuantity(int num) {
        this.itemQuantity += num;
        ItemDB.updateItem(this);
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

}
