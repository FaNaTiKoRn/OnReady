package com.onreadyjtt.controller;

import java.util.List;
import com.onready.models.Conecta;
import com.onready.models.Pelicula;
import com.onready.models.ValidaPelicula;
import org.springframework.stereotype.Controller;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("add.htm")
public class AddController {
    ValidaPelicula validaPelicula;
    private JdbcTemplate jdbcTemplate;
    
    public AddController() {
        this.validaPelicula=new ValidaPelicula();
        Conecta con=new Conecta();
        this.jdbcTemplate=new JdbcTemplate(con.conecta());   //Conecta a la base de datos
    }
    
    @RequestMapping(method=RequestMethod.GET)   //Mapea los datos recibidos mediante GET
    public ModelAndView form() {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("add");
        mav.addObject("pelicula",new Pelicula());
        String sql = "select * from paises";
        List paises = this.jdbcTemplate.queryForList(sql);
        mav.addObject("paises", paises);
        return mav;
    }
    
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form    //Mapea los datos recibidos mediante POST
        (
                @ModelAttribute("pelicula") Pelicula peli,
                BindingResult result,
                SessionStatus status
        )
    {
        this.validaPelicula.validate(peli, result);   //Valida la película 
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            mav.setViewName("add");
            mav.addObject("pelicula",new Pelicula());
            String sql = "select * from paises";
            List paises = this.jdbcTemplate.queryForList(sql);
            mav.addObject("paises", paises);
            return mav;
        }else
        {
            this.jdbcTemplate.update
                                    (   // Query para Actualizar la Película modificada.
                                        "insert into movies (titulo,estreno,pais,sinopsis) values (?,?,?,?)",
                                        peli.getTitulo(),peli.getEstreno(),peli.getPais(),peli.getSinopsis()
                                    );
            return new ModelAndView("redirect:/home.htm");
        }
    }
}
