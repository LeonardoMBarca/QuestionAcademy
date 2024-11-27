<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="model.dao.QuestionDAO"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pesquisa - Question Academy</title>
    <style>
        /* Reset de estilos */
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
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            text-align: center;
        }

        h1 {
            color: #58A6FF;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .message-container {
            background-color: #2C2C2C;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 2rem;
            text-align: center;
            width: 100%;
            max-width: 500px;
        }

        .success {
            color: #4CAF50;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .error {
            color: #FF4C4C;
            font-size: 1.2rem;
            font-weight: bold;
        }

        a {
            color: #58A6FF;
            text-decoration: none;
            margin-top: 1rem;
            display: inline-block;
        }

        a:hover {
            color: #4F8CF9;
        }
    </style>
</head>
<body>

    <h1>Resultado da Pesquisa</h1>

    <div class="message-container">
        <%
        try {
            // Entrada/Receber      
            int id = Integer.parseInt(request.getParameter("ident"));
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String question = request.getParameter("question");
            int priority_box = Integer.parseInt(request.getParameter("r2"));
            double total_price = Double.parseDouble(request.getParameter("total_price"));
            String dt_quest = request.getParameter("dt_quest");

            // Instância e atribuição de valores
            Question quest = new Question();
            quest.setId(id);
            quest.setNome(nome);
            quest.setEmail(email);
            quest.setQuestion(question);
            quest.setPriority_box(priority_box);
            quest.setTotal_price(total_price);
            quest.setDt_question(dt_quest);
            quest.setResponse(null);

            // Insert
            QuestionDAO pesqDAO = new QuestionDAO();
            if (pesqDAO.altQuest(quest)) {
        %>
                <p class="success">Registro ALTERADO com sucesso!</p>
        <%
            } else {
        %>
                <p class="error">Erro! Registro não ALTERADO!!!</p>
        <%
            }
        } catch (Exception e) {
        %>
            <p class="error">Erro ao processar a solicitação: <%= e.getMessage() %></p>
        <%
        }
        %>
    </div>

</body>
</html>
