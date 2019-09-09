<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Telefone"%>
<%@page import="model.Usuario"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Usuario usuario = new Usuario();
                Telefone telefone = new Telefone();
                
                UsuarioDAO usuarioDao = new UsuarioDAO();
                
                if(request.getParameter("nome").equals("") ||  request.getParameter("email").equals("")){
                    response.sendRedirect("index.jsp");
                }else{
                    usuario.setId(Integer.parseInt(request.getParameter("id")));
                    usuario.setNome(request.getParameter("nome"));
                    usuario.setEmail(request.getParameter("email"));
                    usuario.setSenha(request.getParameter("senha"));
                    
                    telefone.setId(Integer.parseInt(request.getParameter("id")));
                    telefone.setDdd(Integer.parseInt(request.getParameter("ddd")));
                    telefone.setNumero(request.getParameter("numero"));
                    telefone.setTipo(request.getParameter("tipo"));
                    
                    usuario.setTelefone(telefone);
                    
                    usuarioDao.alterarUsers(usuario);
                    response.sendRedirect("index.jsp");
                }
                
            } catch (Exception erro) {
                throw new RuntimeException("Erro executa_alterar 1: "+erro);
            }
        %>
    </body>
</html>
