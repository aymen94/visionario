package controller;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.io.*;
import java.sql.*;

@SuppressWarnings("serial")
@WebServlet("/color")
public class TestConnection extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Statement stmt = null;
        ResultSet rs = null;
        DataSource datasource=null;
        try {
            InitialContext initialContext = new InitialContext();

            datasource = (DataSource) initialContext.lookup( "java:comp/env/db" );
            Connection con = datasource.getConnection();

            stmt = con.createStatement();

            rs = stmt.executeQuery("select id, name, hex from Color");

            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");
            out.write("<html>");
            out.write("<body>");

            out.write("<h3>Database Records</h3>");
            while(rs.next())  {
                out.write("id: " + rs.getInt("id"));
                out.write("name: " + rs.getString("name"));
                out.write("hex: " + rs.getString("hex"));
                out.write("</br>");
            }

            //lets print some DB information
            out.write("<h3>Database Meta Data</h3>");
            DatabaseMetaData metaData = con.getMetaData();
            out.write("Database Product: " + metaData.getDatabaseProductName() + "<br/>");
            out.write("Database Version: " + metaData.getDatabaseMajorVersion() + "."
                    + metaData.getDatabaseMinorVersion() + "<br/>");
            out.write("Database Driver: " + metaData.getDriverName() + "<br/>");
            out.write("Database Driver version: " + metaData.getDriverMajorVersion() + "."
                    + metaData.getDriverMinorVersion() + "<br/>");
            out.write("Database user: " + metaData.getUserName());
            out.write("</html>");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NamingException e) {
            e.printStackTrace();
        } finally{
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception in closing DB resources");
            }
        }
    }
}

