<%-- 
    Document   : inserirLogin
    Created on : 12 de abr. de 2024, 13:35:59
    Author     : Luiz Gustavo
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.com.DAO.silosDAO"%>
<%@page import="br.com.DTO.silosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SILOS_CADASTRO</title>
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
    <!-- 
        if (crachaValor == null || crachaValor.isEmpty()) {
                %><script>alert('Por favor, digite um login e senha');</script>
                    
                }
    -->
    <body>
        <%
            //ResultSet rs;

            silosDTO objSilosDTO = new silosDTO();
            objSilosDTO.setCracha(request.getParameter("cracha"));
            objSilosDTO.setNome(request.getParameter("nome"));
            objSilosDTO.setSenha(request.getParameter("senha"));

            String crachaValor = request.getParameter("cracha");
            String nomeValor = request.getParameter("nome");
            String senhaValor = request.getParameter("senha");
            if (crachaValor == null || crachaValor.isEmpty() || senhaValor == null || senhaValor.isEmpty() || nomeValor == null || nomeValor.isEmpty()) {
        %><style>
            .custom-alert {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .custom-alert-content {
                background-color: white;
                padding: 20px;
                border: 2px solid orange;
                border-radius: 5px;
                text-align: center;
                color: orange;
            }

            .custom-alert-content p {
                margin: 0 0 20px;
            }

            .custom-alert-content button {
                background-color: orange;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            .custom-alert-content button:hover {
                background-color: darkorange;
            }
        </style>
        <div id="custom-alert" class="custom-alert">
            <div class="custom-alert-content">
                <p id="custom-alert-message"></p>
                <button id="custom-alert-button">OK</button>
            </div>
        </div>

        <script>
            function showCustomAlert(message) {
                const alertBox = document.getElementById('custom-alert');
                const alertMessage = document.getElementById('custom-alert-message');
                const alertButton = document.getElementById('custom-alert-button');

                alertMessage.textContent = message;
                alertBox.style.display = 'flex';

                alertButton.onclick = function () {
                    alertBox.style.display = 'none';
                    window.location.href = "http://localhost:8080/SILOS/silosView/login.html";
                };
            }

            // Exemplo de uso
            window.onload = function () {
                showCustomAlert('Insira um saram, um login e uma senha!');
            };
        </script><%
            } else {

                silosDAO objSilosDAO = new silosDAO();
                objSilosDAO.cadastrarLogin(objSilosDTO);

            }


        %>

        <div id="msg"> 
            <label id="lblMsg">CONFIRA SEU CADASTRO!!!</label>
        </div><br><br>
        <a id="btnVoltar" href="http://localhost:8080/SILOS/silosView/login.html">VOLTAR</a>
    </body>
</html>
