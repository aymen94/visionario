/*
 * Copyright (c) 2018. Visionario
 */

package model;

import config.Ds;
import java.sql.*;

public class SignUpModel {

    public boolean doSave(String name, String surname,String email,String password, String sex,Date date,byte permission) throws SQLException {
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
