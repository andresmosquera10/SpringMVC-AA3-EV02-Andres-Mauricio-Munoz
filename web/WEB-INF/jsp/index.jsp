<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <title>CRUD - Spring MVC - Andres Munoz</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>

    <body>
        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Lista de Usuarios</h5>
                    <a class="btn btn-light" href="insertar.htm">Insertar nuevo usuario</a>
                </div>
                <div class="card-body">
                    <c:if test="${not empty lista}">
                    <table class="table table-hover table-bordered text-center">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${lista}">
                            <tr>
                                <td>${dato.ID}</td>
                                <td>${dato.Nombre}</td>
                                <td>${dato.Email}</td>
                                <td>${dato.Password}</td>
                                <td>
                                    <a href="editar.htm?id=${dato.ID}" class="btn btn-warning btn-sm">Editar</a>
                                    <a href="eliminar.htm?id=${dato.ID}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">Eliminar</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </c:if>
                    <c:if test="${empty lista}">
                        <div class="alert alert-info text-center" role="alert">
                            No hay usuarios registrados.
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
