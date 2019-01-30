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


/*
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

IMPORTACIONES que no se implementaron porque no se logró la paginación del contenido...
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
            sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis, paises.iso3 AS iso3 FROM movies INNER JOIN paises where titulo LIKE \"%" + busca + "%\" AND movies.pais=paises.iso3";
            List datos = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", datos);
            sql = "SELECT COUNT(id) AS registros FROM movies INNER JOIN paises where titulo LIKE \"%" + busca + "%\" AND movies.pais=paises.iso3";
            List registros = this.jdbcTemplate.queryForList(sql);
            mav.addObject("registros", registros);
            mav.setViewName("home");
            return mav;
        }            
        if((orden != null) && (!orden.equals("")))
        { //Sólo si envío parámetros
            if(orden.equals("ASC"))
            {
                sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis, paises.iso3 AS iso3 FROM movies INNER JOIN paises where movies.pais=paises.iso3 ORDER BY " + orden + " ASC";
            }
            else
            {
                sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis, paises.iso3 AS iso3 FROM movies INNER JOIN paises where movies.pais=paises.iso3 ORDER BY " + orden;
            }
            List datos = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", datos);
            sql = "SELECT COUNT(id) FROM movies INNER JOIN paises where movies.pais=paises.iso3";
            List registros = this.jdbcTemplate.queryForList(sql);
            mav.addObject("registros", registros);
            mav.setViewName("home");
            return mav;
        }
        else
        {
            sql = "SELECT id, titulo, estreno, paises.nombre, sinopsis, paises.iso3 AS iso3 FROM movies INNER JOIN paises where movies.pais=paises.iso3 ORDER BY titulo";
            List datos = this.jdbcTemplate.queryForList(sql);
            mav.addObject("datos", datos);
            sql = "SELECT COUNT(id) FROM movies INNER JOIN paises where movies.pais=paises.iso3";
            List registros = this.jdbcTemplate.queryForList(sql);
            mav.addObject("registros", registros);
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
    
    
    // Prueba de paginación que NO funcionó...
    /*
    @Component
    class PaginatedResultsRetrievedEventDiscoverabilityListener implements ApplicationListener<PaginatedResultsRetrievedEvent> {

    @Override
    public void onApplicationEvent(final PaginatedResultsRetrievedEvent ev) {
        Preconditions.checkNotNull(ev);
        addLinkHeaderOnPagedResourceRetrieval(ev.getUriBuilder(), ev.getResponse(), ev.getClazz(), ev.getPage(), ev.getTotalPages(), ev.getPageSize());
    }

    void addLinkHeaderOnPagedResourceRetrieval(final UriComponentsBuilder uriBuilder, final HttpServletResponse response, final Class clazz, final int page, final int totalPages, final int pageSize) {
        final String resourceName = clazz.getSimpleName().toString().toLowerCase();
        uriBuilder.path("/admin/" + resourceName);

        final StringBuilder linkHeader = new StringBuilder();
        if (hasNextPage(page, totalPages)) {
            final String uriForNextPage = constructNextPageUri(uriBuilder, page, pageSize);
            linkHeader.append(createLinkHeader(uriForNextPage, "next"));
        }
        if (hasPreviousPage(page)) {
            final String uriForPrevPage = constructPrevPageUri(uriBuilder, page, pageSize);
            appendCommaIfNecessary(linkHeader);
            linkHeader.append(createLinkHeader(uriForPrevPage, "prev"));
        }
        if (hasFirstPage(page)) {
            final String uriForFirstPage = constructFirstPageUri(uriBuilder, pageSize);
            appendCommaIfNecessary(linkHeader);
            linkHeader.append(createLinkHeader(uriForFirstPage, "first"));
        }
        if (hasLastPage(page, totalPages)) {
            final String uriForLastPage = constructLastPageUri(uriBuilder, totalPages, pageSize);
            appendCommaIfNecessary(linkHeader);
            linkHeader.append(createLinkHeader(uriForLastPage, "last"));
        }
        response.addHeader("Link", linkHeader.toString());
    }

    String constructNextPageUri(final UriComponentsBuilder uriBuilder, final int page, final int size) {
        return uriBuilder.replaceQueryParam("page", page + 1).replaceQueryParam("size", size).build().encode().toUriString();
    }

    String constructPrevPageUri(final UriComponentsBuilder uriBuilder, final int page, final int size) {
        return uriBuilder.replaceQueryParam("page", page - 1).replaceQueryParam("size", size).build().encode().toUriString();
    }

    String constructFirstPageUri(final UriComponentsBuilder uriBuilder, final int size) {
        return uriBuilder.replaceQueryParam("page", 0).replaceQueryParam("size", size).build().encode().toUriString();
    }

    String constructLastPageUri(final UriComponentsBuilder uriBuilder, final int totalPages, final int size) {
        return uriBuilder.replaceQueryParam("page", totalPages).replaceQueryParam("size", size).build().encode().toUriString();
    }

    boolean hasNextPage(final int page, final int totalPages) {
        return page < totalPages - 1;
    }

    boolean hasPreviousPage(final int page) {
        return page > 0;
    }

    boolean hasFirstPage(final int page) {
        return hasPreviousPage(page);
    }

    boolean hasLastPage(final int page, final int totalPages) {
        return totalPages > 1 && hasNextPage(page, totalPages);
    }

    void appendCommaIfNecessary(final StringBuilder linkHeader) {
        if (linkHeader.length() > 0) {
            linkHeader.append(", ");
        }
    }

    public static String createLinkHeader(final String uri, final String rel) {
        return "<" + uri + ">; rel=\"" + rel + "\"";
    }
*/
}