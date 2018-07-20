/*
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import config.Ds;
import model.bean.GenderBean;

public class GenderModel {
    public synchronized GenderBean[] doSearch(String search, Integer category, String[] size, String[] color) throws SQLException {
        int countSize=0;
        if(size!=null)
            countSize=size.length;

        int countColor=0;
        if(color!=null)
            countColor=color.length;

        String query=Query.additionalWhere(Query.genderSearch, search, category, '0', countSize, countColor, 0,0,0);

        Connection conn = Ds.getConnection();
        PreparedStatement preparedStatement = null;
        ArrayList<String> beans = new ArrayList<>();
        try {
            int i=1;
            preparedStatement = conn.prepareStatement(query);
            if(search!=null && search.length()>0)
                preparedStatement.setString(i++,search);

            if(category!=0)
                preparedStatement.setInt(i++, category);

            if(countSize>0)
                for(String x: size)
                    preparedStatement.setString(i++, x);

            if(countColor>0)
                for(String x: color)
                    preparedStatement.setString(i++, x);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                beans.add(rs.getString("gender"));
            }
        } finally {
            preparedStatement.close();
            conn.close();
        }
        
      GenderBean[] gend= {new GenderBean("Man",'M'),new GenderBean("Woman",'W'), new GenderBean("Kid",'K')}; 
      for (String x: beans)
      {
          switch(x)
          {
          case "K": gend[2].setEnabled(true); break;
          case "U": gend[0].setEnabled(true); gend[1].setEnabled(true);break;
          case "M": gend[0].setEnabled(true); break;
          case "W": gend[1].setEnabled(true); break;
          }
      }
      return gend;
    }
}
