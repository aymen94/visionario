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

        public CheckUser(HttpSession session) throws IllegalArgumentException{
            try {
                 this.idUser = (long) session.getAttribute("userId");
                 this.permission = (boolean) session.getAttribute("permission");
            }catch(Exception e){
                session.setAttribute("userId",null);
                session.setAttribute("permission", false);
                throw new IllegalArgumentException("Session corrupt or invalid");
            }
        }

        public boolean verify(){
            try {
                if(this.idUser == new UserModel().doRetrieveById(this.idUser).getId())
                    return true;
            } catch (SQLException e) {
                return false;
            }
            return false;
        }

        public long getIdUser() {
            return idUser;
        }

        public boolean isPermission() {
            return permission;
        }
}
