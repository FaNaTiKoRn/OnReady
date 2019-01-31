<%-- 
    Document   : Main View.
    Created on : 26/01/2019, 07:08:38
    Author     : José Torres Tortorella
    Comments   : This file represents the View from the Main web redirection for the Project.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Scripts para la correcta implementación de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.js" ></script>

<!DOCTYPE html>

<html>
    <head>
        <meta charset=UTF-8" />
        <title>.: on{Cinema} :.</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1>Listado de Películas</h1>
            </div>
            <div class="row" style="text-align:center;">
                <table class="table table-striped table-hover" style="text-align:center;">
                    <thead>
                        <tr>
                            <th>
                            <div class="btn-group dropleft" style="text-align:left;">
                                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  ordenar
                                </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu">
                                        <a href="<c:url value="home.htm?orden=titulo"/>" data-html="true" data-toggle="tooltip" title="Ordenar <b>por Título</b>" class="dropdown-item" type="button">Titulo</a>
                                        <a href="<c:url value="home.htm?orden=estreno"/>" data-html="true" data-toggle="tooltip" title="Ordenar <b>por Año de Estreno</b>" class="dropdown-item" type="button">Año</a>
                                        <a href="<c:url value="home.htm?orden=nombre"/>" data-html="true" data-toggle="tooltip" title="Ordenar <b>por País de Origen</b>" class="dropdown-item" type="button">País</a>
                                    </div>
                              </div>
                            </th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>
                                <div style="text-align:right;" class="input-group input-group-sm mb-3" style="width:333px">
                                    <input style="text-align:right" id="busqueda" type="text" class="form-control" placeholder="Buscar por título..." aria-describedby="inputGroup-sizing-sm">
                                    <div class="input-group-prepend">
                                        <button type="button" onClick="busca()" class="btn btn-outline-secondary input-group-text fas fa-search" role="button" data-html="true" data-toggle="tooltip" title="Burcar <b>por Título</b>">
                                    </div>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <c:set var="loop" value="1" scope="request"/>
                            <tr>
                                <td>
                                    <img src="public/thumbnails/${dato.id}.jpg" class="img-thumbnail" data-html="true" data-toggle="tooltip" title="<b>${dato.titulo} <em>(${dato.estreno})</em></b><br>${dato.sinopsis}" data-placement="bottom" >
                                    <p><b><c:out value="${dato.titulo}" /></b><br><em>(<c:out value="${dato.estreno}" />)</em></p>
                                    <p><c:out value="${dato.nombre}" /></p>
                                    <p><a href="<c:url value="edit.htm?id=${dato.id}"/>" class="btn btn-warning far fa-edit"></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id}"/>" class="btn btn-danger far fa-trash-alt"></a></p>
                                </td>
                                <td>
                                    <img src="public/thumbnails/${dato.id}.jpg" class="img-thumbnail" data-html="true" data-toggle="tooltip" title="<b>${dato.titulo} <em>(${dato.estreno})</em></b><br>${dato.sinopsis}" data-placement="bottom" >
                                    <p><b><c:out value="${dato.titulo}" /></b><br><em>(<c:out value="${dato.estreno}" />)</em></p>
                                    <p><c:out value="${dato.nombre}" /></p>
                                    <p><a href="<c:url value="edit.htm?id=${dato.id}"/>" class="btn btn-warning far fa-edit"></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id}"/>" class="btn btn-danger far fa-trash-alt"></a></p>
                                </td>
                                <td>
                                    <img src="public/thumbnails/${dato.id}.jpg" class="img-thumbnail" data-html="true" data-toggle="tooltip" title="<b>${dato.titulo} <em>(${dato.estreno})</em></b><br>${dato.sinopsis}" data-placement="bottom" >
                                    <p><b><c:out value="${dato.titulo}" /></b><br><em>(<c:out value="${dato.estreno}" />)</em></p>
                                    <p><c:out value="${dato.nombre}" /></p>
                                    <p><a href="<c:url value="edit.htm?id=${dato.id}"/>" class="btn btn-warning far fa-edit"></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id}"/>" class="btn btn-danger far fa-trash-alt"></a></p>
                                </td>
                                <td>
                                    <img src="public/thumbnails/${dato.id}.jpg" class="img-thumbnail" data-html="true" data-toggle="tooltip" title="<b>${dato.titulo} <em>(${dato.estreno})</em></b><br>${dato.sinopsis}" data-placement="bottom" >
                                    <p><b><c:out value="${dato.titulo}" /></b><br><em>(<c:out value="${dato.estreno}" />)</em></p>
                                    <p><c:out value="${dato.nombre}" /></p>
                                    <p><a href="<c:url value="edit.htm?id=${dato.id}"/>" class="btn btn-warning far fa-edit"></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id}"/>" class="btn btn-danger far fa-trash-alt"></a></p>
                                </td>
                                <td>
                                    <img src="public/thumbnails/${dato.id}.jpg" class="img-thumbnail" data-html="true" data-toggle="tooltip" title="<b>${dato.titulo} <em>(${dato.estreno})</em></b><br>${dato.sinopsis}" data-placement="bottom" >
                                    <p><b><c:out value="${dato.titulo}" /></b><br><em>(<c:out value="${dato.estreno}" />)</em></p>
                                    <p><c:out value="${dato.nombre}" /></p>
                                    <p><a href="<c:url value="edit.htm?id=${dato.id}"/>" class="btn btn-warning far fa-edit"></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id}"/>" class="btn btn-danger far fa-trash-alt"></a></p>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <p>
                    <a href="<c:url value="add.htm"/>" class="btn btn-success">Agregar</a><br/>
                </p>
            </div>
        </div>
    </body>
</html>

<!-- Script para enviar parámetros para búsqueda de películas por Título -->
<script>
    function busca() {
	var titulo=document.getElementById('busqueda');
	location.href ='home.htm?busca=' + titulo.value;
    }
</script>



