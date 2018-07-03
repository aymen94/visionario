/*
 * Copyright (c) 2018. Visionario
 */

package controller;

import model.UserModel;
import model.bean.UserBean;
import security.PasswordHash;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session= req.getSession();

        String oldpassword = req.getParameter("oldpassword");
        String password = req.getParameter("password");

        UserModel userModel = new UserModel();
        UserBean user = null;
        long id;
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        try {
            id = (long)session.getAttribute("userId");             
            user =  userModel.doRetrieveById(id);
            if(user==null)
                throw new Exception();
            if(user.checkPassword(oldpassword) && userModel.doUpdatePassword(id,PasswordHash.createHash(password)))
            {
                out.println("{ \"title\": \"success\", \"response\": \"Password updated\" }");
            }
            else
                out.println("{ \"title\": \"error\", \"response\": \"Wrong password\" }");
        } catch (Exception e){
            e.printStackTrace();
            out.println("{ \"title\": \"invalid\", \"response\": \"Internal error\" }");
            return;
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }
}