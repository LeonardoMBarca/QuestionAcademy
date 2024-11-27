/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import static java.lang.Class.forName;
import static java.lang.System.out;
import java.sql.*;
import static java.sql.DriverManager.getConnection;

/**
 *
 * @author alunocmc
 */
public class ConectDB {
    //Atrib.
    // N/A.
    
    //Métodos
    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao =null;
        try{
            forName("com.mysql.cj.jdbc.Driver");                 //database:loja  user   password
            conexao = getConnection("jdbc:mysql://localhost:3306/question_academy","root","");
            return conexao;
        }catch( SQLException ex){
            out.println("error: " + ex);
        }
        return conexao;
    }
}
