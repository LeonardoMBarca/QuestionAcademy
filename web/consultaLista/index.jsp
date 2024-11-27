<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="model.dao.QuestionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Academy Perguntas</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #1A1A1A;
            color: #F0F0F0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 2rem;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background-color: #2C2C2C;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        h1 {
            font-size: 2rem;
            color: #58A6FF;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .record {
            border-bottom: 1px solid #444;
            padding: 1rem 0;
            margin-bottom: 1rem;
        }

        .record:last-child {
            border-bottom: none;
        }

        .record p {
            margin: 0.5rem 0;
        }

        .summary {
            margin-top: 2rem;
            font-weight: bold;
            text-align: center;
            color: #58A6FF;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registro de Perguntas</h1>
        <%
            QuestionDAO questDAO = new QuestionDAO();
            List<Question> lista = questDAO.consQuestLista();

            int n_reg = 0;
            for (int i = 0; i < lista.size(); i++) {
        %>
        <div class="record">
            <p><strong>ID:</strong> <%= lista.get(i).getId() %></p>
            <p><strong>Data:</strong> <%= lista.get(i).getDt_question() %></p>
            <p><strong>Nome:</strong> <%= lista.get(i).getNome() %></p>
            <p><strong>E-mail:</strong> <%= lista.get(i).getEmail() %></p>
            <p><strong>Pergunta:</strong> <%= lista.get(i).getQuestion() %></p>
            <p><strong>Nível de Prioridade:</strong> <%= lista.get(i).getPriority_box() %></p>
            <p><strong>Preço Total:</strong> R$ <%= lista.get(i).getTotal_price() %></p>
            <p><strong>Resposta:</strong> <%= lista.get(i).getResponse() %></p>
        </div>
        <%
                n_reg++;
            }
        %>
        <p class="summary">Total de Perguntas: <%= n_reg %></p>
    </div>
</body>
</html>
