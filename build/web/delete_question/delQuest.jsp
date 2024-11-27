<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="model.dao.QuestionDAO"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exclusão de Pergunta</title>
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
            max-width: 500px;
        }

        input[type="number"] {
            width: 100%;
            padding: 0.8rem;
            margin: 1rem 0;
            border: 1px solid #58A6FF;
            border-radius: 5px;
            background-color: #333;
            color: #F0F0F0;
            font-size: 1rem;
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
            margin-top: 1rem;
            font-size: 1.2rem;
            padding: 0.8rem;
            border-radius: 5px;
        }

        .success {
            background-color: #28a745;
            color: white;
        }

        .error {
            background-color: #dc3545;
            color: white;
        }

        .info {
            background-color: #17a2b8;
            color: white;
        }
    </style>
</head>
<body>

    <h1>Exclusão de Pergunta</h1>

    <div class="form-container">
        <form method="post" action="delQuest.jsp">
            <label for="id">Identificação:</label>
            <input type="number" id="id" name="id" required placeholder="Digite o ID da pergunta">
            <input type="submit" value="Excluir!">
        </form>

        <%
        // Recebe o ID da questão
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Instancia e atribui valor ao objeto Question
        Question pesq = new Question();
        pesq.setId(id); 
        
        // Instancia o QuestionDAO e verifica se a questão existe
        QuestionDAO pesqDAO = new QuestionDAO();
        if (pesqDAO.exists(pesq)) { // Verifica se a questão existe
            if (pesqDAO.delQuest(pesq)) {
                out.println("<div class='message success'>Registro excluído com sucesso!</div>");
            } else {
                out.println("<div class='message error'>Erro! Registro não excluído!!!</div>");
            }
        } else {
            out.println("<div class='message info'>ID não registrado.</div>");
        }
        %>
    </div>

</body>
</html>
