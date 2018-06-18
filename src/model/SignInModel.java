package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.Ds;
import model.bean.SignInBean;

public class SignInModel{



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
}
