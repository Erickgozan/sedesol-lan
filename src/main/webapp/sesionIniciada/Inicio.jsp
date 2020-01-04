<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="proyectoSedesol/../componentes/Headboard.jsp" %>
        <title>Pagina Inicio</title>
    </head>
    <body>  
        <%@include file="proyectoSedesol/../componentes/Menu.jsp" %>

        <div class="containerCuerpo container  mt-2">
            <h1>BIENVENIDO USUARIO: <p style="color:green; ">${usuario} DE ${estado}</p></h1> 
            <hr>
            <div class="card-deck">
                <div class="card text-center" >
                    <!--INICIO DEL PRIMER BLOQUE-->
                    <div class="card-body">
                        <c:if test="${privilegio=='Administrador'}">
                            <img src="/proyectoSedesol/img/subir_documento.png" width="100" height="100" alt=""/>
                            <h5 class="card-title">AUTORIZACIÓN DEL MODELO</h5>
                            <p class="card-text">Proceso de autorización de modelo.</p>
                            <a href="/proyectoSedesol/sesionIniciada/RevisarDocumentacion.jsp" class="btn btn-outline-success">Revisar la AM</a>
                            <p style="padding: 10px"><!--Genera un espacio entre los dos enlaces-->
                                <a href="/proyectoSedesol/sesionIniciada/SubirDocumentacion.jsp" class="btn  btn-outline-success">Subir la AM</a>
                            </c:if>
                            <c:if test="${privilegio=='Estandar'}">                                
                                <img src="/proyectoSedesol/img/subir_documento.png" width="100" height="100" alt=""/>
                            <h5 class="card-title">AUTORIZACIÓN DEL MODELO</h5>
                            <p class="card-text">Subir el documento de autorización de modelo.</p>      
                            <a href="/proyectoSedesol/sesionIniciada/SubirDocumentacion.jsp" class="btn  btn-outline-success">Subir el documento</a>
                        </c:if>
                        <c:if test="${privilegio=='Procesos'}">
                            <img src="/proyectoSedesol/img/subir_documento.png" width="100" height="100" alt=""/>
                            <h5 class="card-title">AUTORIZACIÓN DEL MODELO</h5>
                            <p class="card-text">Revisar el documento de autorización de modelo.</p>
                            <a href="/proyectoSedesol/sesionIniciada/RevisarDocumentacion.jsp" class="btn  btn-outline-success">Revisar el documento</a>
                        </c:if>
                    </div>
                </div>
                <div class="card text-center" >
                    <div class="card-body">
                        <img src="/proyectoSedesol/img/cambio_domicilio.png" width="100" height="100" alt=""/>
                        <h5 class="card-title">CAMBIO DE DOMICILIO</h5>
                        <c:if test="${privilegio=='Administrador' }">
                            <p class="card-text">Proceso cambio de domicilio</p>
                            <a href="/proyectoSedesol/sesionIniciada/CambioDomicilio.jsp" class="btn  btn-outline-success">Ir al proceso</a>     
                            <p style="padding: 10px">
                                <a href="/proyectoSedesol/sesionIniciada/CambioDomicilioP.jsp" class="btn  btn-outline-success">Revisar el proceso</a>
                            </c:if>
                            <c:if test="${privilegio=='Estandar' }">
                            <p class="card-text">Cambiar los datos del domicilio de la estancia y subir su respectiva documentación</p>
                            <a href="/proyectoSedesol/sesionIniciada/CambioDomicilio.jsp" class="btn  btn-outline-success">Ir al proceso</a>    
                        </c:if>          
                        <c:if test="${privilegio=='Procesos' }">
                            <p class="card-text">Revisar los datos del domicilio de la estancia y subir su respectiva documentación</p>
                            <a href="/proyectoSedesol/sesionIniciada/CambioDomicilioP.jsp" class="btn  btn-outline-success">Revisar al proceso</a>
                        </c:if>
                    </div>
                </div>
                <div class="card text-center" >
                    <div class="card-body">
                        <img src="/proyectoSedesol/img/cambio_responsable.png" width="180" height="100" alt=""/>
                        <h5 class="card-title">CAMBIO DE RESPONSABLE</h5>  
                        <c:if test="${privilegio=='Administrador' }">
                            <p class="card-text">Proceso cambio de responsable</p>
                            <a href="/proyectoSedesol/sesionIniciada/CambioResponsable.jsp" class="btn  btn-outline-success">Ir al proceso</a>     
                            <p style="padding: 10px">
                                <a href="/proyectoSedesol/sesionIniciada/CambioResponsableP.jsp" class="btn  btn-outline-success">Revisar al proceso</a>
                            </c:if>
                            <c:if test="${privilegio=='Estandar'}">
                            <p class="card-text">Cambiar los datos del responsable de la estancia y subir su respectiva documentación</p>
                            <a href="/proyectoSedesol/sesionIniciada/CambioResponsable.jsp" class="btn  btn-outline-success">Ir al proceso</a>
                        </c:if>
                        <c:if test="${privilegio=='Procesos' }">
                            <p class="card-text">Revisar los datos del responsable de la estancia y subir su respectiva documentación</p>
                            <a href="/proyectoSedesol/sesionIniciada/CambioResponsableP.jsp" class="btn  btn-outline-success">Revisar al proceso</a>
                        </c:if>
                    </div>
                </div>   

            </div>
            <br>
           <!--INICIO DEL SEGUNDO BLOQUE -->
            <div class="card-deck">
                <div class="card text-center" >
                    <div class="card-body">
                        <img src="/proyectoSedesol/img/listarEstancias.png" width="100" height="100" alt=""/>
                        <h5 class="card-title">LISTADO DE ESTANCIAS AUTORIZACIÓN DEL MODELO</h5>
                        <p class="card-text">Ver el listado de las estancia con AM y su respectiva revisión.</p>
                        <a href="/proyectoSedesol/ControladorProcesos?proceso=listado&estado=${estado}" class="btn  btn-outline-success">Ver el listado</a>
                    </div>    
                </div> 
                <div class="card text-center" >
                    <div class="card-body">
                        <img src="/proyectoSedesol/img/listarEstancias.png" width="100" height="100" alt=""/>
                        <h5 class="card-title">LISTADO DE ESTANCIAS CAMBIO DE DOMICILIO</h5>
                        <p class="card-text">Ver el listado de las estancias en cambio de domicilio y su respectiva revisión.</p>
                        <a href="/proyectoSedesol/ControladorCD?proceso=listarCD&estado=${estado}" class="btn  btn-outline-success">Ver el listado</a>
                    </div>   
                </div>
                <div class="card text-center" >
                    <div class="card-body">
                        <img src="/proyectoSedesol/img/listarEstancias.png" width="100" height="100" alt=""/>
                        <h5 class="card-title">LISTADO DE ESTANCIAS CAMBIO DE RESPONSABLE</h5>
                        <p class="card-text">Ver el listado las estancias en cambio de responsable y su respectiva revisión.</p>
                        <a href="/proyectoSedesol/ControladorCR?proceso=listarCR&estado=${estado}" class="btn  btn-outline-success">Ver el listado</a>
                    </div>   
                </div>   

            </div>
            <br>
        </div>
    </div>
    <%@include file="proyectoSedesol/../componentes/Footer.jsp" %>  
</body>
</html>
