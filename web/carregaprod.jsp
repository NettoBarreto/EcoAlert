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
        <title>Alteração de Produto</title>
    </head>
    <body>
        <%
            //Recebe codigo
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            //conectar ao banco de dados
            try {
                String url = "jdbc:mysql://localhost:3306/banco";
                String user = "root";
                String password = "netto200";
                Connection conecta = null;
                PreparedStatement st = null;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection(url, user, password);
                //comando sql / listar dados da tabela
                String sql = "SELECT * FROM produto WHERE codigo = ?";
                st = conecta.prepareStatement(sql);
                st.setInt(1, cod);
                ResultSet rs = st.executeQuery();

                if (!rs.next()){
                    out.println("Este produto não foi encontrado");
                } else { 

                    String codigo = rs.getString("codigo");
                    String nome = rs.getString("nome");
                    String validade = rs.getString("validade");
                    
        %>

                <form method="post" action="alterar_produtos.jsp" target="centro">

                    <p>
                        <label for="codigo">Código:</label>
                        <input type="number" name="codigo" id="codigo" value="<%=codigo%>" readonly>
                    </p>
                    <p>
                        <label for="nome">Nome do Produto:</label>
                        <input type="text" name="nome" id="nome" size="50" maxlength="1000" value=<%=nome%>>
                    </p>
                    <p>
                        <label for="data">Validade(dd/mm/yy):</label>
                        <input type="text" name="data" id="data" size="10" maxlength="10" value=<%=validade%>>
                    </p>
                    <p>
                        <input type="submit" value="Salvar">
                    </p>
                </form>

        <%}

                //resultado test
            } catch (Exception x) {
                out.print("Mensagem de erro: " + x.getMessage());
            }

        %>
    </body>
</html>
