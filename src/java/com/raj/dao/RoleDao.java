/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.dao;

import com.raj.entity.Role;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rajkumar.s
 */
@Repository
public class RoleDao{

    @Autowired
    private SessionFactory sessionFactory;
    
    public RoleDao() {
    }

    public RoleDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public List<Role> listRole() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM Role").list();
    }

    public void addRole(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.save(role);
    }

    public void updateRole(Role role) {
        
    }

    public Role getRole(String id) {
        Session session = sessionFactory.getCurrentSession();
        return (Role)session.get(Role.class, id);
    }

    public void deleteRole(Long id) {
        
    }
    
}
