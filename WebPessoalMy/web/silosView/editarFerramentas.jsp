<%-- 
    Document   : excluirFerramentas
    Created on : 26 de mar. de 2024, 12:49:06
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SILOS-ESTOQUE</title>
        <style>
            #form{
                background-color: darkblue;
                color: white;
                padding: 30px;
                border-radius: 15px;
                width: 180px;
                margin-left: 45%;
                margin-top: 10%;
            }
            body{
                background-image: linear-gradient(to right, rgb(50, 84, 112), rgb(155, 146, 146));
            }
            a{
                color: white;
                text-decoration: none;
            }
            a:hover{
                color: greenyellow;
            }
            #btnCracha{
                background-color:rgb(0, 151, 0);
                padding: 4px;
                border: none;
                border-radius: 5px;
                box-shadow: 3pt 3pt 5pt rgb(33, 1, 75);
                width: 100px;
                color: white;
                cursor: pointer;
                transition: transform 0.5s ease;

            }
            #btnCracha:hover{
                transform: translateX(5px);
                background-color: rgb(1, 90, 1);
            }
            h1{
                color:white;
            }
            h1 {
                font-size: 2.2em;
                background-image: linear-gradient(to right, greenyellow, lightgreen);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                animation: glow 2s infinite alternate;
                text-shadow: 0 0 20px rgba(255, 255, 255, 0.5);
                transition: text-shadow 0.5s ease-in-out;
            }

            /* Animação para o texto */
            @keyframes glow {
                0% {
                    text-shadow: 0 0 20px rgba(255, 255, 255, 0.5);
                }
                100% {
                    text-shadow: 0 0 30px rgba(255, 255, 255, 1);
                }
            }

            /* Quando passa o mouse, aumenta o efeito de sombra */
            h1:hover {
                text-shadow: 0 0 40px rgba(255, 255, 255, 0.9);
            }
        </style>
    </head>
    <body>
        <div id="form">
            <h1>Alterando...</h1>
            <form action="alterando.jsp" method="POST">

                <label>ID: </label><br>
                <input type="text" name="id" placeholder="Nº" 
                       value="<%=request.getParameter("id")%>"><br><br>

                <label>Nomenclatura: </label><br>
                <input type="text" name="nomenclatura" 
                       value="<%=request.getParameter("nomenclatura")%>"><br><br>
                <label>P/N: </label><br>
                <input type="text" name="pn" 
                       value="<%=request.getParameter("pn")%>"><br><br>
                <label>S/N: </label><br>
                <input type="text" name="sn"
                       value="<%=request.getParameter("sn")%>"><br><br>
                <label>Localização: </label><br>
                <input type="text" name="localizacao"
                       value="<%=request.getParameter("localizacao")%>"><br><br>
                <label>Quantidade: </label><br>
                <input type="text" name="calibravel" 
                       value="<%=request.getParameter("calibravel")%>"><br><br>
                <button type="submit" id="btnCracha">ALTERAR</button><br><br><a id="lista" href="http://localhost:8080/SILOS/silosView/listarFerramentas.jsp">CANCELAR</a>
            </form>
        </div>
    </body>
</html>

