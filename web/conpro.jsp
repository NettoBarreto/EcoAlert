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
        <h1>Lista de Itens Bsucados:</h1>
        <%
            //recebe nome do Produto digitado
            String n;
            n = request.getParameter("nome");
            
            
               try{
               
               //informações banco de dados
                String url = "jdbc:mysql://localhost:3306/banco";
                String user = "root";
                String password = "netto200";

                Connection conn = null;
                PreparedStatement st = null;
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                //comando sql
                String sql = "SELECT * FROM produto WHERE nome LIKE ? ORDER by validade";
                st = conn.prepareStatement(sql);
                st.setString(1, "%" + n + "%");
                //listar os dados da tabela
                ResultSet rs = st.executeQuery();         
%>
                <table> 
                    <tr>
                        <th>Código</th> <th>Nome</th> <th>Validade</th>
<%
                while (rs.next()) {
%>                
                    <tr>
                        <td><%= rs.getString("codigo") %></td>
                        <td><%= rs.getString("nome") %></td>
                        <td><%= rs.getString("validade") %></td>                      
                    </tr>                
<%
    }                    
%>
                </table>           
<%                  
                //resultado test
                out.println("Listagem de produtos executada com sucesso!");
                }
             catch (Exception x) {
            out.print("Mensagem de erro:" + x.getMessage());
        }
%>
    </body>
</html>