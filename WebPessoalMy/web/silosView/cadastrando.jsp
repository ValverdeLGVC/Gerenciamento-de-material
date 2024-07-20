<%@page import="br.com.DAO.silosDAO"%>
<%@page import="br.com.DTO.silosDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SILOS_CADASTRO</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-image: linear-gradient(to right, rgb(50, 84, 112), rgb(155, 146, 146));

            }

            #error-container {
                position: relative;
            }

            #error-message {
                font-size: 24px;
                color: #fff;
                background-color: #ff6347; /* Tom de vermelho */
                padding: 10px 20px;
                border-radius: 5px;
                animation: shake 0.5s infinite alternate, blink 1s infinite;
            }

            @keyframes shake {
                0% {
                    transform: translateX(0);
                }
                100% {
                    transform: translateX(10px);
                }
            }

            @keyframes blink {
                0%, 100% {
                    opacity: 3;
                }
                50% {
                    opacity: 0.5;
                }
            }

        </style>
    </head>
    <body>
        
        <%
            String cracha = request.getParameter("cracha");
            String senha = request.getParameter("senha");

            silosDAO objSilosDAO = new silosDAO();
            boolean loginValido = objSilosDAO.verificarLogin(cracha, senha);

            if (loginValido) {
                // Redirecionar para a página de sucesso ou executar outras ações
                response.sendRedirect("inicio.html");
            } else {%>
        <style>
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
                border: 2px solid red;
                border-radius: 5px;
                text-align: center;
                color: red;
            }

            .custom-alert-content p {
                margin: 0 0 20px;
            }

            .custom-alert-content button {
                background-color: red;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            .custom-alert-content button:hover {
                background-color: darkred;
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
                    window.location.href = "http://localhost:8080/SILOS/silosView/cadastrarCracha.jsp";
                };
            }

        // Exemplo de uso
            window.onload = function () {
                showCustomAlert('Login ou senha incorretos, tente novamente!');
            };
        </script>
        <%

            }
        %>

    </body>
</html>
