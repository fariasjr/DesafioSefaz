<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            <label>Descrição:</label><br>
            
            <input type="text" name="descricao"/><br>
            
            <button type="submit">
                OK
            </button>
            
            <%
                try {
                    out.print("<table>");
                    out.print("<tr>");
                    out.print("<th>ID</th><th>NOME</th><th>EMAIL</th><th>SENHA</th><th>Editar</th><th>Excluir</th>");
                    out.print("</tr>");

                    UsuarioDAO usuarioDao = new UsuarioDAO();

                    if (request.getParameter("nome") == "" ||  request.getParameter("nome") == null){
                        ArrayList<Usuario> lista = usuarioDao.listarTodosUsuarios();
                        for (int num = 0; num < lista.size(); num++){
                            out.print("<tr>");
                            out.print("<td>"+lista.get(num).getId()+"</td>");
                            out.print("<td>"+lista.get(num).getNome()+"</td>");
                            out.print("<td>"+lista.get(num).getEmail()+"</td>");
                            out.print("<td>"+lista.get(num).getSenha()+"</td>");
                            out.print("<td>"+lista.get(num).getTelefone().getDdd()+"</td>");
                            out.print("<td>"+lista.get(num).getTelefone().getNumero()+"</td>");
                            out.print("<td>"+lista.get(num).getTelefone().getTipo()+"</td>");
                            
                            out.print("<td><a href='alterar.jsp?id="+lista.get(num).getId()+"&nome="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"&password="+lista.get(num).getSenha()+"'>CLIQUE</a></td>");
                            out.print("<td><a href='excluir.jsp?id="+lista.get(num).getId()+"&nome="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"'>CLIQUE</a></td>");
                            
                            out.print("</tr>");
                        }
                    } else {
                        ArrayList<Usuario> lista = usuarioDao.listarTodosUsuariosEmail(request.getParameter("email"));
                        for (int num = 0; num < lista.size(); num++){
                            out.print("<tr>");
                            out.print("<td>"+lista.get(num).getId()+"</td>");
                            out.print("<td>"+lista.get(num).getNome()+"</td>");
                            out.print("<td>"+lista.get(num).getEmail()+"</td>");
                            out.print("<td>"+lista.get(num).getSenha()+"</td>");
                            out.print("<td>"+lista.get(num).getTelefone().getDdd()+"</td>");
                            out.print("<td>"+lista.get(num).getTelefone().getNumero()+"</td>");
                            out.print("<td>"+lista.get(num).getTelefone().getTipo()+"</td>");
                            
                            out.print("<td><a href='alterar.jsp?id="+lista.get(num).getId()+"&name="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"&password="+lista.get(num).getSenha()+"'>CLIQUE</a></td>");
                            out.print("<td><a href='excluir.jsp?id="+lista.get(num).getId()+"&name="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"'>CLIQUE</a></td>");
                            
                            out.print("</tr>");
                        }
                    }

                    out.print("</table>");
                } catch (Exception erro) {
                    throw new RuntimeException("Erro index 1: "+erro);
                }
            %>
            
            <a href="inserir.jsp">NOVO</a>
            
            
        </form>
    </body>
</html>
