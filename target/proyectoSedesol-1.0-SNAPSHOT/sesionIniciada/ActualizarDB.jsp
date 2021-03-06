<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>

    <head>
        <%@include file="proyectoSedesol/../componentes/Headboard.jsp" %>
        <title>Actualizar la BD</title>
    </head>

    <body>
        <c:if test="${privilegio=='Administrador' }">
            <%@include file="proyectoSedesol/../componentes/Menu.jsp" %>
            <main>
                <h1>Actualizar BD</h1>
                <div>
                    <hr>
                </div>
                <article id="insertarTabla">
                    <form action="../ImportarExcel" method="POST" enctype="multipart/form-data" id="form">
                        <input type="hidden" name="proceso" value="insertDocumento">
                        <div class="form-group">
                            <label for="insertarSubir_doc">Insertar la tabla estancia.xlsx</label>
                            <input type="file" name="insertarSubir_doc" id="insertarSubir_doc">
                        </div>
                        <input type="submit" value="Enviar" id="enviar" class="btn btn-outline-success btn-lg">
                    </form >
                    <br>
                </article>
                <hr>
                <article id="ActualizarTabla">
                    <form action="../ImportarExcel" method="POST" enctype="multipart/form-data" id="form2">
                        <input type="hidden" name="proceso" value="ActualizarDocumento">
                        <div class="form-group">
                            <label for="exampleFormControlFile1">Actualizar la tabla estancia.xlsx</label>
                            <input type="file" name="actualizarSubir_doc" id="exampleFormControlFile1">
                        </div>
                        <input type="submit" value="Enviar" id="enviar" class="btn btn-outline-success btn-lg">
                    </form>
                    <br>
                </article>
                <hr>
                <article id="insertarTabla">
                    <form action="../ImportarExcel" method="POST" enctype="multipart/form-data" id="form">
                        <input type="hidden" name="proceso" value="insertDocumentoRevisar">
                        <div class="form-group">
                            <label for="insertarRevisar_doc">Insertar la tabla revisar_am.xlsx</label>
                            <input type="file" name="insertarRevisar_doc" id="insertarRevisar_doc">
                        </div>
                        <input type="submit" value="Enviar" id="enviar" class="btn btn-outline-info btn-lg">
                    </form>
                </article>
            </main>
            <%@include file="proyectoSedesol/../componentes/Footer.jsp" %>
        </c:if>
        <c:if test="${privilegio!='Administrador'}">
            <% response.sendRedirect("/proyectoSedesol/sesionIniciada/Inicio.jsp");%>
        </c:if>
    </body>

</html>