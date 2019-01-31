package com.onready.models;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

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
