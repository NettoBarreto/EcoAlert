<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


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

            
                Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    String sql = "UPDATE produto SET nome=?, validade=? WHERE codigo=?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, nome);
                    stmt.setString(2, validade);
                    stmt.setInt(3, codigo);
                    stmt.executeUpdate();
                                        
                    int rows = stmt.executeUpdate();
                    if (rows > 0) {
                        out.println("(" + nome + ") Alterado com Sucesso!");}
                        else{
                        out.println("Peidou na Moranhga!");
                         }
                        

        %>
              
    </body>
</html>
