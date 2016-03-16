/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author rajkumar.s
 */
@Entity
@Table(name = "role")
public class Role implements Serializable{
    
    private Long roleCode;
    private String roleName;
    private Set<UserRoles> usersRole = new HashSet<>(0);
    private Set<RoleRights> roleRights = new HashSet<>(0);

    @Id
    @Column(name = "role_rolecode")
    public Long getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(Long roleCode) {
        this.roleCode = roleCode;
    }
    
    @Column(name = "role_rolename")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @OneToMany(mappedBy = "role")
    public Set<UserRoles> getUsersRole() {
        return usersRole;
    }

    public void setUsersRole(Set<UserRoles> usersRole) {
        this.usersRole = usersRole;
    }

    @OneToMany(mappedBy = "role")
    public Set<RoleRights> getRoleRights() {
        return roleRights;
    }

    public void setRoleRights(Set<RoleRights> roleRights) {
        this.roleRights = roleRights;
    }
    
    
    
    
}
