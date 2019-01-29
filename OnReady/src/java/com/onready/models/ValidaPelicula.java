
package com.onready.models;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class ValidaPelicula implements Validator {

    /*
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
   + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
   */
    
     private Pattern pattern;
     private Matcher matcher;
    
    @Override
    public boolean supports(Class<?> type) 
    {
        return Pelicula.class.isAssignableFrom(type);
       // Es estándar, sólo cambio el nombre de la clase.
    }

    @Override
    public void validate(Object o, Errors errors) { // todos los métodos de validación están aquí.
        
        Pelicula pelicula = (Pelicula) o; //Refundición del objeto para que pase a ser de tipo 'Pelicula'

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "titulo", "required.nombre", "Todos los campos son obligatorios."); // Los campos no deben estar vacíos.
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "estreno", "required.estreno", "Todos los campos son obligatorios.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pais", "required.pais", "Todos los campos son obligatorios.");
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "director", "required.correo", "Todos los campos son obligatorios."); 
        
       
/*        if (!(pelicula.getCorreo() != null && pelicula.getCorreo().isEmpty()))
        {
            this.pattern = Pattern.compile(EMAIL_PATTERN);
            this.matcher = pattern.matcher(pelicula.getCorreo());
             if (!matcher.matches()) {
                errors.rejectValue("correo", "correo.incorrect",
                  "El E-Mail "+pelicula.getCorreo()+" no es válido");
               }
        }
*/
        
        if(pelicula.getPais().equals(""))
        {
	    errors.rejectValue("pais", "required.pais","Seleccione un país");
	}
        
    }
    
}
