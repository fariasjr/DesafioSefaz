<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="executa_inserir.jsp" method="post">
            <!--
            <label>Codigo: </label><br>
            <input type="text" name="id"/><br>
            -->
            <label>Nome:</label><br>
            <input type="text" name="nome"/><br>
            
            <label>e-mail:</label><br>
            <input type="text" name="email"/><br>
            
            <label>Senha:</label><br>
            <input type="text" name="password"/><br>
            
            <button type="submit">
                OK
            </button>
        </form>
    </body>
</html>
