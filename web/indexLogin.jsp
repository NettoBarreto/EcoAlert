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
        <title>Logado</title>
    </head>
    <body>
        
        
        <%       
        //receber os dados digitados no formulario cadpro.html
            String email="vazio";
            String senha="vazio";
            
            email = request.getParameter("email");
            senha = request.getParameter("senha");
            
            try {
                String url = "jdbc:mysql://localhost:3306/users";
                String user = "root";
                String password = "netto200";
                Connection conecta = null;
                PreparedStatement st = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection(url, user, password);
                
        %>
            <h2><%=email%></h2>
            <h2><%=senha%></h2>
     
        <%
                //comando sql / listar dados da tabela
                String sql = "SELECT * FROM usuarios where nome_usuario = ? ";
                st = conecta.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, senha);
                ResultSet rs = st.executeQuery();
                out.println(rs);
                
                %>
                <h2><%=rs%></h2>
        <h2><%=email%></h2>
        <h2><%=senha%></h2>
        <%
                
             //resultado test
            } catch (Exception x) {
                out.print("Mensagem de erro: " + x.getMessage());
            }
        
        %>
        
        
        
        
        
        <%%>
        
        <%%>
        
        <%%>
        
        <%%>
        
        <%%>
        
    </body>
</html>
