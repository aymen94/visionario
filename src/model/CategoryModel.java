package model;

import config.Ds;
import model.bean.CategoryBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryModel {

    public synchronized CategoryBean doRetrieveByKey(short code) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        CategoryBean bean = new CategoryBean();
        try {
            preparedStatement = conn.prepareStatement(Query.category);
            preparedStatement.setInt(1,code);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                bean.setId(rs.getShort("id"));
                bean.setName(rs.getString("name"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return bean;
    }

}
