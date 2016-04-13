/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.dao;

import com.raj.entity.Country;
import com.raj.entity.Module;
import com.raj.entity.State;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rajkumar.s
 */
@Repository
public class CommonDao {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    public CommonDao(){}
    
    public CommonDao(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }
    
    public List<Module> loadMenu(){
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Module WHERE parent is null ORDER BY moduleOrder").list();
    }
    
    public List<Country> getCountries(){
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Country WHERE RecordStatus='Active' ORDER BY countryName").list();
    }
    
    public List<State> getStates(Long CID){
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("SELECT SID, stateName FROM State WHERE RecordStatus='Active' AND country="+CID+" ORDER BY stateName").list();
    }
    
    public Serializable insert(Object obj){
        Session session = sessionFactory.getCurrentSession();
        return session.save(obj);
    }
}
