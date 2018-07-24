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
import model.bean.CompositionBean;

public class CompositionModel {

public synchronized ArrayList<CompositionBean> doRetrieveByOrder(long order) throws SQLException {
    Connection conn = Ds.getConnection();
    PreparedStatement preparedStatement = null;
    CompositionBean bean;
    ArrayList<CompositionBean> b=new ArrayList<CompositionBean>();
    try {
        preparedStatement = conn.prepareStatement(Query.compositionByOrd);
        preparedStatement.setLong(1,order);

        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) {
            bean= new CompositionBean();
            bean.setPrice(rs.getBigDecimal("price"));
            bean.setQuantity(rs.getShort("quantity"));
            bean.setText(rs.getString("title")+ " [" +rs.getString("color") + ", " + rs.getString("size") + "]");
            b.add(bean);
        }
    } finally {
        preparedStatement.close();
        conn.close();
    }
    return b;
}

}