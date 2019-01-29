/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onready.models;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author JoseTT
 */
public class ConectaTest {
    
    public ConectaTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of conecta method, of class Conecta.
     */
    @Test
    public void testConecta() {
        System.out.println("conecta");
        Conecta instance = new Conecta();
        DriverManagerDataSource expResult = null;
        DriverManagerDataSource result = instance.conecta();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
