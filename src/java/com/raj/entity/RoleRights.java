/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author rajkumar.s
 */

@Entity
@Table(name = "role_rights", catalog = "spring")
public class RoleRights implements Serializable {
    
    private Long roleRightsId;
    private Module module;
    private Role role;
    private String create;
    private String edit;
    private String delete;
    private String view;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RRID", nullable = false, unique = true)
    public Long getRoleRightsId() {
        return roleRightsId;
    }

    public void setRoleRightsId(Long roleRightsId) {
        this.roleRightsId = roleRightsId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rr_modulecode")
    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "rr_rolecode")
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Column(name = "rr_create")
    public String getCreate() {
        return create;
    }

    public void setCreate(String create) {
        this.create = create;
    }
    
    @Column(name = "rr_edit")
    public String getEdit() {
        return edit;
    }

    public void setEdit(String edit) {
        this.edit = edit;
    }

    @Column(name = "rr_delete")
    public String getDelete() {
        return delete;
    }

    public void setDelete(String delete) {
        this.delete = delete;
    }

    @Column(name = "rr_view")
    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }
    
    
}
