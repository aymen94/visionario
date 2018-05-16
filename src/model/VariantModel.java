package model;

import config.Ds;
import model.bean.ProductDetails;
import model.bean.VariantBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VariantModel {

    public synchronized ArrayList<VariantBean> doRetrieveByProd(int idProduct) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        VariantBean b;
        ArrayList<VariantBean> beanList = new ArrayList<>();

        try {
            preparedStatement = conn.prepareStatement(Query.variantByProd);
            preparedStatement.setInt(1,idProduct);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                b = new VariantBean();
                b.setVariantId(rs.getShort("id"));
                b.setSize(rs.getString("size"));
                b.setDiscountedPrice(rs.getBigDecimal("discounted_price"));
                b.setPrice(rs.getBigDecimal("price"));
                b.setAvailable(rs.getInt("available"));
                b.setWeight(rs.getInt("weight"));
                b.setSold(rs.getInt("sold"));
                b.setImg(rs.getString("path"));
                beanList.add(b);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beanList;
    }

    public synchronized VariantBean doRetrieveByKey(int idProduct,int idVariant) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
       VariantBean bean = new VariantBean();

        try {
            preparedStatement = conn.prepareStatement(Query.variantByKey);
            preparedStatement.setInt(1,idProduct);
            preparedStatement.setInt(2,idVariant);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                VariantBean b = new VariantBean();
                b.setVariantId(rs.getShort("id"));
                b.setSize(rs.getString("size"));
                b.setDiscountedPrice(rs.getBigDecimal("discounted_price"));
                b.setPrice(rs.getBigDecimal("price"));
                b.setAvailable(rs.getInt("available"));
                b.setWeight(rs.getInt("weight"));
                b.setSold(rs.getInt("sold"));
                b.setImg(rs.getString("path"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return bean;
    }

}