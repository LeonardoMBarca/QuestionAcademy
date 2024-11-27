/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author alunocmc
 */
public class Question {
    //Atrib
    private int  id;
    private String nome;
    private String email;
    private String question;
    private int priority_box;
    private double total_price;
    private String dt_question;
    private String response;
    
    //Métodos

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }

    public void setPriority_box(int priority_box) {
        this.priority_box = priority_box;
    }
    
    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public void setDt_question(String dt_question) {
        this.dt_question = dt_question;
    }
    
    public void setResponse(String response) {
        this.response = response;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getEmail() {
        return email;
    }
    
    public String getQuestion() {
        return question;
    }

    public int getPriority_box() {
        return priority_box;
    }

    public double getTotal_price() {
        return total_price;
    }

    public String getDt_question() {
        return dt_question;
    }
    
    public String getResponse() {
        return response;
    }
    
}
