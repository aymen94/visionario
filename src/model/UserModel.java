/*
 * Copyright (c) 2018. Visionario
 */

package model;

import config.Ds;
import model.bean.UserBean;

import java.sql.*;
import java.util.ArrayList;

public class UserModel {

    public UserBean doRetrieveByMail(String mail) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        UserBean user = new UserBean();

        try {
            preparedStatement = conn.prepareStatement(Query.userByMail);
            preparedStatement.setString(1,mail);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()) {
                user.setId(rs.getLong("id"));
                user.setPassword(rs.getString("password"));
                user.setPermission(rs.getBoolean("permission"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        return user;
    }

    public boolean doSave(String name, String surname, String email, String password, String sex, Date date, byte permission) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;

        try{
            preparedStatement = conn.prepareStatement(Query.signup);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,surname);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,password);
            preparedStatement.setString(5,sex);
            preparedStatement.setDate(6, date);
            preparedStatement.setByte(7,permission);

            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        preparedStatement.close();
        conn.close();
        return true;
    }
    
    public boolean doUpdate(long id, String name, String surname, String email, String sex, Date date, byte permission) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;

        try{
            preparedStatement = conn.prepareStatement(Query.updateProfile);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,surname);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,sex);
            preparedStatement.setDate(5, date);
            preparedStatement.setByte(6,permission);
            preparedStatement.setLong(7, id);

            if(preparedStatement.executeUpdate()!=1)
                throw new Exception();
            
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        preparedStatement.close();
        conn.close();
        return true;
    }

    
    public boolean doUpdatePassword(Long id, String password) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;

        try{
            preparedStatement = conn.prepareStatement(Query.updatePassword);
            preparedStatement.setString(1,password);
            preparedStatement.setLong(2,id);

            if(preparedStatement.executeUpdate()!=1)
                throw new Exception();
            
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        preparedStatement.close();
        conn.close();
        return true;
    }
    
    public UserBean doRetrieveById(long id) throws SQLException {
            Connection conn = Ds.getConnection();
            PreparedStatement preparedStatement = null;
            UserBean user = new UserBean();

            try {
                preparedStatement = conn.prepareStatement(Query.userById);
                preparedStatement.setLong(1,id);
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()) {
                    user=new UserBean();
                    user.setId(id);
                    user.setName(rs.getString("name"));
                    user.setSurname(rs.getString("surname"));
                    user.setEmail(rs.getString("email"));
                    user.setSex(rs.getString("sex").charAt(0));
                    user.setBirth(rs.getDate("birth"));
                    user.setPassword(rs.getString("password"));
                    user.setPermission(rs.getBoolean("permission"));
                }
            } finally {
                preparedStatement.close();
                conn.close();
            }
        return user;
    }

    public ArrayList<UserBean> doRetrieveAll() throws SQLException {
        Connection conn = Ds.getConnection();
        Statement st = null;
        ResultSet rs;
        ArrayList<UserBean> list;
        UserBean user;
        try {
            st = conn.createStatement();
            list = new ArrayList<>();
            rs = st.executeQuery(Query.allUsers);
            while(rs.next()) {
                user = new UserBean();
                user.setId(rs.getLong("id"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setEmail(rs.getString("email"));
                user.setSex(rs.getString("sex").charAt(0));
                user.setBirth(rs.getDate("date_of_birth"));
                user.setPassword(rs.getString("password"));
                user.setPermission(rs.getBoolean("permission"));
                list.add(user);
            }
        } finally {
            st.close();
            conn.close();
        }
        return list;
    }

    public boolean doDelete(long id) throws SQLException {
        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = conn.prepareStatement(Query.deleteUser);
            preparedStatement.setLong(1,id);
            preparedStatement.setLong(2,id);
            preparedStatement.executeUpdate();

            preparedStatement.close();
            conn.close();
        } catch (SQLException e){
            return false;
        }
        return true;
    }
}
