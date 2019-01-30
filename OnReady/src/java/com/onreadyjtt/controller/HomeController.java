/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onreadyjtt.controller;

import com.onready.models.Conecta;
import com.onready.models.Pais;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    
    //@RequestMapping("home.htm")
    @RequestMapping(value="home.htm", method=RequestMethod.GET)
    public ModelAndView home( HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();
        String orden = request.getParameter("orden");
        String sort = request.getParameter("sort");
        String busca = request.getParameter("busca");
        String sql = "";
        if((busca != null) && (!busca.equals("")))
        {
            sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis FROM movies INNER JOIN paises where titulo LIKE \"%" + busca + "%\" AND movies.pais=paises.iso3";
            List datos = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", datos);
            mav.setViewName("home");
            return mav;
        }            
        if((orden != null) && (!orden.equals("")))
        { //Sólo si envío parámetros
            if(orden.equals("ASC"))
            {
                sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis FROM movies INNER JOIN paises where movies.pais=paises.iso3 ORDER BY " + orden + " ASC";
            }
            else
            {
                sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis FROM movies INNER JOIN paises where movies.pais=paises.iso3 ORDER BY " + orden;
            }
            List datos = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", datos);
            mav.setViewName("home");
            //return new ModelAndView("home","command", new Pais());
            return mav;
        }
        else
        {
            sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis FROM movies INNER JOIN paises where movies.pais=paises.iso3 ORDER BY id";
            List datos = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", datos);
            mav.setViewName("home");
            return mav;
        }
    }

    @RequestMapping(value="home.htm",method=RequestMethod.POST)
    public String home(Pais pais, ModelMap modelo) //mapeo de modelos para clases
    {
        modelo.addAttribute("iso3", pais.getIso3());
        modelo.addAttribute("iso2", pais.getIso2());
        modelo.addAttribute("nombre", pais.getNombre());
        modelo.addAttribute("capital", pais.getCapital());
        return "home";
    }

    @RequestMapping("paises.htm")
    public ModelAndView paises()
    {
        ModelAndView mav = new ModelAndView();
        String sql = "select * from paises";
        List datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("datos", datos);
        mav.setViewName("paises");
        return mav;
    }
}