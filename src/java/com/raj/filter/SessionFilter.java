/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.raj.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rajkumar.s
 */
public class SessionFilter implements Filter {

    private ArrayList<String> urlList;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String urls = filterConfig.getInitParameter("avoid-urls"); // gets avoid url form web.xml
        StringTokenizer tokenizer = new StringTokenizer(urls, ",");

        urlList = new ArrayList();
        while (tokenizer.hasMoreTokens()) {
            urlList.add(tokenizer.nextToken());
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String url = req.getServletPath();
        boolean allowedRequest = false;

        for (String urlL : urlList) {
            if (url.endsWith(urlL) || url.contains(urlL)) {
                allowedRequest = true;
            }
        }

        System.out.println(url + " ==> " + allowedRequest);

        if (!allowedRequest) {
            HttpSession session = req.getSession(false);
            if (null == session || null == session.getAttribute("username")) {
                res.sendRedirect("login.do");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
