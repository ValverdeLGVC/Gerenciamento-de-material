<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="br.com.DTO.silosDTO" %>
<%@ page import="br.com.DAO.silosDAO" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.io.IOException" %>
<%
    // Criação do objeto DTO
    silosDTO objSilosDTO = new silosDTO();

    // Formato da data
    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    // Obtém os parâmetros do formulário
    String dataCautelaValor = request.getParameter("data_cautela");
    String dataDevolucaoValor = request.getParameter("data_devolucao");
    String idFerramentasStr = request.getParameter("id_ferramentas");
    String idLoginStr = request.getParameter("id_login");
    String idSenha = request.getParameter("senha");
    String qtdStr = request.getParameter("qtd");

    // Verifica se todos os parâmetros necessários foram fornecidos
    if (dataCautelaValor != null && !dataCautelaValor.isEmpty()
            && dataDevolucaoValor != null && !dataDevolucaoValor.isEmpty()
            && idFerramentasStr != null && !idFerramentasStr.isEmpty()
            && idLoginStr != null && !idLoginStr.isEmpty()
            && idSenha != null && !idSenha.isEmpty()
            && qtdStr != null && !qtdStr.isEmpty()) {
        try {
            // Converte as datas para o formato apropriado
            Date dataCautela = dateFormat.parse(dataCautelaValor);
            Date dataDevolucao = dateFormat.parse(dataDevolucaoValor);

            // Converte o ID das ferramentas, o ID do login e a quantidade para int
            int idFerramentas = Integer.parseInt(idFerramentasStr);
            int idLogin = Integer.parseInt(idLoginStr);
            int qtd = Integer.parseInt(qtdStr);

            // Verifica se o login e a ferramenta existem e se a senha está correta
            silosDAO objSilosDAO = new silosDAO();
            boolean loginExiste = objSilosDAO.verificarLoginExistente(idLogin);
            boolean ferramentaExiste = objSilosDAO.verificarFerramentaExistente(idFerramentas);
            boolean senhaCorreta = objSilosDAO.verificarSenhaCorreta(idLogin, idSenha);

            if (!loginExiste || !ferramentaExiste || !senhaCorreta) {
%>
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
            window.location.href = "http://localhost:8080/SILOS/silosView/cautelar.jsp";
        };
    }

    // Exemplo de uso
    window.onload = function () {
        showCustomAlert('[ERRO]: Login, ferramenta ou senha incorretos, tente novamente!');
    };
</script>
<%
            } else {
                // Define as datas e IDs no objeto DTO
                objSilosDTO.setData_cautela(dataCautela);
                objSilosDTO.setData_devolucao(dataDevolucao);
                objSilosDTO.setId_ferramentas(idFerramentas);
                objSilosDTO.setId_login(idLogin);
                objSilosDTO.setQtd(qtd);  // Presumindo que exista um setter para qtd

                // Chama o método para efetuar a cautela
                objSilosDAO.efetuarCautela(objSilosDTO);
%>
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
        border: 2px solid green;
        border-radius: 5px;
        text-align: center;
        color: green;
    }

    .custom-alert-content p {
        margin: 0 0 20px;
    }

    .custom-alert-content button {
        background-color: green;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
    }

    .custom-alert-content button:hover {
        background-color: darkgreen;
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
            window.location.href = "http://localhost:8080/SILOS/silosView/cautelar.jsp";
        };
    }

    // Exemplo de uso
    window.onload = function () {
        showCustomAlert('Cautela efetuada com sucesso!');
    };
</script>
<%
            }
        } catch (ParseException | NumberFormatException | ClassNotFoundException e) {
            e.printStackTrace();
%>
<script>
    window.alert('[ERRO]: Ocorreu um erro durante o processamento, tente novamente!');
    window.location.href = "http://localhost:8080/SILOS/silosView/cautelar.jsp";
</script>
<%
        } catch (Exception e) {
            e.printStackTrace();
%>
<script>
    window.alert('[ERRO]: Ocorreu um erro inesperado, tente novamente!');
    window.location.href = "http://localhost:8080/SILOS/silosView/cautelar.jsp";
</script>
<%
        }
    } else {
%>
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
            window.location.href = "http://localhost:8080/SILOS/silosView/cautelar.jsp";
        };
    }

    // Exemplo de uso
    window.onload = function () {
        showCustomAlert('[ERRO]: Preencha todos os campos obrigatórios!');
    };
</script>
<%
    }
%>
