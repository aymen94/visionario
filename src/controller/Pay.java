/*
 * Copyright (c) 2018. Aymen Naghmouchi
 * Copyright (c) 2018. Andrea Mennillo a[dot]mennillo1(at)studenti(dot)unisa[dot]it
 */
package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressModel;
import model.OrderModel;
import model.bean.AddressBean;
import model.bean.CartBean;
import model.bean.OrderBean;

/**
 * Servlet implementation class Pay
 */
@WebServlet("/payment")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws  IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		try {
		    String consignee,addrline;
	        long user=(long) session.getAttribute("userId");
			short address =Short.parseShort(request.getParameter("addressRadio"));
			if(address!=-1)
			{
	        AddressBean addr=new AddressModel().doRetrieveByUser_id(user, address);
	        consignee=addr.getConsignee();
	        addrline=addr.toString();
			}
			else
			{
			    consignee=request.getParameter("consignee");
	            addrline=request.getParameter("addrline");

			}
			String paymentMethod= request.getParameter("pay");
			OrderBean bean= new OrderBean();
			BigDecimal total=new BigDecimal(request.getParameter("total"));
			bean.setUser(user);
			bean.setShippingFees(BigDecimal.valueOf(0,2));
			bean.setAddress(addrline);
			bean.setOrderingDate(java.sql.Date.valueOf(LocalDate.now()));
			bean.setTotal(total);
			bean.setConsignee(consignee);
			bean.setPaymentMethod(paymentMethod);
			bean.setStatus((short) 0);
			if(paymentMethod.toLowerCase().contains("visa") || paymentMethod.toLowerCase().contains("paypal"))
			   bean.setStatus((short) 1);

				if(new OrderModel().doSave(bean,(CartBean) session.getAttribute("checkout")))	{
					session.setAttribute("checkout",null);
					session.setAttribute("cart",null);
					request.getRequestDispatcher("/pay").forward(request, response);
				}else{
						session.setAttribute("checkout",null);
					    session.setAttribute("cart",null);
					    request.getRequestDispatcher("/cart").forward(request,response);
					}
        } catch (Exception e) {
	       	session.setAttribute("checkout",null);
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
		doGet(request, response);
	}

}
