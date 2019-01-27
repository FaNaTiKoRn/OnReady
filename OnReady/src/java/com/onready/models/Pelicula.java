/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onready.models;

/**
 *
 * @author JoseTT
 */
public class Pelicula {
    private int id;
    private String titulo, estreno, pais;

    public Pelicula() {
    }

    public Pelicula(String titulo, String estreno) {
        this.titulo = titulo;
        this.estreno = estreno;
        this.pais = pais;
    }

    public Pelicula(int id, String titulo, String estreno, String pais) {
        this.id = id;
        this.titulo = titulo;
        this.estreno = estreno;
        this.pais = pais;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEstreno() {
        return estreno;
    }

    public void setEstreno(String estreno) {
        this.estreno = estreno;
    }
    
    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
}
