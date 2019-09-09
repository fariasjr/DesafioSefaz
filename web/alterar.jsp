<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="executa_alterar.jsp" method="post">
            
            <label>Codigo: </label><br>
            <input type="text" name="id" <%=request.getParameter("id")%>/><br>
          
            <label>Nome:</label><br>
            <input type="text" name="nome" <%=request.getParameter("nome")%>/><br>
            
            <label>e-mail:</label><br>
            <input type="text" name="email" <%=request.getParameter("email")%>/><br>
            
            <label>Senha:</label><br>
            <input type="text" name="password" <%=request.getParameter("password")%>/><br>
            
            <button type="submit">
                OK
            </button>
        </form>
    </body>
</html>
