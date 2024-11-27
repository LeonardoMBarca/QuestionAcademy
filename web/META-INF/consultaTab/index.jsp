<%-- 
    Document   : index
    Created on : 28 de out. de 2024, 21:11:41
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa - Consulta Geral</title>
    </head>
    <body>
        <h1>Pesquisa - Geral (Modo Tabela)</h1>        
        <%                    
            //Select "Geral"

            PesquisaDAO pesqDAO = new PesquisaDAO();
            
            List<Pesquisa> lista = new ArrayList<>();
            lista = pesqDAO.consPesqLista();
            
            int n_reg = 0 ;
            out.println("<br> <b>Pesquisa de Satisfação</b>");
            
        %>    
        <table style="width: 100%"; border="1">
            <tr>
                <th>#</th>
                <th>Id.</th>
                <th>Data</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Resp 1</th>
                <th>Resp 2</th>
                <th>Resp 3</th>
                <th>Resp 4</th>
            </tr>                          
            
        <%   
            for( int i = 0; i <= lista.size()-1; i++){                
                //Minha tabela - DT/TR/...
        %>        
            <tr>
                <td><%= n_reg+1 %> </td>
                <td><%= lista.get(i).getId() %> </td>
                <td><%= lista.get(i).getDt_pesq() %> </td>
                <td><%= lista.get(i).getNome()%></td>
                <td><%= lista.get(i).getEmail()%></td>
                <td><%= lista.get(i).getQ1()%></td>
                <td><%= lista.get(i).getQ2()%></td>
                <td><%= lista.get(i).getQ3()%></td>
                <td><%= lista.get(i).getQ4()%></td>
            </tr>                                                 
        <%
                n_reg++;                           
            }
        %>
        </table>
        <%                                                     
            out.println("<b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");  
        %>
        
        
    </body>
</html>
