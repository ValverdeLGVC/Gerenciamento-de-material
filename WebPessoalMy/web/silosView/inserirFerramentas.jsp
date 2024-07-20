<%-- 
    Document   : inserirFerramentas
    Created on : 25 de mar. de 2024, 10:43:03
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
        <title>SILOS_ESTOQUE</title>
        <style>
            body{
                background-image: linear-gradient(to right, rgb(79, 79, 139), rgb(179, 185, 194));
            }
            #msg{
                background-color: blue;
                width: 200px;
                text-align: center;
                border-radius: 35px;
                margin-top: 200px;
                margin-left: 800px;
                padding: 40px;
                color:white;
                box-shadow: 3pt 3pt 5pt rgb(1, 18, 66);
                font-size: larger;
            }
            #btnVoltar{
                color: white;
                background-color: red;
                text-decoration: none;
                border-radius: 7px;
                padding: 10px;
                cursor: pointer;
                box-shadow: 3pt 3pt 5pt rgb(1, 18, 66);
                text-align: center;
                margin-left: 900px;
            }
        </style>
    </head>
    <body>
        <%
            try {
                silosDTO objSilosDTO = new silosDTO();
                objSilosDTO.setNomenclatura(request.getParameter("nomenclatura"));
                objSilosDTO.setPN(request.getParameter("pn"));
                objSilosDTO.setSN(request.getParameter("sn"));
                objSilosDTO.setLocalizacao(request.getParameter("localizacao"));
                objSilosDTO.setCalibravel(request.getParameter("calibravel"));
                
                

                silosDAO objSilosDAO = new silosDAO();
                objSilosDAO.CadastrarFerramentas(objSilosDTO);
                
                String item = request.getParameter("nomenclatura");
                String p = request.getParameter("pn");
                String s = request.getParameter("s");
                String loc = request.getParameter("localizacao");
                String cal = request.getParameter("calibravel");

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "[Erro]: inserirFerramentas", "Erro", JOptionPane.ERROR_MESSAGE);
            }
        %>
        <div id="msg">
            <label id="lblMsg">CADASTRADO COM SUCESSO!!!</label>
        </div><br><br>
        <a id="btnVoltar" href="http://localhost:8080/SILOS/silosView/silos.html">VOLTAR</a>
    </body>
</html>
