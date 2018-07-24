/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package controller;

import model.UserModel;
import model.bean.UserBean;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/login")
public class Login extends HttpServlet {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserModel userModel = new UserModel();
        UserBean user = null;
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        try {
            user =  userModel.doRetrieveByMail(email);
        } catch (SQLException e){
            e.printStackTrace();
        }
        if(user.getId()==0)
            out.println("{ \"title\": \"error\",\"response\": \"email not found\" }");
        else if(user.checkPassword(password)) {
            HttpSession session= req.getSession(true);          
            session.setAttribute("userId",user.getId());
            session.setAttribute("permission",user.getPermission());
            out.println("{ \"title\": \"success\", \"response\": \"Welcome\" }");
        }
        else
            out.println("{ \"title\": \"error\", \"response\": \"Password does not match\" }");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }
}