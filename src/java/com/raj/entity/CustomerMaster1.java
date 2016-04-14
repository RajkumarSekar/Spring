/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author rajkumar.s
 */
@Entity
@Table(name = "customermaster_test")
public class CustomerMaster1 implements Serializable{
    
    private Long customerId;
    private String customerName;
    private Country country;


    public CustomerMaster1() {
        customerId = null;
    }
    
    public CustomerMaster1(String customerName){
        this.customerName = customerName;
    }

    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CID")
    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    @Column(name = "CustomerName")
    public String getCustomerName() {
        return customerName;
    }
    

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @ManyToOne
    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    
}
