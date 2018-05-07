package datasource;

import javax.annotation.Resource;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class Ds extends HttpServlet {
    @Resource(name="jdbc/visionario")
    private static DataSource datasource = null;
    public void init() throws ServletException
    {
        System.out.println("### run ###");
        try
        {
            InitialContext initialContext = new InitialContext();
            if ( initialContext == null )
            {
                String message = "InitialContext  We're about to have some problems.";
                System.err.println("### " + message);
                throw new Exception(message);
            }

            datasource = (DataSource) initialContext.lookup( "java:comp/env/jdbc/visionario" );

            if ( datasource == null )
            {
                String message = "Could not find our DataSource";
                System.err.println("### " + message);
                throw new Exception(message);
            }
        }
        catch (Exception e)
        {
            throw new ServletException(e.getMessage());
        }
    }

    public static synchronized Connection getConnection()
            throws SQLException
    {
        return datasource.getConnection();
    }


    public static synchronized void freeConnection(Connection connection)
    {
        try
        {
            connection.close();
        }
        catch (Exception e)
        {
            System.err.println("DBBroker: Threw an exception closing a database connection");
            e.printStackTrace();
        }
    }

}
