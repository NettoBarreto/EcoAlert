<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Recebo codigo do formmulario
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            //Conecta ao Banco de Dados chamado banco
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "netto200");
                //Excluem produto de codigo informado
                PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); //Executa comando delete
                //verifica se o produto foi excluido ou não
                if (resultado > 0) {
                    out.println("<h1>O produto de código: " + cod + " foi excluido com sucesso! :)</h1>");
                } else {
                    out.println("<h1>O produto de codigo: " + cod + " Não existe, tente novamente ;)</h1>");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.println("Entre em contato com suporte e informe o erro: " + mensagemErro);
            }


        %>
    </body>
</html>
