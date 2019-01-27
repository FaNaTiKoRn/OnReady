
package com.onreadyjtt.controller;

import com.onready.models.Conecta;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


public class DeleteController {
    private JdbcTemplate jdbcTemplate;
    public DeleteController()
    {
        Conecta con=new Conecta();
        this.jdbcTemplate=new JdbcTemplate(con.conecta() );
    }
    
    @RequestMapping("delete.htm")
    public ModelAndView home(HttpServletRequest request) 
    {
        int id=Integer.parseInt(request.getParameter("id"));
        this.jdbcTemplate.update ("delete from movies " + "where " + "id=? ", id); // SQL SQUERY para Eliminar una Película.
        return new ModelAndView("redirect:/home.htm");
    }
}
