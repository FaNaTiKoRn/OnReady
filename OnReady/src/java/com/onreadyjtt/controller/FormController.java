
package com.onreadyjtt.controller;

import com.onready.models.Pelicula;
import com.onready.models.ValidaPelicula;
import java.util.LinkedHashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("form.htm")
public class FormController 
{
    private ValidaPelicula validaPelicula;

    public FormController() 
    {
        this.validaPelicula = new ValidaPelicula();
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView form()
    {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("form");
        mav.addObject("pelicula",new Pelicula());
        return mav;
    }
    
    //recibimos y validamos los datos de nuestro formulario
    @RequestMapping(method=RequestMethod.POST)
    public ModelAndView form
                            (
                               @ModelAttribute("pelicula") Pelicula p,
                               BindingResult result,
                               SessionStatus status
                            )
    {
        this.validaPelicula.validate(p, result);
        if(result.hasErrors())
        {
            //acá volvemos al formulario
            //porque los datos ingresados por el usuario
            //no son correctos es decir que se ejecutó la validación
            ModelAndView mav=new ModelAndView();
            mav.setViewName("form");
            mav.addObject("pelicula",new Pelicula());
            return mav;
        }else
        {
            //acá entramos si el usuario ingresó bien los datos
            ModelAndView mav=new ModelAndView();
            mav.setViewName("exito");
            mav.addObject("titulo",p.getTitulo());
            mav.addObject("estreno",p.getEstreno());
            mav.addObject("pais",p.getPais());
            return mav;
        }
    }
    
    //método para poblar nuestro select
    @ModelAttribute("listaPaises")
    public Map<String,String> listadoPaises()
    {
        Map<String,String> pais=new LinkedHashMap<>();
        pais.put("1","Chile");
        pais.put("2","México");
        pais.put("3","Colombia");
        pais.put("4","Bolivia");
        pais.put("5","España");
        pais.put("6","Argentina");
        return pais;
    }
    
}
