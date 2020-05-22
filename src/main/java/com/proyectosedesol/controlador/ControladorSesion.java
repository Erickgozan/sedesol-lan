package com.proyectosedesol.controlador;

import com.proyectosedesol.modelo.ModeloSesion;
import java.io.IOException;
import java.sql.SQLException;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import com.proyectosedesol.entidades.Usuarios;
import javax.servlet.http.HttpSession;

public class ControladorSesion extends HttpServlet {

    private ModeloSesion modelo;
    @Resource(name = "jdbc/sedesol")
    private DataSource pool;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            modelo = new ModeloSesion(pool);
        } catch (Exception e) {
            System.out.println("Eror en el servidor " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        //PrintWriter out = response.getWriter();
        RequestDispatcher dispatcher;

        String usuario = request.getParameter("txtUsuario");
        String contrasenia = request.getParameter("txtContrasenia");

        try {

            Usuarios usuariosDb = modelo.getLogUsuario(usuario, contrasenia);

            if (usuariosDb.getUsuario() != null) {
                sesion.setAttribute("usuario", usuario);
                sesion.setAttribute("privilegio", usuariosDb.getPrivilegio());
                sesion.setAttribute("estado", usuariosDb.getEstado());
                dispatcher = request.getRequestDispatcher("/sesionIniciada/Inicio.jsp");
                dispatcher.forward(request, response);
            }

        } catch (NullPointerException | SQLException e) {

            if (request.getParameter("instruccion") != null) {
                dispatcher = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
                sesion.invalidate();

            } else {
                request.setAttribute("error", "El USUARIO O CONTRASEÑA SON INCORRECTOS");

                dispatcher = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);

            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
