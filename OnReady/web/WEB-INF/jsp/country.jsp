<%-- 
    Document   : home
    Created on : 26/01/2019, 07:08:38
    Author     : JoseTT
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1>Listado de Países</h1>
            </div>
            <div class="row">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr align="center">
                            <th>Código</th>
                            <th>País</th>
                            <th>Capital</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="dato">
                            <tr>
                                <td><c:out value="${dato.iso3}" /></td>
                                <td><c:out value="${dato.nombre}" /></td>
                                <td><c:out value="${dato.capital}" /></td>
                                <!--
                                <td>
                                    <a href="<c:url value="edit.htm?id=${dato.iso3}"/>" class="btn btn-warning far fa-edit"></span></a>
                                    <a href="<c:url value="delete.htm?id=${dato.iso3}"/>" class="btn btn-danger far fa-trash-alt"></span></a>
                                </td>
                                -->
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
