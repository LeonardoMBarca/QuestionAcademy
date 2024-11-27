<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="model.dao.QuestionDAO"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Academy - Responder</title>
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
    </style>
</head>
<body>

    <h1>Responder Pergunta</h1>

    <div class="form-container">
        <%
            // Entrada - Receber ID
            int id = Integer.parseInt(request.getParameter("id"));

            // Instância da classe Question
            Question quest = new Question();
            quest.setId(id);

            // Buscar dados no banco
            QuestionDAO questDAO = new QuestionDAO();
            if (questDAO.consQuestRegId(quest) != null) {
        %>
                <form method="post" action="updateResponse.jsp">
                    <div>
                        <b>ID:</b>
                        <input type="text" name="ident" value="<%= quest.getId() %>" readonly>
                    </div>
                    <div>
                        <b>Nome:</b>
                        <input type="text" name="nome" value="<%= quest.getNome() %>" readonly>
                    </div>
                    <div>
                        <b>Email:</b>
                        <input type="email" name="email" value="<%= quest.getEmail() %>" readonly>
                    </div>
                    <div>
                        <b>Pergunta:</b>
                        <textarea name="question" readonly><%= quest.getQuestion() %></textarea>
                    </div>
                    <div>
                        <b>Nível de Prioridade:</b>
                        <input type="number" name="priority_box" value="<%= quest.getPriority_box() %>" readonly>
                    </div>
                    <div>
                        <b>Total Price:</b>
                        <input type="text" name="total_price" value="<%= quest.getTotal_price() %>" readonly>
                    </div>
                    <div>
                        <b>Data da Pergunta:</b>
                        <input type="text" name="dt_quest" value="<%= quest.getDt_question() %>" readonly>
                    </div>
                    <div>
                        <b>Resposta:</b>
                        <textarea name="response" required><%= quest.getResponse() != null ? quest.getResponse() : "" %></textarea>
                    </div>
                    <input type="submit" value="Salvar Resposta">
                </form>
        <%
            } else {
                out.println("<p>Registro não encontrado!</p>");
            }
        %>
    </div>

</body>
</html>
