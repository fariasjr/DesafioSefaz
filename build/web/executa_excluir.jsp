<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.UsuarioDAO"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                UsuarioDAO usuarioDao = new UsuarioDAO();
                usuarioDao.excluirUsers(request.getParameter("id"));
                response.sendRedirect("index.jsp");
            } catch (Exception erro) {
                throw new RuntimeException("Erro executa_excluir 1: "+erro);
            }
        %>
    </body>
</html>
