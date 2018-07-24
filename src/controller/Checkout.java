/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressModel;
import model.CompositionModel;
import model.OrderModel;
import model.UserModel;
import model.bean.CartBean;

import model.bean.UserBean;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;
        CheckUser check;
        try {
            check=new CheckUser(session);
            if (!check.verify())
                throw new Exception();            
        } catch (Exception ex) {
            ex.printStackTrace();
            session.setAttribute("userId",null);
            session.setAttribute("permission", false);
            response.sendRedirect("./signin?redirect=Checkout");
            return;
        }
        
        try {
            request.setAttribute("address", new AddressModel().doRetrieveByUser(check.getIdUser()));
            session.setAttribute("checkout", session.getAttribute("cart"));
            dispatcher=request.getRequestDispatcher("/checkout.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
