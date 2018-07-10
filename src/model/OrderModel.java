package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.Ds;
import model.bean.OrderBean;
import model.bean.ReviewBean;

public class OrderModel {

public synchronized ArrayList<OrderBean> doRetrieveByUser(long user) throws SQLException {
    Connection conn = Ds.getConnection();
    PreparedStatement preparedStatement = null;
    OrderBean bean;
    ArrayList<OrderBean> b=new ArrayList<OrderBean>();
    try {
        preparedStatement = conn.prepareStatement(Query.orderByUser);
        preparedStatement.setLong(1,user);

        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) {
            bean= new OrderBean();
            bean.setId(rs.getLong("id"));
            bean.setDeliveryDate(rs.getDate("delivery_date"));
            bean.setOrderingDate(rs.getDate("ordering_date"));
            bean.setPaymentMethod(rs.getString("payment_method"));
            bean.setShippingFees(rs.getBigDecimal("shipping_fees"));
            bean.setSign(rs.getString("sign"));
            bean.setStatus(rs.getShort("status"));
            bean.setTotal(rs.getBigDecimal("total"));
            bean.setUser(user);
            bean.setAddress(rs.getString("address"));
            bean.setTrack("https://t.17track.net/it#nums=F226C82657754");
            b.add(bean);
        }
    } finally {
        preparedStatement.close();
        conn.close();
    }
    return b;
}
}