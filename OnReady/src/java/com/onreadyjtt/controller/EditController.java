package com.onreadyjtt.controller;

import java.util.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.onready.models.Conecta;
import com.onready.models.Pelicula;
import com.onready.models.ValidaPelicula;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

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
        mav.addObject("pelicula",new Pelicula(id,datos.getTitulo(),datos.getEstreno(),datos.getPais(),datos.getSinopsis()));
        String sql = "select * from paises";
        List paises = this.jdbcTemplate.queryForList(sql);
        mav.addObject("paises", paises);
        String sql2 = "SELECT iso3 FROM paises INNER JOIN movies WHERE paises.iso3 = movies.pais AND movies.id = '" + id + "'";
        List paisActualIso3 = this.jdbcTemplate.queryForList(sql2);
        mav.addObject("paisActualIso3", paisActualIso3);
        sql2 = "SELECT nombre FROM paises INNER JOIN movies WHERE paises.iso3 = movies.pais AND movies.id = '" + id + "'";
        List paisActualNombre = this.jdbcTemplate.queryForList(sql2);
        mav.addObject("paisActualNombre", paisActualNombre);
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
            mav.addObject("pelicula",new Pelicula(id,datos.getTitulo(),datos.getEstreno(),datos.getPais(),datos.getSinopsis()));
            String sql = "select * from paises";
            List paises = this.jdbcTemplate.queryForList(sql);
            mav.addObject("paises", paises);
            String sql2 = "SELECT iso3, nombre FROM paises INNER JOIN movies WHERE paises.iso3 = movies.pais AND movies.id = '" + id + "'";
            List paisActual = this.jdbcTemplate.queryForList(sql2);
            mav.addObject("paisActual", paisActual);
            return mav;
        }else
        {
            int id=Integer.parseInt(request.getParameter("id"));
            this.jdbcTemplate.update
                (
                    "update movies "
                    + "set titulo=?,"
                    + " estreno=?,"
                    + "pais=?,"
                    + "sinopsis=? "
                    + "where "
                    + "id=? ",
                    peli.getTitulo(),peli.getEstreno(),peli.getPais(),peli.getSinopsis(),id
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
                        movie.setSinopsis(rs.getString("sinopsis"));
                    }
                    return movie;
                }
            }
        );
    }
}

