/*
 * Copyright (c) 2018. Visionario
 */

package controller;

import model.SignUpModel;
import security.PasswordHash;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;


@WebServlet("/registration")
public class Registration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstname,surname,email,password,hash,birthday,gender;

        firstname = req.getParameter("name");
        surname = req.getParameter("surname");
        email = req.getParameter("email");
        password = req.getParameter("password");
        birthday = req.getParameter("birthday");
        gender = req.getParameter("gender");

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        if(checkL(firstname) && checkL(surname) && checkL(password) && checkE(email)) {
            try {
                SignUpModel reg = new SignUpModel();
                hash = PasswordHash.createHash(password);
                if(reg.doSave(firstname, surname, email, hash, gender, Date.valueOf(birthday), (byte) 0))
                    out.println("{ \"title\": \"success\",\"response\": \"You'll need to confirm your email address before you can buy.\" }");
                else
                    out.println("{ \"title\": \"error\",\"response\": \"Email Address is Already Registered.\" }");

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else
            out.println("{ \"title\": \"error\",\"response\": \"one of the following fields is incorrect.\" }");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    private boolean checkE(String email){
        return email.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$");
    }

    private boolean checkL(String n){
        return n.length()>1;
    }

}
