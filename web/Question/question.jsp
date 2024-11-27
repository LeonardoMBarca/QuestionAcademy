<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="model.dao.QuestionDAO"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Pergunta</title>
    <style>
        /* Estilos básicos */
        body {
            font-family: Arial, sans-serif;
            background-color: #1A1A1A;
            color: #F0F0F0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        h1 {
            font-size: 2rem;
            color: #58A6FF;
            margin-bottom: 2rem;
        }

        .message {
            background-color: #2C2C2C;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 600px;
            text-align: center;
        }

        .success {
            color: #4CAF50;
            font-size: 1.5rem;
        }

        .error {
            color: #FF4C4C;
            font-size: 1.5rem;
        }
    </style>
</head>
<body>
    <h1>Cadastro de Pergunta</h1>
    <div class="message">
        <%
        try {
            // Receber dados do formulário
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String question = request.getParameter("question");
            int r1 = Integer.parseInt(request.getParameter("r1"));
            double total_price = Double.parseDouble(request.getParameter("total_price"));

            // Instanciar e atribuir valores
            Question quest = new Question();
            quest.setNome(nome);
            quest.setEmail(email);
            quest.setQuestion(question);
            quest.setPriority_box(r1);
            quest.setTotal_price(total_price);
            quest.setDt_question(new SimpleDateFormat("yyyy/MM/dd").format(new Date()));
            quest.setResponse(null);

            // Inserir no banco de dados
            QuestionDAO questDAO = new QuestionDAO();
            if (questDAO.insQuest(quest)) {
                out.println("<p class='success'>Pergunta enviada com sucesso!</p>");
            } else {
                out.println("<p class='error'>Erro! Pergunta não enviada!!!</p>");
            }
        } catch (Exception e) {
            out.println("<p class='error'>Erro ao processar a requisição: " + e.getMessage() + "</p>");
        }
        %>
    </div>
</body>
</html>
