<%-- 
    Document   : cadastrarCracha
    Created on : 4 de abr. de 2024, 21:35:42
    Author     : Luiz Gustavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="pt-BR">
        <title>SILOS_CADASTRAR</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
                overflow-x: hidden;
                font-family: Arial, sans-serif;
                background: #000;
                color: white;
            }
            body {
                background: linear-gradient(to right, rgb(50, 84, 112), rgb(155, 146, 146));
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                position: relative;
                background: linear-gradient(to right, rgb(0, 10, 36), rgb(0, 61, 89));
            }
            .star {
                position: absolute;
                width: 2px;
                height: 2px;
                background: white;
                border-radius: 50%;
                animation: twinkle 2s infinite ease-in-out;
            }
            @keyframes twinkle {
                0%, 100% {
                    opacity: 0.5;
                }
                50% {
                    opacity: 1;
                }
            }
            #divCabeçalho {
                background: rgba(0, 0, 0, 0.8);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
                text-align: center;
                position: relative;
                transition: box-shadow 0.3s ease;
            }
            #divCabeçalho:hover {
                box-shadow: 0 0 40px rgba(0, 0, 255, 1);
            }
            #lblCracha {
                font-size: 1.2em;
                text-shadow: 0 0 10px rgba(0, 0, 255, 0.5);
            }
            #txtCracha, #txtCrachas {
                background: rgba(255, 255, 255, 0.2);
                border: none;
                color: white;
                border-radius: 5px;
                width: 200px;
                padding: 10px;
                margin: 10px 0;
                font-size: 1em;
                text-align: center;
                transition: background 0.3s ease;
            }
            #txtCracha:focus, #txtCrachas:focus {
                background: rgba(255, 255, 255, 0.5);
            }
            #btnCracha {
                background: rgba(0, 151, 0, 0.8);
                padding: 10px;
                border: none;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(33, 1, 75, 0.5);
                width: 240px;
                color: white;
                cursor: pointer;
                font-size: 1.2em;
                transition: background 0.3s ease, transform 0.3s ease;
            }
            #btnCracha:hover {
                transform: translateY(-5px);
                background: rgba(1, 90, 1, 0.8);
            }
            #rodape {
                color: white;
                text-align: center;
                position: fixed;
                bottom: 0;
                left: 0;
                width: 100%;
                margin-bottom: 5px;
                text-shadow: 0 0 10px rgba(0, 0, 255, 0.5);
            }
            a {
                text-decoration: none;
                color: white;
                transition: color 0.3s ease;
            }
            a:hover {
                color: yellowgreen;
            }
        </style>
    </head>
    <body>
        <div class="stars">
            <script>
                for (let i = 0; i < 100; i++) {
                    let star = document.createElement("div");
                    star.className = "star";
                    star.style.left = Math.random() * 100 + "vw";
                    star.style.top = Math.random() * 100 + "vh";
                    star.style.animationDelay = Math.random() + "s";
                    document.body.appendChild(star);
                }
            </script>
        </div>
        <div id="divCabeçalho">
            <form action="cadastrando.jsp" method="POST">
                <label id="lblCracha">Saram: </label>
                <input type="text" name="cracha" id="txtCracha" placeholder="000"
                       value="<%=request.getParameter("cracha")%>" onclick="limparTexto()"><br>
                <label id="lblCracha">Senha: </label>
                <input type="password" name="senha" id="txtCrachas" placeholder="******"
                       value="<%=request.getParameter("senha")%>" onclick="limparTextos()"><br>
                <button type="submit" id="btnCracha" style="margin-top: 10px;">EXECUTAR</button><br>
            </form>
        </div>
        <script>
            function limparTexto() {
                var caixaDeTexto = document.getElementById("txtCracha");
                caixaDeTexto.value = "";
            }
            function limparTextos() {
                var caixaDeTextos = document.getElementById("txtCrachas");
                caixaDeTextos.value = "";
            }
        </script>
        <footer id="rodape">
            &copy; Desenvolvido por: CB BLM Luiz Gustavo <strong>VALVERDE</strong> de Carvalho
        </footer>
    </body>
</html>
