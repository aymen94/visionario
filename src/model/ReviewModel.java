/*
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.Ds;
import model.bean.ReviewBean;

public class ReviewModel {

public synchronized ArrayList<ReviewBean> doRetrieveByProd(long prod) throws SQLException {
    Connection conn = Ds.getConnection();
    PreparedStatement preparedStatement = null;
    ReviewBean bean;
    ArrayList<ReviewBean> b=new ArrayList<ReviewBean>();
    try {
        preparedStatement = conn.prepareStatement(Query.reviewsByProd);
        preparedStatement.setLong(1,prod);

        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) {
            bean= new ReviewBean();
            bean.setProduct(prod);
            bean.setUser(rs.getLong("user"));
            bean.setUserName(rs.getString("user_name"));
            bean.setComment(rs.getString("comment"));
            bean.setDate(rs.getDate("date"));
            bean.setScore(rs.getShort("score"));
            b.add(bean);
        }
    } finally {
        preparedStatement.close();
        conn.close();
    }
    return b;
}
}