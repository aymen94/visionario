/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package controller;

import model.UserModel;
import security.PasswordHash;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet("/registration")
public class UserData extends HttpServlet {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String firstname,surname,email,password,hash,birthday,gender,update,permission;
        firstname = req.getParameter("name");
        surname = req.getParameter("surname");
        email = req.getParameter("email");
        password = req.getParameter("password");
        birthday = req.getParameter("birthday");
        gender = req.getParameter("gender");
        permission = req.getParameter("permission");
        update = req.getParameter("update");
        System.out.println(permission);

        try {
            if (!(new CheckUser(req.getSession()).isPermission()))
                permission = "0";
        }
        catch (Exception ex) {
            permission="0";
        }

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        if(checkL(firstname) && checkL(surname) && (update!=null || checkL(password)) && checkE(email)) {
            try {
                UserModel reg = new UserModel();
                if (update == null) {
                    hash = PasswordHash.createHash(password);
                    if (reg.doSave(firstname, surname, email, hash, gender, Date.valueOf(birthday),Byte.valueOf(permission)))
                        out.println(
                                "{ \"title\": \"success\",\"response\": \"You'll need to confirm your email address before you can buy.\" }");
                    else
                        out.println(
                                "{ \"title\": \"error\",\"response\": \"Email Address is Already Registered.\" }");
                } else {
                    HttpSession session = req.getSession();
                    long id = (long) session.getAttribute("userId");
                    if (reg.doUpdate(id, firstname, surname, email, gender, Date.valueOf(birthday), Byte.valueOf(permission)))
                        out.println(
                                "{ \"title\": \"success\",\"response\": \"Profile updated.\" }");
                    else
                        out.println(
                                "{ \"title\": \"error\",\"response\": \"Email Address is Already Registered.\" }");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("{ \"title\": \"error\",\"response\": \"Error.\" }");
            }
        }else
            out.println("{ \"title\": \"error\",\"response\": \"one of the following fields is incorrect.\" }");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req,resp);
    }

    private boolean checkE(String email){
        return email.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$");
    }

    private boolean checkL(String n){
        return n.length()>1;
    }

}
