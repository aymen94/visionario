package model;

import config.Ds;
import model.bean.ProductDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDetailModel {

    public synchronized ProductDetails doRetrieveByKey(int code) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ProductDetails product = new ProductDetails();

        try {
            preparedStatement = conn.prepareStatement(Query.productDetail);
            preparedStatement.setInt(1,code);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                product.setTitle(rs.getString("title"));
                product.setVariants(new VariantModel().doRetrieveByProd(code));
                product.setCategory(new CategotyModel().doRetrieveByKey(rs.getShort("category")));
                product.setDescription(rs.getString("description"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return product;
    }

}
