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
    <title>Tabela Geral de Perguntas</title>
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

        img {
            width: 150px;
            height: auto;
            margin-bottom: 2rem;
            border-radius: 8px;
        }

        h1 {
            color: #58A6FF;
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .menu {
            background-color: #2C2C2C;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 2rem;
            text-align: center;
            width: 100%;
            max-width: 600px;
        }

        .menu a {
            display: block;
            color: #58A6FF;
            text-decoration: none;
            font-size: 1.2rem;
            margin: 1rem 0;
            padding: 0.5rem;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .menu a:hover {
            background-color: #58A6FF;
            color: #1A1A1A;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            background-color: #2C2C2C;
            color: #F0F0F0;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #444;
        }

        th {
            background-color: #58A6FF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #333;
        }

        .footer {
            margin-top: 2rem;
            color: #F0F0F0;
        }

        a {
            color: #58A6FF;
            text-decoration: none;
            font-size: 1rem;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Tabela Geral de Perguntas</h1>
        <%
        // Select "Geral"
        QuestionDAO questDAO = new QuestionDAO();
        List<Question> lista = questDAO.consQuestLista();

        int n_reg = 0;
        %>
        <table>
            <tr>
                <th>#</th>
                <th>Id.</th>
                <th>Data</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Pergunta</th>
                <th>Prioridade</th>
                <th>Preço Total</th>
                <th>Resposta</th>
            </tr>
        <%
        for (int i = 0; i < lista.size(); i++) {
        %>
            <tr>
                <td><%= n_reg + 1 %> </td>
                <td><%= lista.get(i).getId() %> </td>
                <td><%= lista.get(i).getDt_question() %> </td>
                <td><%= lista.get(i).getNome() %></td>
                <td><%= lista.get(i).getEmail() %></td>
                <td><%= lista.get(i).getQuestion() %></td>
                <td><%= lista.get(i).getPriority_box() %></td>
                <td><%= lista.get(i).getTotal_price() %></td>
                <td><%= lista.get(i).getResponse() %></td>
            </tr>
        <%
            n_reg++;
        }
        %>
        </table>
        <div class="footer">
            <p><b>Registros: </b><%= n_reg %></p>
        </div>
</body>
</html>
