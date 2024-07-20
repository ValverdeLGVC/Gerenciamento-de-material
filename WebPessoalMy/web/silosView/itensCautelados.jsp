<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="br.com.DTO.silosDTO" %>
<%@ page import="br.com.DAO.silosDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Itens Cautelados</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos globais */
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, rgb(0, 10, 36), rgb(0, 61, 89));
            color: white;
            overflow-x: hidden;
            position: relative;
        }

        /* Estilos de estrelas animadas */
        .star {
            position: absolute;
            width: 2px;
            height: 2px;
            background: white;
            border-radius: 50%;
            animation: twinkle 2s infinite ease-in-out;
        }

        @keyframes twinkle {
            0%, 100% { opacity: 0.5; }
            50% { opacity: 1; }
        }

        /* Estilos do cabeçalho */
        #headerCabecalho {
            width: 100%;
            background: rgba(0, 0, 0, 0.8);
            box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
            padding: 20px 0;
            position: fixed;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #divCabecalho {
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
            text-align: center;
            position: relative;
            transition: box-shadow 0.3s ease;
            margin-top: 10px;
        }

        #divCabecalho:hover {
            box-shadow: 0 0 40px rgba(0, 0, 255, 1);
        }

        #ulCabecalho {
            list-style-type: none;
            text-align: center;
            color: white;
            padding: 0;
            margin-top: 0;
        }

        #ulCabecalho li {
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

        /* Estilos da seção principal */
        #cautelar {
            background-color: rgba(0, 151, 0, 0.8);
            border-radius: 7px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 255, 0.5);
            margin-top: 10px;
            transition: background-color 0.3s ease;
            width: 70%;
            max-width: 800px;
        }

        #cautelar:hover {
            background-color: rgba(1, 90, 1, 0.8);
        }

        .tabela {
            border-collapse: collapse;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            margin-top: 0px;
            box-shadow: 0 0 10px rgba(0, 0, 255, 0.5);
        }

        .tabela th, .tabela td {
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 10px;
            text-align: center;
        }

        .tabela th {
            background-color: rgba(0, 0, 255, 0.5);
        }

        .tabela tbody tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .tabela tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .mensagem {
            margin-top: 0px; /* Ajuste a margem conforme necessário */
            text-align: center;
        }
      
    </style>
</head>
<body>
<header id="headerCabecalho">
    <div id="divCabecalho">
        <nav id="navCabecalho">
            <ul id="ulCabecalho">
                <li><a class="mn" href="http://localhost:8080/SILOS/silosView/inicio.html"><i class="fas fa-home"></i> INÍCIO</a></li>
                    <li><a class="mn" href="http://localhost:8080/SILOS/silosView/itensCautelados.jsp"><i class="fas fa-tools"></i> CAUTELADOS</a></li>
                    <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cautelar.jsp"><i class="fas fa-wrench"></i> CAUTELAR</a></li>
                    <li><a class="mn" href="http://localhost:8080/SILOS/silosView/silos.html"><i class="fas fa-boxes"></i> ESTOQUE</a></li>
                    <li><a class="mn" href="http://localhost:8080/SILOS/silosView/login.html"><i class="fas fa-user-plus"></i> CADASTRO</a></li>
                    <li><a class="mn" href="http://localhost:8080/SILOS/silosView/cadastrarCracha.jsp"><i class="fas fa-sign-out-alt"></i> SAIR</a></li>
            </ul>
        </nav>
    </div>
</header><br> <br> <br> <br> <br> <br> <br> <br> <br>

<div id="cautelar">
    <%
        try {
            silosDAO objSilosDAO = new silosDAO();
            ArrayList<silosDTO> lista = objSilosDAO.pesquisarItensEmprestados();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            if (lista.isEmpty()) {
        %>
       
       
            <div class="mensagem">
                <p>Não temos nenhum empréstimo!</p>
            </div>
        <%
            } else {
        %>
            <table class="tabela">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nomenclatura</th>
                    <th>SARAM</th>
                    <th>Qtd.</th>
                    <th>Nome da Pessoa</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (silosDTO item : lista) {
                %>
                
                
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getNomenclatura()%></td>
                    <td><%= item.getCracha()%></td>
                    <td><%= item.getQtd()%></td>
                    <td><%= item.getNome()%></td>
                    <td class="acoes">
                        <a href="excluirCautelas.jsp?id=<%= item.getId()%>&nomenclatura=<%= item.getNomenclatura()%>&cracha=<%= item.getCracha()%>" style="text-decoration:none;">
                            <i style="color: white;" class="fas fa-trash-alt"></i>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        <%
            }
        } catch (Exception e) {
            out.print("Erro: " + e);
        }
    %>
</div>

<script>
    // Adicionar estrelas animadas ao fundo
    const numStars = 100;
    for (let i = 0; i < numStars; i++) {
        const star = document.createElement('div');
        star.className = 'star';
        star.style.top = Math.random() * 100 + '%';
        star.style.left = Math.random() * 100 + '%';
        star.style.animationDelay = Math.random() * 2 + 's';
        document.body.appendChild(star);
    }
</script>

</body>
</html>
