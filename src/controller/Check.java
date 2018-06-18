/*
 * Copyright (c) 2018. Visionario
 */

package controller;

import model.SignInModel;
import model.bean.SignInBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/check")
public class Check extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        SignInModel userModel = new SignInModel();
        SignInBean user = null;
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        try {
            user =  userModel.doRetrieveByMail(email);
        } catch (SQLException e){
            e.printStackTrace();
        }
        if(user.getPermission()==null)
            out.println("{ \"title\": \"error\",\"response\": \"email not found\" }");
        else if(user.checkPassword(password))
            out.println("{ \"title\": \"success\", \"response\": \"Welcome\" }");
        else
            out.println("{ \"title\": \"error\", \"response\": \"Password does not match\" }");
    }
}
