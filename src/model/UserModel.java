/*
 * Copyright (c) 2018. Visionario
 */

package model;

import config.Ds;
import model.bean.SignInBean;

import java.sql.*;

public class UserModel {

    public SignInBean doRetrieveByMail(String mail) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        SignInBean user = new SignInBean();

        try {
            preparedStatement = conn.prepareStatement(Query.signInByMail);
            preparedStatement.setString(1,mail);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                user.setId(rs.getLong("id"));
                user.setPassword(rs.getString("password"));
                user.setPermission(rs.getBoolean("permission"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return user;
    }

    public boolean doSave(String name, String surname, String email, String password, String sex, Date date, byte permission) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;

        try{
            preparedStatement = conn.prepareStatement(Query.signup);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,surname);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,password);
            preparedStatement.setString(5,sex);
            preparedStatement.setDate(6, date);
            preparedStatement.setByte(7,permission);

            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        preparedStatement.close();
        conn.close();
        return true;
    }
}
