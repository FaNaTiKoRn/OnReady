package com.onready.models;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;

public class ValidaPelicula implements Validator {
    @Override
    public boolean supports(Class<?> type) 
    {
        return Pelicula.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) { // todos los métodos de validación están aquí.
        
        Pelicula pelicula = (Pelicula) o; //Refundición del objeto para que pase a ser de tipo 'Pelicula'

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "titulo", "required.nombre", "El campo Título es obligatorio."); // Los campos no deben estar vacíos.
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "estreno", "required.estreno", "El campo Fecha de estreno es obligatorio.");
        if(pelicula.getPais().equals("0"))
        {
	    errors.rejectValue("pais", "required.pais","Seleccione un País de la lista.");
	}
    }
}
