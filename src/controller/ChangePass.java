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

@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            CheckUser check=new CheckUser(session);
          
            if(!check.verify())
                throw new Exception();
            else {
                id=check.getIdUser();
                user=userModel.doRetrieveById(id);
            }
            if(user.checkPassword(oldpassword) && userModel.doUpdatePassword(id,PasswordHash.createHash(password)))
            {
                out.println("{ \"title\": \"success\", \"response\": \"Password updated\" }");
            }
            else
                out.println("{ \"title\": \"error\", \"response\": \"Wrong password\" }");
        } catch (Exception e){
            e.printStackTrace();
            session.setAttribute("userId",null);
            session.setAttribute("permission", false);
            out.println("{ \"title\": \"invalid\", \"response\": \"Internal error\" }");
            return;
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }
}