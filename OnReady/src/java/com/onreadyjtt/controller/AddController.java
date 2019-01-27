
package com.onreadyjtt.controller;

import com.onready.models.Conecta;
import com.onready.models.Pelicula;
import com.onready.models.ValidaPelicula;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("add.htm")
public class AddController {
    ValidaPelicula validaPelicula;
    private JdbcTemplate jdbcTemplate;
    
    public AddController() 
    {
        this.validaPelicula=new ValidaPelicula();
        Conecta con=new Conecta();
        this.jdbcTemplate=new JdbcTemplate(con.conecta() );
    }
    @RequestMapping(method=RequestMethod.GET) 
    public ModelAndView form()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("add");
        mav.addObject("pelicula",new Pelicula());
        return mav;
    }
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
        (
                @ModelAttribute("pelicula") Pelicula peli,
                BindingResult result,
                SessionStatus status
        )
    {
        this.validaPelicula.validate(peli, result);
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("add");
            mav.addObject("pelicula",new Pelicula());
            return mav;
        }else
        {
        this.jdbcTemplate.update
        (
        "insert into movies (titulo,estreno,pais) values (?,?,?)", // SQL QUERY para Insertar Registro o nueva Película.
         peli.getTitulo(),peli.getEstreno(),peli.getPais()
        );
         return new ModelAndView("redirect:/home.htm");
        }
       
    }
}