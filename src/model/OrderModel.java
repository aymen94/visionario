/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import config.Ds;
import model.bean.CartBean;
import model.bean.CartItem;
import model.bean.CompositionBean;
import model.bean.OrderBean;
import model.bean.ProductBean;
import model.bean.ReviewBean;
import model.bean.VariantBean;

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
            bean.setShippingDate(rs.getDate("shipping_date"));
            bean.setSign(rs.getString("sign"));
            bean.setStatus(rs.getShort("status"));
            bean.setTotal(rs.getBigDecimal("total"));
            bean.setUser(user);
            bean.setAddress(rs.getString("address"));
            bean.setConsignee(rs.getString("consignee"));
            bean.setTrack("https://t.17track.net/it#nums=F226C82657754");
            b.add(bean);
        }
    } finally {
        preparedStatement.close();
        conn.close();
    }
    return b;
}

public OrderBean doRetrieveById(long ordId, long user) throws SQLException {
    Connection conn = Ds.getConnection();
    PreparedStatement preparedStatement = null;
    OrderBean bean=null;
    try {
        preparedStatement = conn.prepareStatement(Query.orderById_User);
        preparedStatement.setLong(1,ordId);
        preparedStatement.setLong(2,user);

        ResultSet rs = preparedStatement.executeQuery();
        if(rs.next()) {
            bean= new OrderBean();
            bean.setId(ordId);
            bean.setDeliveryDate(rs.getDate("delivery_date"));
            bean.setOrderingDate(rs.getDate("ordering_date"));
            bean.setPaymentMethod(rs.getString("payment_method"));
            bean.setShippingFees(rs.getBigDecimal("shipping_fees"));
            bean.setShippingDate(rs.getDate("shipping_date"));
            bean.setSign(rs.getString("sign"));
            bean.setStatus(rs.getShort("status"));
            bean.setTotal(rs.getBigDecimal("total"));
            bean.setUser(rs.getLong("user"));
            bean.setAddress(rs.getString("address"));
            bean.setConsignee(rs.getString("consignee"));
            bean.setTrack("https://t.17track.net/it#nums=F226C82657754");
        }
    } finally {
        preparedStatement.close();
        conn.close();
    }
    return bean;
}

public boolean doSave(OrderBean order, CartBean cart) throws SQLException {
    Connection conn = Ds.getConnection();
    PreparedStatement preparedStatement = null;
    
    try {
        int i=1;
        long key;
        BigDecimal total2;
        conn.setAutoCommit(false);
       
        preparedStatement =conn.prepareStatement(Query.saveOrder,  PreparedStatement.RETURN_GENERATED_KEYS);
        preparedStatement.setBigDecimal(i++, order.getTotal());
        preparedStatement.setDate(i++,order.getOrderingDate());
        preparedStatement.setLong(i++, order.getUser());
        preparedStatement.setBigDecimal(i++, order.getShippingFees());
        preparedStatement.setShort(i++,order.getStatus());
        preparedStatement.setString(i++, order.getPaymentMethod());
        preparedStatement.setString(i++, order.getAddress());
        preparedStatement.setString(i++, order.getConsignee());
        
        if(preparedStatement.executeUpdate()<1)
            throw new Exception();
        ResultSet rs=preparedStatement.getGeneratedKeys();
        if (rs.next()) {
            key = rs.getLong(1);
        }
        else
            throw new Exception();
        total2=order.getShippingFees();
        
        for(CartItem x: cart.getItems())
        {
            VariantBean var=x.getVariant();
            ProductBean prod=x.getProduct();
            int quantity=cart.getQuantity(x);
            System.out.println(var.getAvailable());
            System.out.println(quantity);

            if(var.getAvailable()>=quantity)
            {
               int j=1;
               preparedStatement=conn.prepareStatement(Query.saveComposition);
               preparedStatement.setLong(j++, prod.getId());
               preparedStatement.setShort(j++, var.getVariantId());
               preparedStatement.setLong(j++, key);
               preparedStatement.setInt(j++, quantity);
               preparedStatement.setBigDecimal(j++, var.getDiscountedPrice());
               total2=total2.add(var.getDiscountedPrice().multiply(BigDecimal.valueOf(quantity)));
               if(preparedStatement.executeUpdate()<1)
                   throw new Exception();
            }
            else
               return false;
        }
        if(!total2.equals(order.getTotal()))
        {
            throw new Exception();
        }
        else
            conn.commit();
    
    
    } catch(Exception ex)
    {
        ex.printStackTrace();
        conn.rollback();
        return false;
    }
    
    return true;
}
}