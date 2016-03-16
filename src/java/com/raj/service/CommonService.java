/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.service;

import com.raj.dao.CommonDao;
import com.raj.entity.Country;
import com.raj.entity.Module;
import com.raj.entity.State;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author rajkumar.s
 */
@Service
public class CommonService {
    
    public List<Module> moduleList;
    
    @Autowired
    private CommonDao commonDao;
    
    @Transactional
    public List<Module> loadMenu(){
        moduleList = commonDao.loadMenu();
        return moduleList;
    }
    
    @Transactional
    public List<Country> getCountries(){
        return commonDao.getCountries();
    }
    
    @Transactional
    public List<State> getStates(Long CID){
        return commonDao.getStates(CID);
    }
    
    @Transactional
    public Serializable insert(Object obj){
        return commonDao.insert(obj);
    }
    
}
