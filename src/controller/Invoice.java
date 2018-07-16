package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CompositionModel;
import model.OrderModel;
import model.UserModel;
import model.bean.CompositionBean;
import model.bean.OrderBean;
import model.bean.UserBean;

/**
 * Servlet implementation class invoice
 */
@WebServlet("/Invoice")
public class Invoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        RequestDispatcher dispatcher;
	        UserBean user = null;
	        String order;
	        long ordId;
	        CheckUser check;
	        OrderBean ord;
	        ArrayList<CompositionBean> composition;
	        
	        try {
	            check=new CheckUser(session);
	            if (check.verify())
	               user = new UserModel().doRetrieveById(check.getIdUser());
	            else
	                throw new Exception();
	            order=request.getParameter("order");
	            ordId=Long.parseLong(order);
	            ord= new OrderModel().doRetrieveById(ordId,check.getIdUser());
	            if(ord==null)
	                throw new Exception();
	            
	            composition = new CompositionModel().doRetrieveByOrder(ord.getId());
	            if(composition==null || composition.size()<1)
	                throw new Exception();

	            
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            session.setAttribute("userId",null);
	            session.setAttribute("permission", false);
	            response.sendRedirect("./");
	            return;
	        }

	           
	            request.setAttribute("user", user);
	            request.setAttribute("order", ord);
	            request.setAttribute("composition", composition);


	            dispatcher = getServletContext()
	                    .getRequestDispatcher("/invoice.jsp");
	        dispatcher.forward(request, response);	
	        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
