package com.onreadyjtt.controller;

import com.onready.models.Conecta;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;

public class DeleteController {
    private JdbcTemplate jdbcTemplate;
    public DeleteController()
    {
        Conecta con=new Conecta();   //Conecta a la DB
        this.jdbcTemplate=new JdbcTemplate(con.conecta());   //Conecta a la base de datos
    }
    
    @RequestMapping("delete.htm")
    public ModelAndView home(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update ("delete from movies " + "where " + "id=? ", id);   // Query para Actualizar la Película modificada.
        return new ModelAndView("redirect:/home.htm");
    }
}
