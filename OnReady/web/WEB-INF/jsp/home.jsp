<%-- 
    Document   : home
    Created on : 26/01/2019, 07:08:38
    Author     : JoseTT
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.js" ></script>
<!DOCTYPE html>

<html>
    <head>
        <meta charset=UTF-8" />
        <title>.:VídeoClub:.</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1>Listado de Películas</h1>
            </div>
            <div class="row">
                            <a href="<c:url value="home.htm?busca=true"/>" data-html="true" data-toggle="tooltip" title="Burcar <b>por Título</b>">Buscar</a>
                            <div class="container">
                                <div class="input-group input-group-sm mb-3">
                                    
                                    <input type="text" class="form-control" placeholder="Buscar por título..." aria-label="Recipient's username" aria-describedby="inputGroup-sizing-sm">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-outline-secondary input-group-text" type="button" id="button-addon2">Buscar</button>
                                    </div>
                                </div>
                            </div>

                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr align="center">
                            <th><a href="<c:url value="home.htm?orden=titulo"/>" data-html="true" data-toggle="tooltip" title="Ordenar <b>por Título</b>">Título <i class="fas fa-sort-down" /i></a></th>
                            <th><a href="<c:url value="home.htm?orden=estreno"/>" data-html="true" data-toggle="tooltip" title="Ordenar <b>por Año de Estreno</b>">Año <i class="fas fa-sort-down" /i></a></th>
                            <th><a href="<c:url value="home.htm?orden=nombre"/>" data-html="true" data-toggle="tooltip" title="Ordenar <b>por País de Origen</b>">País <i class="fas fa-sort-down" /i></a></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <tr>
                                <td><c:out value="${dato.titulo}" /></td>
                                <td><c:out value="${dato.estreno}" /></td>
                                <td><c:out value="${dato.nombre}" /></td>
                                <td>
                                    <a href="<c:url value="edit.htm?id=${dato.id}"/>" class="btn btn-warning far fa-edit"></span></a>
                                    <a href="<c:url value="delete.htm?id=${dato.id}"/>" class="btn btn-danger far fa-trash-alt"></span></a>
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

<!-- SCRIPT PARA ACTIVAR TOOLTIP CON BOOTSTRAP -->
<script>
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>

