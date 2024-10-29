<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Itens</title>
        <link rel="stylesheet" href="tabela.css"/>
    </head>
    <body>     
        <h1>Lista de Itens:</h1>
        <%
            //informações banco de dados
            String url = "jdbc:mysql://localhost:3306/banco";
            String user = "root";
            String password = "netto200";
                
            Connection conn = null;
            PreparedStatement stmt = null;
               try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                //comando sql
                String sql = "SELECT * FROM produto ORDER By validade";
                stmt = conn.prepareStatement(sql);
                //listar os dados da tabela
                ResultSet rs = stmt.executeQuery();         
%>
                <table> 
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Validade</th>
                        <th>Exclusão</th>
                        <th>Alteração</th>
<%
                while (rs.next()) {
%>                
                    <tr>
                        <td><%= rs.getString("codigo") %></td>
                        <td><%= rs.getString("nome") %></td>
                        <td><%= rs.getString("validade") %></td>  
                        <td><a href="excpro.jsp?codigo=<%= rs.getString("codigo") %>">Excluir</a></td>
                        <td><a href="carregaprod.jsp?codigo=<%= rs.getString("codigo") %>">Alterar</a></td>
                    </tr>                
<%
    }                    
%>
                </table>           
<%                  
                //resultado test
                }
             catch (Exception x) {
            out.print("Mensagem de erro:" + x.getMessage());
        }
%>
        </table>
    </body>
</html>
