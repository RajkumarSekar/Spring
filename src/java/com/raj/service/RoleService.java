/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.service;

import com.raj.dao.RoleDao;
import com.raj.entity.Role;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author rajkumar.s
 */
@Service
public class RoleService{
    @Autowired
    RoleDao roleDao;

    @Transactional
    public List<Role> listRole() {
        return roleDao.listRole();
    }

    @Transactional
    public void addRole(Role role) {
        roleDao.addRole(role);
    }
    
    @Transactional
    public Role getRole(String id) {
        return roleDao.getRole(id);
    }

}
