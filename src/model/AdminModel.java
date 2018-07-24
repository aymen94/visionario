/*
 * Copyright (c) 2018. Aymen Naghmouchi
 */

package model;

import config.Ds;
import java.math.BigDecimal;
import java.sql.*;


public class AdminModel {

    public int doRetrieveByNumber(String name) throws SQLException {
        Connection conn = Ds.getConnection();
        Statement st = null;
        ResultSet rs;
        int num=0;
        try {
            st = conn.createStatement();
            rs= st.executeQuery(Query.numberInfo+name);
            if (rs.next())
               num=rs.getInt(1);
        } finally {
            st.close();
            conn.close();
        }
        return num;
    }

    public BigDecimal doRetrieveRevenue() throws SQLException {
        Connection conn = Ds.getConnection();
        Statement st = null;
        ResultSet rs;
        BigDecimal num = null;
        try {
            st = conn.createStatement();
            rs= st.executeQuery(Query.revenue);
            if (rs.next())
                num=rs.getBigDecimal(1);
        } finally {
            st.close();
            conn.close();
        }
        return num;
    }

}
