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
public class Pais {
    private String iso3, iso2, nombre, capital;

    public Pais() {
    }

    public Pais(String iso3, String iso2, String nombre, String capital) {
        this.iso3 = iso3;
        this.iso2 = iso2;
        this.nombre = nombre;
        this.capital = capital;
    }

    public String getIso3() {
        return iso3;
    }

    public void setIso3(String iso3) {
        this.iso3 = iso3;
    }

    public String getIso2() {
        return iso2;
    }

    public void setIso2(String iso2) {
        this.iso2 = iso2;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }
    
    
}
