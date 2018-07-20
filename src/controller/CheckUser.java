/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */

package controller;
import model.UserModel;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class CheckUser {
        private long idUser;
        private boolean permission;

        protected CheckUser(HttpSession session) {
            try {
                 this.idUser = (long) session.getAttribute("userId");
                 this.permission = (boolean) session.getAttribute("permission");
            }catch(Exception e){
                session.setAttribute("userId",null);
                session.setAttribute("permission", false);
            }
        }

    protected boolean verify(){
            try {
                if(this.idUser == new UserModel().doRetrieveById(this.idUser).getId())
                    return true;
            } catch (SQLException e) {
                return false;
            }
            return false;
        }

    protected long getIdUser() {
            return idUser;
        }

    protected boolean isPermission() {
            return permission;
        }
}
