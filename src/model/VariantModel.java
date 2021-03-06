/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 * Copyright (c) 2018. Christian Gemelli
 */
package model;

import config.Ds;
import model.bean.VariantBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class VariantModel {

    public synchronized ArrayList<VariantBean> doRetrieveByProd(long idProduct) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        VariantBean b;
        ArrayList<VariantBean> beanList = new ArrayList<>();

        try {
            preparedStatement = conn.prepareStatement(Query.variantByProd);
            preparedStatement.setLong(1,idProduct);
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
                b.setColor(rs.getString("color"));
                b.setImg(rs.getString("path"));
                beanList.add(b);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beanList;
    }

    public synchronized VariantBean doRetrieveByKey(long idProduct,short idVariant) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
       VariantBean b = null;

        try {
            preparedStatement = conn.prepareStatement(Query.variantByKey);
            preparedStatement.setLong(1,idProduct);
            preparedStatement.setShort(2,idVariant);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                b=new VariantBean();
                b.setVariantId(idVariant);
                b.setSize(rs.getString("size"));
                b.setDiscountedPrice(rs.getBigDecimal("discounted_price"));
                b.setPrice(rs.getBigDecimal("price"));
                b.setAvailable(rs.getInt("available"));
                b.setWeight(rs.getInt("weight"));
                b.setSold(rs.getInt("sold"));
                b.setColor(rs.getString("color"));
                b.setImg(rs.getString("path"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return b;
    }

    public synchronized ArrayList<String> doSearchColor(String search, Integer category, char gender, String[] size) throws SQLException {
        int countSize=0;
        if(size!=null)
            countSize=size.length;

        String query=Query.additionalWhere(Query.colorSearch, search, category, gender, countSize, 0, 0,0,0);
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<String> beans = new ArrayList<>();
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

            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                beans.add(rs.getString("color"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beans;
    }

    public synchronized ArrayList<String> doSearchSize(String search, Integer category, char gender, String[] color) throws SQLException {

        int countColor=0;
        if(color!=null)
            countColor=color.length;

        String query=Query.additionalWhere(Query.sizeSearch, search, category, gender,0 , countColor,4,0,0);
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<String> beans = new ArrayList<>();
        List<String> order=Arrays.asList("XS","S","M","L","XL","XXL","XXXL");
        ArrayList<String> beansOrd =  new ArrayList<String>(order);


        try {
            int i=1;
            preparedStatement = conn.prepareStatement(query);
            if(search!=null && search.length()>0)
                preparedStatement.setString(i++,search);
            if(gender=='M' || gender=='W' || gender=='K')
                preparedStatement.setString(i++, String.valueOf(gender));

            if(category!=0)
                preparedStatement.setInt(i++, category);

            if(countColor>0)
            for(String x: color)
                preparedStatement.setString(i++, x);

            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                beans.add(rs.getString("size").toUpperCase());
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        
        boolean check[]= new boolean[]{false,false,false,false,false,false,false};
                 
        for(int i=0;i<beans.size();i++)
        {
            String str=beans.get(i);
            int index=order.indexOf(str);
            if(index==-1)
                beansOrd.add(str);    
            else
                check[index]=true;                
        }
        
        for(int i=0; i<7;i++)
            if(check[i]==false)
                beansOrd.remove(order.get(i));
        return beansOrd;
    }
}