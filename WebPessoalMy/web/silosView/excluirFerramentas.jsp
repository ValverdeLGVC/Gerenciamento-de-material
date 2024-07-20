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
            body{
                background-image: linear-gradient(to right, rgb(79, 79, 139), rgb(179, 185, 194));
            }
            #deletar{
                background-color: rgb(13, 47, 90);
                padding: 30px;
                text-align: left;
                border-radius: 10px;
                color: white;
                width: 180px;
                top: 50%;
                left: 50%;
                transform: translate(330%, 30%);
            }
            .lblCerteza{
                text-align: left;
                color:white;
                font-size: larger;
            }
            #btnExcluir{
                background-color: red;
                color:white;
                width: 177px;
                border: none;
                border-radius:3px;
                height: 30px;
                box-shadow:3pt 3pt 5pt rgb(1, 18, 66);
                cursor: pointer;
            }
            #btnExcluir:hover{
                background-color: green;
            }
            #lista{
                text-decoration: none;
                color:white;
            }
            #lista:hover{
                color:greenyellow;
            }
            
        </style>
    </head>
    <body>
        <div id="deletar">
            <label class="lblCerteza"><strong>VOCÊ QUER REALMENTE EXCLUIR:</strong></label><br><br>
            <form action="excluirItens.jsp" method="POST">
            
                <label>ID: </label><br>
                <input type="text" name="id" placeholder="Nº" 
                       value="<%=request.getParameter("id") %>"><br><br>
            
                <label>Nomenclatura: </label><br>
                <input type="text" name="nomenclatura" 
                       value="<%=request.getParameter("nomenclatura") %>"><br><br>
                <label>P/N: </label><br>
                <input type="text" name="pn" 
                       value="<%=request.getParameter("pn") %>"><br><br>
                <label>S/N: </label><br>
                <input type="text" name="sn"
                       value="<%=request.getParameter("sn") %>"><br><br>
                <label>Localização: </label><br>
                <input type="text" name="localizacao"
                       value="<%=request.getParameter("localizacao") %>"><br><br>
                <label>Quantidade: </label><br>
                <input type="text" name="calibravel" 
                       value="<%=request.getParameter("calibravel") %>"><br><br>
                <button type="submit" id="btnExcluir">SIM</button><br><br><a id="lista" href="http://localhost:8080/SILOS/silosView/listarFerramentas.jsp">NÃO</a>
            </form>
        </div>
        
    </body>
</html>
