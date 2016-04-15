/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.controller;

import com.raj.entity.Country;
import com.raj.entity.CustomerMaster;
import com.raj.entity.CustomerMaster1;
import com.raj.entity.Module;
import com.raj.entity.State;
import com.raj.entity.User;
import com.raj.service.CommonService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author rajkumar.s
 */
@Controller
public class HomeController {

    public HashMap<Long, Module> moduleMap;
    public List<Module> moduleList;

    @RequestMapping(value = {"/", "/home.do"})
    public String index() {
        return "index";
    }

    @Autowired
    private CommonService commonService;

    @RequestMapping("/load_menu.do")
    public ModelAndView load_menu() {
        Map<String, Object> map = new HashMap<>();
        moduleList = commonService.loadMenu();
        map.put("moduleList", moduleList);
        return new ModelAndView("/common/menu", map);
    }

    @RequestMapping("/menu_json.do")
    public ResponseEntity<List<Module>> menu_json() {

        moduleList = commonService.loadMenu();
        return new ResponseEntity<>(moduleList, HttpStatus.OK);
    }

    @RequestMapping("/dashboard.do")
    public String dashboard() {
        return "dashboard";
    }

    @RequestMapping("/chat.do")
    public String chat() {
        return "/common/chat";
    }

    @RequestMapping("/blank.do")
    public String blank() {
        return "blank";
    }

    @RequestMapping("/newcustomer.do")
    public ModelAndView newCustomer() {
        List<Country> countryList = commonService.getCountries();
        Map<String, Object> model = new HashMap<>();
        model.put("countryList", countryList);
        return new ModelAndView("Customer_Master", model);
    }

    @RequestMapping("/newuser.do")
    public ModelAndView newuser() {
        return new ModelAndView("UserManagement");
    }
    
    @RequestMapping("/newcustomer1.do")
    public ModelAndView newCustomer1() {
        return new ModelAndView("Customer_Master_1");
    }

    @RequestMapping(value="/soreCustomer.do", method = RequestMethod.POST)
    public ResponseEntity<CustomerMaster> soreCustomer(@RequestBody CustomerMaster customer){
        
        Long id = (Long) commonService.insert(customer);
        return new ResponseEntity<>(customer, HttpStatus.OK);
        //return "test";
    }
    
    @RequestMapping(value="/soreCustomer1.do", method = RequestMethod.POST)
    public ResponseEntity<CustomerMaster1> soreCustomer1(@RequestBody CustomerMaster1 customer){        
        Long id = (Long) commonService.insert(customer);
        return new ResponseEntity<>(customer, HttpStatus.OK);
    }

    @RequestMapping(value = "/getStates.do", headers = "Accept=application/json")
    public ResponseEntity<List<State>> getStatesOption(@RequestParam("cid") Long CID) {
        List<State> stateList;
        stateList = commonService.getStates(CID);
        return new ResponseEntity<>(stateList, HttpStatus.OK);
    }

    @RequestMapping("/access_denied.do")
    public String access_denied() {
        return "access_denied";
    }

    @RequestMapping("/login.do")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/logout.do")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login.do?logout";
    }

}
