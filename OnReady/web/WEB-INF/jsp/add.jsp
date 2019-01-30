<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>.:on{Cinema}:.</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="<c:url value="/home.htm" />">Listado de Películas</a></li>
                <li class="active">Agregar</li>
            </ol>
            <div class="panel panel-primary">
                <div class="panel-heading">Agregar</div>
                <div class="panel-body">
                   
                        <form:form method="post" commandName="pelicula">
                            <h3>Agregue la Película</h3>
                            <form:errors path="*" element="div" cssClass="alert alert-danger" />
                            <p>
                                <form:label path="titulo">Título</form:label>
                                <form:input path="titulo" cssClass="form-control" />
                            </p>
                            <p>
                                <form:label path="estreno">Fecha de estreno:</form:label>
                                <form:input path="estreno" cssClass="form-control" />
                            </p>
                            <p>
                                <form:label path="sinopsis">Sinopsis:</form:label>
                                <form:input path="sinopsis" cssClass="form-control" />
                            </p>
                            <p>
                                <form:label path="pais">Pais de origen</form:label>
                                <table>
                                    <tr>
                                        <td>
                                            <select name="pais">
                                                <option value="0">Seleccione el país...</option>
                                                <c:forEach items="${paises}" var="pais">
                                                    <option value="${pais.iso3}">${pais.nombre}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </table>    
                            </p>
                            <hr />
                            <input type="submit" value="Guardar" class="btn btn-success" />
                            <a href="<c:url value="home.htm"/>" class="btn btn-secondary">Cancelar</a><br/>
                        </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
