<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1>Ingrese sus datos</h1>
                <form:form method="POST" commandName="pelicula">
                    
                    <form:errors path="*" element="div" cssClass="alert alert-danger" />
                   
                    <p>
                       <form:label path="titulo">Título</form:label>
                       <form:input path="titulo" cssClass="form-control" />
                       <form:errors path="titulo" />
                    </p>
                    
                    <p>
                       <form:label path="estreno">Año</form:label>
                       <form:input path="estreno" cssClass="form-control" />
                    </p>
                    
                    <p>
                        <form:label path="pais">País</form:label>
                        <form:select path="pais" cssClass="form-control">
                            <form:option value="0">Seleccione el país de origen.</form:option>
                            <form:options items="${listaPaises}" />
                        </form:select>
                    </p>
                    <hr />
                    <input type="submit" value="Enviar" class="form-control" />
                </form:form>   
            </div>
        </div>
        
    </body>
</html>
