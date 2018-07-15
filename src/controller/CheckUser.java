/*
 * Copyright (c) 2018. Visionario
 */

package controller;
import model.UserModel;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class CheckUser {
        private long idUser;
        private boolean permission;

        protected CheckUser(HttpSession session) throws IllegalArgumentException{
            try {
                 this.idUser = (long) session.getAttribute("userId");
                 this.permission = (boolean) session.getAttribute("permission");
            }catch(Exception e){
                session.setAttribute("userId",null);
                session.setAttribute("permission", false);
                throw new IllegalArgumentException("Session corrupt or invalid");
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
