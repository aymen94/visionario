/*
 * Copyright (c) 2018. Visionario
 */

package controller;

import model.UserModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/admin/delete")
public class Delete extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        doPost(req, resp);    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String type;
        long id;
        try {
            if (!(new CheckUser(req.getSession()).isPermission()))
                return;
        }
        catch (Exception ex) {
          return;
        }
        type = req.getParameter("type");
        id = Long.parseLong(req.getParameter("id"));
        try {
            switch (type) {

                case   "usr": new UserModel().doDelete(id);
                              break;

                default:      break;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
