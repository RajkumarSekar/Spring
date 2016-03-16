/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.dao;

import com.raj.entity.SystemUsers;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author rajkumar.s
 */
@Component
public class SystemUsersDao {

    @Autowired
    private SessionFactory sessionFactory;
    
    public SystemUsersDao(){}
    
    public SystemUsersDao(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }
    
    public void addUser(SystemUsers user) {
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
    }

    public SystemUsers getUser(Long id) {
        Session session = sessionFactory.getCurrentSession();
        return (SystemUsers) session.get(SystemUsers.class, id);
    }
    
    public SystemUsers getUserByName(String username) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(SystemUsers.class);
        criteria.add(Restrictions.eq("username", username));
        return (SystemUsers) criteria.uniqueResult();
    }

    
}
