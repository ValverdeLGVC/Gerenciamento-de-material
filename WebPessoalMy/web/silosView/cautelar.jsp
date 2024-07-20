<%-- 
    Document   : listarFerramentas
    Created on : 25 de mar. de 2024, 13:58:34
    Author     : Lenovo
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="br.com.DTO.silosDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.silosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAUTELAR</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Estilos básicos */
            body {
                background: linear-gradient(to right, rgb(0, 10, 36), rgb(0, 61, 89));
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
                font-family: Arial, sans-serif;
            }

            #headerCabeçalho {
                width: 100%;
                background: rgba(0, 0, 0, 0.8);
                box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
                padding: 20px 0;

                top: 0;
                z-index: 1000;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            #divCabeçalho {
                background: rgba(0, 0, 0, 0.8);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
                text-align: center;
                position: relative;
                transition: box-shadow 0.3s ease;
                margin-top: 10px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            #divCabeçalho:hover {
                box-shadow: 0 0 40px rgba(0, 0, 255, 1);
            }
            #ulCabeçalho {

                list-style-type: none;
                text-align: center;
                color: white;
                padding: 0;
                margin-top: 0;
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
                background-color: rgb(13, 47, 90);
                border-radius: 7px;
                padding: 20px;
                box-shadow: 0 0 20px rgba(0, 255, 0, 0.7);
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

            .clickable-row {
                cursor: pointer; /* Adiciona a mãozinha de seleção */
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

            .alert {
                display: none;
                position: fixed;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: orange;
                color: white;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 10000;
                transition: opacity 0.5s ease;
            }

            .alert.show {
                display: block;
                opacity: 1;
            }

            .alert.hide {
                opacity: 0;
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
            }
            .star {
                position: absolute;
                width: 2px;
                height: 2px;
                background: white;
                border-radius: 50%;
                animation: twinkle 2s infinite ease-in-out;
            }

        </style>
    </head>
    <body>
        <!-- Adiciona estrelas no fundo -->
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
        <header id="headerCabeçalho">
            <div id="divCabeçalho">

                <nav id="navCabeçalho">
                    <ul id="ulCabeçalho">
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/inicio.html"><i class="fas fa-home"></i> INÍCIO</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/itensCautelados.jsp"><i class="fas fa-tools"></i> CAUTELADOS</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/entrarNoCautelar.jsp"><i class="fas fa-wrench"></i> CAUTELAR</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/silos.html"><i class="fas fa-boxes"></i> ESTOQUE</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/login.html"><i class="fas fa-user-plus"></i> CADASTRO</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cadastrarCracha.jsp"><i class="fas fa-sign-out-alt"></i> SAIR</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div id="cautelar">
            <form id="cautelarForm" action="efutuarCautela.jsp" method="post">
                <label style="color: white;">Data de Concessão de Cautela:</label><br>
                <input type="text" placeholder="dd/mm/aaaa" id="data_cautela" name="data_cautela" style="width: 200px;" maxlength="10"><br><br>
                <label style="color: white;">Previsão da restituição de itens: </label><br>
                <input type="text" placeholder="dd/mm/aaaa" id="data_devolucao" name="data_devolucao" style="width: 200px;" maxlength="10"><br><br>
                <label style="color: white;">Ferramenta: </label><br>
                <input type="number" placeholder="ID - Ferramenta" id="id_ferramentas" name="id_ferramentas" style="width: 200px;"><br><br>
                <label style="color: white;">Login: </label><br>
                <input type="number" placeholder="ID - Login" id="id_login" name="id_login" style="width: 200px;"><br><br>
                <label style="color: white;">Senha: </label><br>
                <input type="password" placeholder="*****" id="senha" name="senha" style="width: 200px;"><br><br>
                <label style="color: white;">Qtd.: </label><br>
                <input type="number" placeholder="Quantidade - EX:01" id="qtd" name="qtd" style="width: 200px;"><br><br>
                <button type="submit" id="cautelarBTN" name="btnCautelar">CAUTELAR</button>
            </form>
        </div>

        <div class="alert" id="alertMessage">Datas estão inconsistentes. Reveja o período de concessão e devolução.</div>

        <table class="tabela" border="1">
            <thead id="teste">
                <tr>
                    <th style="width: 60px;">ID</th>
                    <th>NOMENCLATURA</th>
                    <th>P/N</th>
                    <th>S/N</th>
                    <th>LOCALIZAÇÃO</th>
                    <th style="width: 60px;">QTD.</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        silosDAO objSilosDAO = new silosDAO();
                        ArrayList<silosDTO> lista = objSilosDAO.PesquisarFerramentas();

                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<tr class='clickable-row' data-id='" + lista.get(num).getID() + "'>");
                            out.print("<td>" + lista.get(num).getID() + "</td>");
                            out.print("<td>" + lista.get(num).getNomenclatura() + "</td>");
                            out.print("<td>" + lista.get(num).getPN() + "</td>");
                            out.print("<td>" + lista.get(num).getSN() + "</td>");
                            out.print("<td>" + lista.get(num).getLocalizacao() + "</td>");
                            out.print("<td>" + lista.get(num).getCalibravel() + "</td>");
                            out.print("</tr>");
                        }
                    } catch (Exception e) {
                        JOptionPane.showMessageDialog(null, "[Erro]: silosDAO [efetuarCautela] - " + e.getMessage(), "Erro", JOptionPane.ERROR_MESSAGE);
                    }
                %>
            </tbody>
        </table>

        <button id="toTopBtn" title="Go to top"><i class="fas fa-arrow-up"></i></button>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const dateInputs = document.querySelectorAll("#data_cautela, #data_devolucao");

                dateInputs.forEach(dateInput => {
                    dateInput.addEventListener("input", function () {
                        let value = dateInput.value;

                        // Remove todos os caracteres não numéricos
                        value = value.replace(/\D/g, "");

                        // Adiciona '/' nas posições apropriadas
                        if (value.length >= 3 && value.length <= 4) {
                            value = value.slice(0, 2) + '/' + value.slice(2);
                        } else if (value.length > 4) {
                            value = value.slice(0, 2) + '/' + value.slice(2, 4) + '/' + value.slice(4, 8);
                        }

                        // Define o valor formatado de volta no input
                        dateInput.value = value;
                    });
                });

                // Botão "Ir ao topo"
                const toTopBtn = document.getElementById("toTopBtn");

                window.onscroll = function () {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                        toTopBtn.style.display = "block";
                    } else {
                        toTopBtn.style.display = "none";
                    }
                };

                toTopBtn.addEventListener("click", function () {
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                });

                // Adiciona evento de clique para as linhas da tabela
                document.querySelectorAll('.clickable-row').forEach(row => {
                    row.addEventListener('click', function () {
                        const id = this.getAttribute('data-id');
                        document.getElementById('id_ferramentas').value = id;
                    });
                });

                // Verificação de datas no envio do formulário
                document.getElementById("cautelarForm").addEventListener("submit", function (event) {
                    const dataCautela = document.getElementById("data_cautela").value;
                    const dataDevolucao = document.getElementById("data_devolucao").value;

                    const [diaCautela, mesCautela, anoCautela] = dataCautela.split("/").map(Number);
                    const [diaDevolucao, mesDevolucao, anoDevolucao] = dataDevolucao.split("/").map(Number);

                    const dataCautelaDate = new Date(anoCautela, mesCautela - 1, diaCautela);
                    const dataDevolucaoDate = new Date(anoDevolucao, mesDevolucao - 1, diaDevolucao);

                    if (dataCautelaDate > dataDevolucaoDate) {
                        event.preventDefault();
                        showAlert("Datas estão inconsistentes. Reveja o período de concessão e devolução.");
                    }
                });

                function showAlert(message) {
                    const alertBox = document.getElementById("alertMessage");
                    alertBox.textContent = message;
                    alertBox.classList.add("show");
                    alertBox.classList.remove("hide");

                    setTimeout(() => {
                        alertBox.classList.add("hide");
                        setTimeout(() => alertBox.classList.remove("show"), 500);
                    }, 3000);
                }
            });
        </script>
    </body>
</html>
