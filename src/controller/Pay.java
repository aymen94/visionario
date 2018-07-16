package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

import javax.servlet.ServletException;
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
@WebServlet("/Pay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	       try {
	    HttpSession session=request.getSession();
	    short address =Short.parseShort(request.getParameter("addressRadio"));
	    long user=(long) session.getAttribute("userId");
	    String paymentMethod= request.getParameter("pay");
	    AddressBean addr=new AddressModel().doRetrieveByUser_id(user, address);
	    OrderBean bean= new OrderBean();
	    BigDecimal total=new BigDecimal(request.getParameter("total"));
	    bean.setUser(user);
	    bean.setShippingFees(BigDecimal.valueOf(0,2));
	    bean.setAddress(addr.toString());
	    bean.setOrderingDate(java.sql.Date.valueOf(LocalDate.now()));
	    bean.setTotal(total);
	    bean.setConsignee(addr.getConsignee());
	    bean.setPaymentMethod(paymentMethod);
	    bean.setStatus((short) 0);
	    if(paymentMethod.toLowerCase().contains("card"))
	       bean.setStatus((short) 1);

            if(new OrderModel().doSave(bean,(CartBean) session.getAttribute("checkout")))
            {
                session.setAttribute("checkout",null);
                if(paymentMethod.toLowerCase().contains("card"))
                {
                request.getRequestDispatcher("/card.html").forward(request, response);
                }
                else
                {
                request.getRequestDispatcher("/bonifico.html").forward(request, response);
                }
            }
            else
            {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
