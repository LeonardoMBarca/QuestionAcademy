<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="model.dao.QuestionDAO"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Academy Consultar</title>
    <style>
        /* Estilos Gerais */
        body {
            font-family: Arial, sans-serif;
            background-color: #1A1A1A;
            color: #F0F0F0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #2C2C2C;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            width: 100%;
        }

        h1 {
            text-align: center;
            color: #58A6FF;
            margin-bottom: 1rem;
        }

        .record {
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .not-found {
            color: #FF4C4C;
            font-size: 1.3rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Perguntas Registro</h1>
        <div class="record">
            <%
            try {
                // Entrada/Receber
                int id = Integer.parseInt(request.getParameter("id"));

                // Instância e atribuição de valor
                Question quest = new Question();
                quest.setId(id);

                // Select
                QuestionDAO pesqDAO = new QuestionDAO();
                if (pesqDAO.consQuestRegId(quest) != null) {
            %>
                <p><b>Pergunta</b></p>
                <p><b>Data:</b> <%= quest.getDt_question() %></p>
                <p><b>Nome:</b> <%= quest.getNome() %></p>
                <p><b>E-mail:</b> <%= quest.getEmail() %></p>
                <p><b>Pergunta:</b> <%= quest.getQuestion() %></p>
                <p><b>Nível de Prioridade:</b> <%= quest.getPriority_box() %></p>
                <p><b>Preço Total:</b> <%= quest.getTotal_price() %></p>
                <p><b>Resposta:</b> <%= quest.getResponse() %></p>
            <%
                } else {
            %>
                <p class="not-found">Registro não encontrado!!!</p>
            <%
                }
            } catch (Exception e) {
                out.println("<p class='not-found'>Erro ao buscar registro: " + e.getMessage() + "</p>");
            }
            %>
        </div>
    </div>
</body>
</html>
