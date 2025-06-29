
<%@page contentType="text/html charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <title>Actualizar usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <h4>Actualizar usuario</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <input type="hidden" name="id" value="${persona.id}" />
                        
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="nombre" class="form-control" value="${persona.nombre}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Correo</label>
                            <input type="email" name="correo" class="form-control" value="${persona.correo}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <input type="password" name="password" class="form-control" value="${persona.password}" required>
                        </div>
                        <input type="submit" value="Actualizar" class="btn btn-success">
                        <a href="index.htm" class="btn btn-secondary ms-2">Volver</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
