/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model;

import config.Ds;
import model.bean.ProductDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDetailModel {

    public synchronized ProductDetails doRetrieveByKey(long code) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ProductDetails product = new ProductDetails();

        try {
            preparedStatement = conn.prepareStatement(Query.productDetail);
            preparedStatement.setLong(1,code);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                product.setTitle(rs.getString("title"));
                product.setVariants(new VariantModel().doRetrieveByProd(code));
                product.setCategory(new CategoryModel().doRetrieveByKey(rs.getShort("category")));
                product.setDescription(rs.getString("description"));
                product.setDefaultImage(rs.getString("path"));
                product.setMaxPrice(rs.getBigDecimal("priceMax"));
                product.setMinPrice(rs.getBigDecimal("priceMin"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return product;
    }

}
