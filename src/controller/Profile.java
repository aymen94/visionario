package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserModel;
import model.bean.UserBean;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;
        UserBean user = null;
        CheckUser check;
        try {
            check=new CheckUser(session);
            if (check.verify())
               user = new UserModel().doRetrieveById(check.getIdUser());
            else
                new Exception();
        } catch (Exception ex) {
            ex.printStackTrace();
            session.setAttribute("userId",null);
            session.setAttribute("permission", false);
            response.sendRedirect("./signin");
            return;
        }

        if (request.getParameter("password") != null) {
            dispatcher = getServletContext()
                    .getRequestDispatcher("/password.jsp");
        } else if (request.getParameter("address")!=null)
        {
            dispatcher = getServletContext()
                    .getRequestDispatcher("/address.jsp");
        }
        
        else {
            request.setAttribute("user", user);
            dispatcher = getServletContext()
                    .getRequestDispatcher("/profile.jsp");
        }
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
