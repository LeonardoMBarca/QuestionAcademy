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
    <title>Resposta da Pergunta - Question Academy</title>
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
        }

        h1 {
            color: #58A6FF;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .form-container {
            background-color: #2C2C2C;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 2rem;
            text-align: center;
            width: 100%;
            max-width: 600px;
        }

        .form-container div {
            margin-bottom: 1rem;
        }

        .form-container b {
            color: #58A6FF;
            font-size: 1.2rem;
        }

        textarea, input[type="text"], input[type="email"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 0.8rem;
            margin: 0.5rem 0;
            border: 1px solid #58A6FF;
            border-radius: 5px;
            background-color: #333;
            color: #F0F0F0;
            font-size: 1rem;
        }

        textarea {
            height: 100px;
            resize: none;
        }

        input[type="submit"] {
            background-color: #58A6FF;
            color: #1A1A1A;
            border: none;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4F8CF9;
        }

        .message {
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
            text-align: center;
        }

        .success {
            background-color: #28a745;
            color: white;
        }

        .error {
            background-color: #dc3545;
            color: white;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <h1>Resposta Atualizada</h1>

    <div class="form-container">
        <%
            try {
                // Entrada - Receber os dados do formulário
                int id = Integer.parseInt(request.getParameter("ident"));
                String respo = request.getParameter("response");

                // Instância da classe Question e atribuição dos valores
                Question quest = new Question();
                quest.setId(id);
                quest.setResponse(respo);

                // Atualizar registro no banco de dados
                QuestionDAO questDAO = new QuestionDAO();
                if (questDAO.altResponse(quest)) {
        %>
            <div class="message success">
                <p><strong>Resposta ALTERADA com sucesso!</strong></p>
            </div>
        <%
                } else {
        %>
            <div class="message error">
                <p><strong>Erro! Resposta não ALTERADA!</strong></p>
            </div>
        <%
                }
            } catch (Exception e) {
        %>
            <div class="message error">
                <p><strong>Erro ao processar a requisição: <%= e.getMessage() %></strong></p>
            </div>
        <%
            }
        %>
    </div>

</body>
</html>
