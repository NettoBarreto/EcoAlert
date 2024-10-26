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
        <h1>Cadastro:</h1>
        <%
            //receber os dados digitados no formulario cadpro.html
            int codigo;
            String nome;
            String validade;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            validade = request.getParameter("data");
            
            String url = "jdbc:mysql://localhost:3306/banco";
            String user = "root";
            String password = "netto200";

            Connection conn = null;
            PreparedStatement stmt = null;

            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String sql = "INSERT INTO produto (codigo, nome, validade) VALUES (?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, codigo);
                stmt.setString(2, nome);
                stmt.setString(3, validade);

                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    out.println("("+nome+") Cadastrado com sucesso!");
                }
            } catch (Exception x) {
                String erro = x.getMessage();
                x.printStackTrace();
                if(erro.contains("Duplicate entry")) { %>
                <ul>Esse codigo já está sendo usado!</ul>
                <ul>Tente novamente com outro codigo :) </ul>
             <% }
             else {
                out.println("Erro ao cadastrar: " + x.getMessage());
            }} finally {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
            
    </body>
</html>
