
package com.onreadyjtt.controller;

import com.onready.models.Conecta;
import com.onready.models.Pelicula;
import com.onready.models.ValidaPelicula;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("edit.htm")
public class EditController 
{
    ValidaPelicula validaPelicula;
    private JdbcTemplate jdbcTemplate;
     
    
    public EditController() 
    {
        this.validaPelicula=new ValidaPelicula();
        Conecta con = new Conecta();
        this.jdbcTemplate=new JdbcTemplate(con.conecta() );
    }
    @RequestMapping(method=RequestMethod.GET) 
    public ModelAndView form(HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        int id=Integer.parseInt(request.getParameter("id"));
        Pelicula datos = this.selectPelicula(id);
        mav.setViewName("edit");
        mav.addObject("pelicula",new Pelicula(id,datos.getTitulo(),datos.getEstreno(),datos.getPais()));
        return mav;
    }
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
        (
                @ModelAttribute("pelicula") Pelicula peli,
                BindingResult result,
                SessionStatus status,
                HttpServletRequest request
        )
    {
        this.validaPelicula.validate(peli, result);
        if(result.hasErrors())
        {
            ModelAndView mav=new ModelAndView();
            int id=Integer.parseInt(request.getParameter("id"));
            Pelicula datos=this.selectPelicula(id);
            mav.setViewName("edit");
            mav.addObject("pelicula",new Pelicula(id,datos.getTitulo(),datos.getEstreno(),datos.getPais()));
            return mav;
        }else
        {
            int id=Integer.parseInt(request.getParameter("id"));
            this.jdbcTemplate.update
                (
                    "update movies "
                    + "set titulo=?,"
                    + " estreno=?,"
                    + "pais=? "
                    + "where "
                    + "id=? ",
                    peli.getTitulo(),peli.getEstreno(),peli.getPais(),id
                );
            return new ModelAndView("redirect:/home.htm");
        }
    }
    public Pelicula selectPelicula(int id) 
    {
        final Pelicula movie = new Pelicula();
        String quer = "SELECT * FROM movies WHERE id='" + id+"'";
        return (Pelicula) jdbcTemplate.query
        (
                quer, new ResultSetExtractor<Pelicula>() 
            {
                public Pelicula extractData(ResultSet rs) throws SQLException, DataAccessException {
                    if (rs.next()) {
                        movie.setTitulo(rs.getString("titulo"));
                        movie.setEstreno(rs.getString("estreno"));
                        movie.setPais(rs.getString("pais"));
                    }
                    return movie;
                }


            }
        );
    }
}

