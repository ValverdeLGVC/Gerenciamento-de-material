<%-- 
    Document   : excluirItens
    Created on : 26 de mar. de 2024, 13:25:57
    Author     : Lenovo
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.com.DAO.silosDAO"%>
<%@page import="br.com.DTO.silosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #msgExcluir{
                background-color: blue;
                color: white;
                border-radius: 7px;
                text-align: center;
                padding: 30px;
                width: 400px;
                font-size: 3em;
                margin-top: 200px;
                margin-left: 710px;
                box-shadow:3pt 3pt 5pt rgb(1, 18, 66); 
            }
            body{
                background-image: linear-gradient(to right, rgb(79, 79, 139), rgb(179, 185, 194));
            }
            #divVoltar{
                padding: 10px;
                background-color: blue;
                border-radius: 9px;
                margin-left: 890px;
                box-shadow:3pt 3pt 5pt rgb(1, 18, 66);
                transition: transform 0.5s ease;
                width: 100px;
                margin-top: 25px;
                text-align: center;
            }
            #divVoltar:hover{
                background-color: green;
                transform: translateX(-6px);
            }
            .volta{
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <div id="msgExcluir">
            Excluido com Sucesso!!!!
        </div>
        <div id="divVoltar">
            <a class="volta" href="http://localhost:8080/SILOS/silosView/listarFerramentas.jsp"> VOLTAR</a>
        </div>


        <%
            try {
                silosDTO objSilosDTO = new silosDTO();
                objSilosDTO.setID(Integer.parseInt(request.getParameter("id")));
                

                silosDAO objSilosDAO = new silosDAO();
                objSilosDAO.ExcluirFerramentas(objSilosDTO);

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "[Erro]: inserirFerramentas", "Erro", JOptionPane.ERROR_MESSAGE);
            }
        %>
    </body>
</html>
