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
    <title>Question Academy - Alterar</title>
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

        input[type="text"], input[type="email"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 0.8rem;
            margin: 1rem 0;
            border: 1px solid #58A6FF;
            border-radius: 5px;
            background-color: #333;
            color: #F0F0F0;
            font-size: 1rem;
        }

        textarea {
            width: 100%;
            height: 100px;
            background-color: #333;
            border: 1px solid #58A6FF;
            padding: 0.8rem;
            color: #F0F0F0;
            font-family: 'Arial', sans-serif;
            font-size: 1rem;
            border-radius: 5px;
            resize: none;
            margin: 1rem 0;
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

        b {
            font-size: 1.2rem;
            color: #58A6FF;
        }

        #precoTotal {
            font-weight: bold;
            color: #58A6FF;
        }

    </style>
    <script>
        function calcularPreco() {
            const pergunta = document.querySelector('input[name="question"]').value;
            const prioridade = document.querySelector('input[name="r2"]:checked');

            if (!pergunta || !prioridade) {
                alert("Por favor, preencha todos os campos necessários.");
                return false; // Bloqueia o envio do formulário
            }

            // Calcular peso e prioridade
            const peso = pergunta.length < 100 ? 1.0 : (pergunta.length < 500 ? 1.5 : 2.0);
            const prioridadeValor = parseInt(prioridade.value) * 10;
            const total = peso * prioridadeValor;

            // Atualizar o campo oculto
            document.getElementById("totalPrice").value = total.toFixed(2);
            return true; // Permite o envio do formulário
        }

    </script>
</head>
<body>

    <h1>Alterar Pergunta</h1>

    <div class="form-container">
        <%           
        //Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Instância e atribuição de valor
            Question quest = new Question();
            quest.setId(id);
        
            // Select
            QuestionDAO pesqDAO = new QuestionDAO();
            if(pesqDAO.consQuestRegId(quest) != null){
            %>
                <br>
                <form method="post" action="updateQuestion.jsp" onsubmit="return calcularPreco();">
                Identificação: <input type="text" name="ident" value="<%= quest.getId()%>" readonly="true"> <p>                    
                Nome: <input type="text" name="nome" value="<%= quest.getNome()%>"> <p>
                E-mail: <input type="email" name="email" value ="<%= quest.getEmail() %>" > <p>           
                Pergunta: <br>            
                <input type="text" name="question" value="<%= quest.getQuestion() %>" id="question" required> <br> <br>                  
                Nível de Prioridade da Pergunta: <br> <br>
                <input type="radio" name="r2" value="1" required> 1
                <input type="radio" name="r2" value="2" required> 2
                <input type="radio" name="r2" value="3" required> 3
                <input type="radio" name="r2" value="4" required> 4
                <input type="radio" name="r2" value="5" required> 5
                <input type="radio" name="r2" value="6" required> 6
                <input type="radio" name="r2" value="7" required> 7
                <input type="radio" name="r2" value="8" required> 8
                <input type="radio" name="r2" value="9" required> 9
                <input type="radio" name="r2" value="10" required> 10
                <input type="hidden" id="totalPrice" name="total_price"><br><br>
                Data da Pergunta: <br>
                <input type="date" name="dt_quest" value="<%= quest.getDt_question() %>"></br>
                Resposta: <br> 
                <textarea name="response" readonly>
                    <%= quest.getResponse() != null ? quest.getResponse() : "Null" %>
                </textarea> <br> <br> 
                <input type="submit" value="Salvar!"> 
                </form>
            <%    
            }else{
               out.println("Registro não encontrado!!!");
            }
        %>
    </div>

</body>
</html>
