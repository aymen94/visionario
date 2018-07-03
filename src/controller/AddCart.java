package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.VariantModel;
import model.bean.CartBean;
import model.bean.CartItem;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/addcart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
        /*
         * quantity=0 the product is removed, quantity>0 the quantity of the
         * product is replaced, otherwise increase the quantity of 1
         */
	    String prod,var,quant;
	    Short varId;
	    Long prodId;
	    Integer quantity;
	    prod=request.getParameter("prod");
	    var=request.getParameter("var");
	    quant=request.getParameter("quantity");

        try {
            prodId = Long.parseLong(prod);
        } catch (NumberFormatException exception) {

            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to add product to cart");
            return;
        }
        try {
            varId = Short.parseShort(var);
        }

        catch (NumberFormatException exception) {
            varId = 1;
        }
        
        try {
            quantity = Integer.parseInt(quant);
        } catch (NumberFormatException exception) {
            quantity=null;
        }
        try {
            if ((new VariantModel()).doRetrieveByKey(prodId, varId) == null) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Product not found");
                return;
            }
        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "DB error");
            return;
        }

        HttpSession session=request.getSession();
        CartBean cart=(CartBean)session.getAttribute("cart");
        if(cart==null)
            cart=new CartBean();
        CartItem item= new CartItem();
        item.setId(prodId);
        item.setVariantId(varId);

        if (quantity!=null && quantity == 0)
            cart.remove(item);
        else {
            if (quantity == null)
                quantity = cart.getQuantity(item) + 1;
            cart.put(item, quantity);
        }
        session.setAttribute("cart", cart);
        response.setStatus(HttpServletResponse.SC_OK);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
