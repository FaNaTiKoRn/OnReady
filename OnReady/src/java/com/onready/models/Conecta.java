/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onready.models;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author JoseTT
 */
public class Conecta {
    public DriverManagerDataSource conecta()
    {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost/onready");
        dataSource.setUsername("root");
        dataSource.setPassword("");
        return dataSource;
    }
}
