/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onreadyjtt.controller;

import com.onready.models.Conecta;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author JoseTT
 */
public class HomeController {
    private JdbcTemplate jdbcTemplate;
    public HomeController ()
    {
        Conecta con = new Conecta();
        this.jdbcTemplate = new JdbcTemplate(con.conecta());
    }
    
    @RequestMapping("home.htm")
    public ModelAndView home()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from movies";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos", datos);
        mav.setViewName("home");
        return mav;
    }
}
