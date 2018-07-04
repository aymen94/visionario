package model;

import config.Ds;
import model.bean.AddressBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AddressModel {

    public synchronized ArrayList<AddressBean> doRetrieveByUser(long idUser)
            throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        AddressBean b;
        ArrayList<AddressBean> beanList = new ArrayList<>();

        try {
            preparedStatement = conn.prepareStatement(Query.addressByUser);
            preparedStatement.setLong(1, idUser);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                b = new AddressBean();
                b.setId(rs.getShort("id"));
                b.setAddressLine(rs.getString("address_line"));
                b.setCity(rs.getString("city"));
                b.setConsignee(rs.getString("consignee"));
                b.setCountry(rs.getString("country"));
                b.setPhoneNumber(rs.getString("phone_number"));
                b.setProvince(rs.getString("province"));
                b.setZip(rs.getString("zip"));
                beanList.add(b);
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return beanList;
    }

    // Returns inserted id
    public synchronized int doSave(long user, String country, String province,
            String city, String zip, String addressLine, String consignee,
            String phoneNumber) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        int insertedId = 0;
        try {
            preparedStatement = conn.prepareStatement(Query.insertAddress);
            preparedStatement.setLong(1, user);
            preparedStatement.setString(2, country);
            preparedStatement.setString(3, province);
            preparedStatement.setString(4, city);
            preparedStatement.setString(5, zip);
            preparedStatement.setString(6, addressLine);
            preparedStatement.setString(7, consignee);
            preparedStatement.setString(8, phoneNumber);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next())
                insertedId = rs.getInt(1);

        } finally {
            preparedStatement.close();
            conn.close();
        }
        return insertedId;
    }

    public synchronized boolean doUpdate(long user, short id, String country,
            String province, String city, String zip, String addressLine,
            String consignee, String phoneNumber) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        int result = 0;
        try {
            preparedStatement = conn.prepareStatement(Query.insertAddress);
            preparedStatement.setLong(1, user);
            preparedStatement.setShort(2, id);
            preparedStatement.setString(3, country);
            preparedStatement.setString(4, province);
            preparedStatement.setString(5, city);
            preparedStatement.setString(6, zip);
            preparedStatement.setString(7, addressLine);
            preparedStatement.setString(8, consignee);
            preparedStatement.setString(9, phoneNumber);

            result = preparedStatement.executeUpdate();

        } finally {
            preparedStatement.close();
            conn.close();
        }
        return result == 1 ? true : false;
    }

    public synchronized boolean doDelete(long user, short id)
            throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        int result = 0;
        try {
            preparedStatement = conn.prepareStatement(Query.insertAddress);
            preparedStatement.setLong(1, user);
            preparedStatement.setShort(2, id);

            result = preparedStatement.executeUpdate();

        } finally {
            preparedStatement.close();
            conn.close();
        }
        return result == 1 ? true : false;
    }
}
