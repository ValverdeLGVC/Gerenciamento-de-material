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
        <title>SILOS-ESTOQUE</title>
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
                color: white;
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
                padding: 8px 16px;
                cursor: pointer;
                box-shadow: 1pt 1pt 2pt rgb(56, 55, 55);
                transition: background-color 0.3s ease;
                text-decoration: none;
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
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cautelar.jsp"><i class="fas fa-wrench"></i> CAUTELAR</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/silos.html"><i class="fas fa-boxes"></i> ESTOQUE</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/login.html"><i class="fas fa-user-plus"></i> CADASTRO</a></li>
                        <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cadastrarCracha.jsp"><i class="fas fa-sign-out-alt"></i> SAIR</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <table class="tabela" border="1">
            <thead id="teste">
                <tr>
                    <th style="width: 60px;">ID</th>
                    <th>NOMENCLATURA</th>
                    <th>P/N</th>
                    <th>S/N</th>
                    <th>LOCALIZAÇÃO</th>
                    <th style="width: 60px;">QTD.</th>
                    <th style="width: 60px;"></th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        silosDAO objSilosDAO = new silosDAO();
                        ArrayList<silosDTO> lista = objSilosDAO.PesquisarFerramentas();

                        for (int num = 0; num < lista.size(); num++) {
                            out.print("<tr  style='color: black;'>");
                            out.print("<td>" + lista.get(num).getID() + "</td>");
                            out.print("<td>" + lista.get(num).getNomenclatura() + "</td>");
                            out.print("<td>" + lista.get(num).getPN() + "</td>");
                            out.print("<td>" + lista.get(num).getSN() + "</td>");
                            out.print("<td>" + lista.get(num).getLocalizacao() + "</td>");
                            out.print("<td>" + lista.get(num).getCalibravel() + "</td>");
                %>
            <td class="acao-btns">
                <a href='excluirFerramentas.jsp?id=<%= lista.get(num).getID()%>&nomenclatura=<%= lista.get(num).getNomenclatura()%>&pn=<%= lista.get(num).getPN()%>&sn=<%= lista.get(num).getSN()%>&localizacao=<%= lista.get(num).getLocalizacao()%>&calibravel=<%= lista.get(num).getCalibravel()%>'><i class="fas fa-trash-alt"></i></a>
                <a href='editarFerramentas.jsp?id=<%= lista.get(num).getID()%>&nomenclatura=<%= lista.get(num).getNomenclatura()%>&pn=<%= lista.get(num).getPN()%>&sn=<%= lista.get(num).getSN()%>&localizacao=<%= lista.get(num).getLocalizacao()%>&calibravel=<%= lista.get(num).getCalibravel()%>'><i class="fas fa-edit"></i></a>
            </td>
            <%
                        out.print("</tr>");
                    }
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "[Erro]: listarFerramentas", "Erro", JOptionPane.ERROR_MESSAGE);
                }
            %>
        </tbody>
    </table>

    <button id="toTopBtn"><i class="fas fa-arrow-up"></i></button>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
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
        });
    </script>

</body>
</html>
