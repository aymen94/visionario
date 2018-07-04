package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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
        Long userId = null;
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;
        UserBean user;
        try {
            userId = (Long) session.getAttribute("userId");

            if (userId == null || (user = (new UserModel()).doRetrieveById(userId)) == null)
                throw new Exception();
        } catch (Exception ex) {
            session.invalidate();
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
