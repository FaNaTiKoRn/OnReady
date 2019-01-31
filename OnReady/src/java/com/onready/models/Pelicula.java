package com.onready.models;

public class Pelicula {
    private int id;
    private String titulo, estreno, pais, sinopsis;

    public Pelicula() {
    }

    public Pelicula(int id, String titulo, String estreno, String pais, String sinopsis) {
        this.id = id;
        this.titulo = titulo;
        this.estreno = estreno;
        this.pais = pais;
        this.sinopsis = sinopsis;
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

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }
}
