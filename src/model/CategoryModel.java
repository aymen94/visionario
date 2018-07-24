/*
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model;

import config.Ds;
import model.bean.CategoryBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

    public synchronized ArrayList<CategoryBean> doSearch(String search, char gender, String[] size, String[] color) throws SQLException {
        int countSize=0;
        if(size!=null)
            countSize=size.length;

        int countColor=0;
        if(color!=null)
            countColor=color.length;

        String query=Query.additionalWhere(Query.categorySearch, search,0, gender, countSize, countColor, 3,0,0);

        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<CategoryBean> beans = new ArrayList<>();
        CategoryBean bean;
        try {
            int i=1;
            preparedStatement = conn.prepareStatement(query);
            if(search!=null && search.length()>0)
                preparedStatement.setString(i++,search);

            if(gender=='M' || gender=='W' || gender=='K')
                preparedStatement.setString(i++, String.valueOf(gender));

            if(countSize>0)
                for(String x: size)
                    preparedStatement.setString(i++, x);

            if(countColor>0)
                for(String x: color)
                    preparedStatement.setString(i++, x);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                bean = new CategoryBean();
                bean.setId(rs.getShort("id"));
                bean.setName(rs.getString("name"));
                beans.add(bean);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beans;
    }
}
