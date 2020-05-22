<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${usuario==null}">
    <c:redirect url="${pageContext.request.contextPath}/../index.jsp"></c:redirect>
</c:if> 
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark barraMenu">
    <div class="collapse navbar-collapse nav-xbootstrap" >
        <ul class="navbar-nav mr-auto " id="elmentosMunu">
            <li><a class="navbar-brand " href="${pageContext.request.contextPath}/sesionIniciada/Inicio.jsp" id="home">HOME</a></li>
            <!--AUTORIZACION DEL MODELO-->
            <li class="nav-item" id="li1"><a class="btn nav-link enlacesItems " >Autorización del modelo</a>
                <ul class="dropdown">
                    <c:if test="${privilegio=='Estandar' || privilegio=='Administrador'}">
                        <li><a  href="${pageContext.request.contextPath}/sesionIniciada/SubirDocumentacion.jsp">Subir la autorización del modelo</a></li>         
                        <!--../SubirDocumentacion.jsp
                        /proyectoSedesol/sesionIniciada/SubirDocumentacion.jsp-->
                    </c:if> 
                    <c:if test="${privilegio=='Procesos' || privilegio=='Administrador'}">
                        <li><a href="${pageContext.request.contextPath}/sesionIniciada/RevisarDocumentacion.jsp">Revisar la  autorización del modelo</a></li>  
                        </c:if>
                    <li ><a  href="${pageContext.request.contextPath}/ControladorProcesos?proceso=listado&estado=${estado}">Listado autorización del modelo</a></li>
                </ul>
            </li>
            <!--CAMBIO DE DOMICILIO-->
            <li class="nav-item" id="li3"><a class="btn nav-link enlacesItems " href="javascript:void(0)" >Cambio de domicilio</a>
                <ul class="dropdown">
                    <c:if test="${privilegio=='Estandar' || privilegio=='Administrador'}">
                        <li><a href="${pageContext.request.contextPath}/sesionIniciada/CambioDomicilio.jsp">Proceso cambio de domicilio</a></li>
                        </c:if>
                        <c:if test="${privilegio=='Procesos' || privilegio=='Administrador'}">
                        <li><a  href="${pageContext.request.contextPath}/sesionIniciada/CambioDomicilioP.jsp">Revisar cambio de domicilio</a></li>
                        </c:if>
                    <li><a  href="${pageContext.request.contextPath}/ControladorCD?proceso=listarCD&estado=${estado}">Listado cambio de domicilio</a></li>
                </ul>
            </li>
            <!--CAMBIO DE RESPONSABLE-->
            <li class="nav-item" id="li4"><a class="btn nav-link enlacesItems">Cambio de responsable</a>
                <ul class="dropdown">
                    <c:if test="${privilegio=='Estandar' || privilegio=='Administrador'}">
                        <li><a href="${pageContext.request.contextPath}/sesionIniciada/CambioResponsable.jsp">Proceso cambio de responsable</a></li>
                        </c:if>
                        <c:if test="${privilegio=='Procesos' || privilegio=='Administrador'}">
                        <li><a href="${pageContext.request.contextPath}/sesionIniciada/CambioResponsableP.jsp">Revisar cambio de responsable</a></li>
                        </c:if>
                    <li><a   href="${pageContext.request.contextPath}/ControladorCR?proceso=listarCR&estado=${estado}">Listado cambio de responsable</a></li>
                </ul>
            </li> 
            <!--OTROS-->
            <c:if test="${privilegio=='Administrador'}">
                <li class="nav-item" id="li5"><a class="btn nav-link enlacesItems " >Otros</a>
                    <ul class="dropdown">
                        <li  id="li5"><a  href="${pageContext.request.contextPath}/sesionIniciada/ActualizarDB.jsp">Actualizar la base de datos</a></li> 
                        <li  id="li5"><a  href="${pageContext.request.contextPath}/ControladorUsuario?proceso=listarUsuario">Agregar Usuario</a></li> 
                    </ul>
                </li>
            </c:if>
        </ul>
        <div class=" form-inline mt-2 mt-md-0">            
            <li style="list-style: none;">
                <div class="titulo dropdown-toggle" id="cerrar" >Cerrar sesion</div>
                <ul class="menu" id="menu">
                    <form action="/proyectoSedesol/ControladorSesion?instruccion=cerrarSesion" method="POST">
                        <li style="list-style: none;"><a href="#"><img src="${pageContext.request.contextPath}/img/start-Usuario.png" height="90" width="90" alt="usuarios"/></a> </li>
                        <li style="list-style: none;"><a href="#"><b>Bienvenido(a):</b> ${usuario}</a></li>
                        <hr>
                        <li style="list-style: none;" ><input type="submit" class="btn btn-danger btn-block" value="Salir"/></li> 
                    </form>

                </ul>   
            </li> 
        </div>
    </div>
</nav>