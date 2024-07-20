<%-- 
    Document   : listarCadastrados
    Created on : 22 de abr. de 2024, 15:10:18
    Author     : Luiz Gustavo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DTO.silosDTO"%>
<%@page import="br.com.DAO.silosDAO"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta  charset=UTF-8" lang="pt-BR">
        <title>CADASTRADOS</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <style>
        body {
            background-image: linear-gradient(to right, rgb(50, 84, 112), rgb(155, 146, 146));
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }

        #divCabeçalho {
            background-color: rgb(2, 57, 102);
            padding: 28px;
            width: 100%;
            box-shadow: 3pt 3pt 5pt rgb(56, 55, 55);
            z-index: 1000;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #ulCabeçalho {
            list-style-type: none;
            text-align: center;
            color: white;
            padding: 0;
            margin-top: 20px;
        }

        #ulCabeçalho li {
            display: inline;
            padding: 0 20px;
        }

        .mn {
            text-decoration: none;
            color: white;
        }

        .mn:hover {
            color: yellowgreen;
        }

        #cautelar {
            background-color: darkcyan;
            border-radius: 7px;
            padding: 20px;
            box-shadow: 3pt 3pt 5pt rgb(56, 55, 55);
            z-index: 1000;
            margin-top: 100px;
        }

        #cautelarBTN {
            background-color: green;
            color: white;
            border-radius: 5px;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            box-shadow: 1pt 1pt 2pt rgb(56, 55, 55);
            transition: background-color 0.3s ease;
        }

        #cautelarBTN:hover {
            background-color: darkgreen;
        }

        .tabela {
            border-collapse: collapse;
            width: 70%;
            background-color: white;
            margin-top: 200px;
        }

        .tabela th, .tabela td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .tabela th {
            background-color: darkblue;
            color: white;
            position: sticky;
            top: 0;
        }

        .tabela tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .tabela tbody tr:hover {
            background-color: #ddd;
        }

        #toTopBtn {
            display: none;
            position: fixed;
            bottom: 20px;
            right: 30px;
            z-index: 99;
            border: none;
            outline: none;
            background-color: darkblue;
            color: white;
            cursor: pointer;
            padding: 15px;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        #toTopBtn:hover {
            background-color: darkcyan;
        }

        @media (max-width: 768px) {
            #divCabeçalho {
                padding: 20px;
            }

            #ulCabeçalho li {
                display: block;
                padding: 10px 0;
            }

            #cautelar {
                width: 90%;
                margin-top: 80px;
            }

            .tabela {
                width: 100%;
                margin-top: 10px;
            }
            .tabela {
                border-collapse: collapse;
                width: 70%;
                background-color: white;
                margin-top: 20px;
            }

            .tabela th, .tabela td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .tabela th {
                background-color: darkblue;
                color: white;
                position: sticky;
                top: 0;
            }

            .tabela tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .tabela tbody tr:hover {
                background-color: #ddd;
            }

            .acao-btns {
                display: flex;
                gap: 5px;
            }

            .acao-btns a {
                text-decoration: none;
                padding: 5px 10px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .acao-btns a:hover {
                background-color: #555;
                color: white;
            }
        }



    </style>
    <body>
        <header id="headerCabeçalho">
            <div id="divCabeçalho" >



                <nav id="navCabeçalho" >
                    <ul id="ulCabeçalho">
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/inicio.html"><i class="fas fa-home"></i> INÍCIO</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/itensCautelados.jsp"><i class="fas fa-tools"></i> CAUTELADOS</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cautelar.jsp"><i class="fas fa-wrench"></i> CAUTELAR</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/silos.html"><i class="fas fa-boxes"></i> ESTOQUE</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/login.html"><i class="fas fa-user-plus"></i> CADASTRO</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cadastrarCracha.jsp"><i class="fas fa-sign-out-alt"></i> SAIR</a></li>
                    </ul>
                </nav>

            </div>
        </header>



        <table style="position: absolute;" class="tabela" border="1">
            <thead id="teste">
                <tr>
                    <th style="width: 35px;">ID</th>
                    <th  >SARAM</th>
                    <th  >NOME DE GUERRA</th>
                    <th style="width: 60px;"></th>

                </tr>
            </thead>

            <tbody>
                <%
                    try {
                        silosDAO objSilosDAO = new silosDAO();
                        ArrayList<silosDTO> lista = objSilosDAO.PesquisarCadastrados();

                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<tr>");
                            out.print("<td>" + lista.get(num).getId_cracha() + "</td>");
                            out.print("<td>" + lista.get(num).getCracha() + "</td>");
                            out.print("<td>" + lista.get(num).getNome() + "</td>");
                %>
            <td class="acao-btns">
                <a style="text-decoration:none;" href='excluirCadastrados.jsp?id-cracha=<%= lista.get(num).getId_cracha()%>&cracha=<%= lista.get(num).getCracha()%>&nome=<%= lista.get(num).getNome()%>'><i class="fas fa-trash-alt"></i></a>
                <a style="text-decoration:none; margin-left:10px;" href='#?id-cracha=<%= lista.get(num).getId_cracha()%>&cracha=<%= lista.get(num).getCracha()%>&nome=<%= lista.get(num).getNome()%>'><i class="fas fa-edit"></i></a>
            </td>
        </tr>
    </tbody>
    <%
        }
    } catch (Exception e) {
    %>
    <script>window.alert("[Erro]: listarCadastrados");</script>
    <%
        }
    %>

</body>
</html>
