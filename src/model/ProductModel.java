package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.Ds;
import model.bean.ProductBean;

public class ProductModel {


 /*
    public synchronized void doSave(ProductBean product) throws SQLException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + ProductModel.TABLE_NAME
                + " (title, priceMin, priceMax, numReviews) VALUES (?, ?, ?, ?)";

        try {
            connection = Ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setInt(3, product.getPrice());
            preparedStatement.setInt(4, product.getQuantity());

            preparedStatement.executeUpdate();

            connection.commit();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
    }
*/
    
    public synchronized ProductBean doRetrieveByKey(long id) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ProductBean bean = new ProductBean();
        try {
            preparedStatement = conn.prepareStatement(Query.productByKey);
            preparedStatement.setLong(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                bean.setId(rs.getLong("id"));
                bean.setTitle(rs.getString("title"));
                bean.setMinPrice(rs.getBigDecimal("priceMin"));
                bean.setMaxPrice(rs.getBigDecimal("priceMax"));
                bean.setDefaultImage(rs.getString("path"));
                bean.setNumReviews(rs.getInt("numReviews"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return bean;
    }

    public synchronized long doCountSearch(String search, Integer category, char gender, String[] size, String[] color) throws SQLException {
        int countSize=0;
        if(size!=null)
            countSize=size.length;

        int countColor=0;
        if(color!=null)
            countColor=color.length;

        String query=Query.additionalWhere(Query.countMatches, search, category, gender, countSize, countColor, 0,0,0);

        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        int beans=0;
        try {
            int i=1;
            preparedStatement = conn.prepareStatement(query);
            if(search!=null && search.length()>0)
                preparedStatement.setString(i++,search);

            if(gender=='M' || gender=='W' || gender=='K')
                preparedStatement.setString(i++, String.valueOf(gender));

            if(category!=0)
                preparedStatement.setInt(i++, category);


            if(countSize>0)
                for(String x: size)
                    preparedStatement.setString(i++, x);

            if(countColor>0)
                for(String x: color)
                    preparedStatement.setString(i++, x);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
               beans=rs.getInt(1);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beans;
    }
    
    
    
    public synchronized ArrayList<ProductBean> doSearch(String search,
            Integer category, char gender, String[] size, String[] color,
            int sort, int limit, int offset) throws SQLException {
        int countSize=0;
        if(size!=null)
            countSize=size.length;

        int countColor=0;
        if(color!=null)
            countColor=color.length;

        String query = Query.additionalWhere(Query.productSearch, search,
                category, gender, countSize, countColor, sort, limit, offset);

        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<ProductBean> beans = new ArrayList<>();
        ProductBean bean;
        try {
            int i=1;
            preparedStatement = conn.prepareStatement(query);
            if(search!=null && search.length()>0)
                preparedStatement.setString(i++,search);

            if(gender=='M' || gender=='W' || gender=='K')
                preparedStatement.setString(i++, String.valueOf(gender));

            if(category!=0)
                preparedStatement.setInt(i++, category);


            if(countSize>0)
                for(String x: size)
                    preparedStatement.setString(i++, x);

            if(countColor>0)
                for(String x: color)
                    preparedStatement.setString(i++, x);

            if(limit>0)
                preparedStatement.setInt(i++, limit);
            
            if(offset>0)
                preparedStatement.setInt(i++, offset);
            
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bean= new ProductBean();
                bean.setId(rs.getLong("id"));
                bean.setTitle(rs.getString("title"));
                bean.setMinPrice(rs.getBigDecimal("priceMin"));
                bean.setMaxPrice(rs.getBigDecimal("priceMax"));
                bean.setDefaultImage(rs.getString("path"));
                bean.setNumReviews(rs.getInt("numReviews"));
                beans.add(bean);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beans;
    }

    public synchronized ArrayList<ProductBean> doRetrieveAll() throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<ProductBean> beans = new ArrayList<>();
        ProductBean bean;
        try {
            preparedStatement = conn.prepareStatement(Query.productAll);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bean= new ProductBean();
                bean.setId(rs.getLong("id"));
                bean.setTitle(rs.getString("title"));
                bean.setMinPrice(rs.getBigDecimal("priceMin"));
                bean.setMaxPrice(rs.getBigDecimal("priceMax"));
                bean.setDefaultImage(rs.getString("path"));
                bean.setNumReviews(rs.getInt("numReviews"));
                beans.add(bean);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beans;
    }
    
    

    public synchronized ArrayList<ProductBean> doRetrieveDiscounted(int limit) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<ProductBean> beans = new ArrayList<>();
        ProductBean bean;
        try {
            preparedStatement = conn.prepareStatement(Query.productDiscounted);
            preparedStatement.setInt(1, limit);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bean= new ProductBean();
                bean.setId(rs.getLong("id"));
                bean.setTitle(rs.getString("title"));
                bean.setMinPrice(rs.getBigDecimal("discounted_price"));
                bean.setMaxPrice(rs.getBigDecimal("price"));
                bean.setDefaultImage(rs.getString("path"));
                bean.setNumReviews(rs.getInt("ProductVariant.id"));
                beans.add(bean);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beans;
    }


 /*
    @Override
    public synchronized boolean doDelete(int code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM " + ProductModel.TABLE_NAME + " WHERE CODE = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1, code);

            result = preparedStatement.executeUpdate();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return (result != 0);
    }

    @Override
    public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        Collection<ProductBean> products = new LinkedList<ProductBean>();

        String selectSQL = "SELECT * FROM " + ProductModel.TABLE_NAME;

        if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                ProductBean bean = new ProductBean();

                bean.setCode(rs.getInt("CODE"));
                bean.setName(rs.getString("NAME"));
                bean.setDescription(rs.getString("DESCRIPTION"));
                bean.setPrice(rs.getInt("PRICE"));
                bean.setQuantity(rs.getInt("QUANTITY"));
                products.add(bean);
            }

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return products;
    }
*/
}
