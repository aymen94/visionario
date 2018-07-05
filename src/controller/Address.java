package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressModel;

/**
 * Servlet implementation class Address
 */
@WebServlet("/Address")
public class Address extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String country, province, city, zip, addressLine, consignee,
                phoneNumber;
        Short id;
        AddressModel model = new AddressModel();
        try {
            CheckUser check;
            try {
                check = new CheckUser(session);

                if (!check.verify())
                    throw new Exception("Unsigned user");

            } catch (Exception e) {
                session.setAttribute("userId",null);
                session.setAttribute("permission", false);
                throw e;
            }

            try {
                id = Short.parseShort(request.getParameter("remove"));
                if (model.doDelete(check.getIdUser(), id))
                    out.println(
                            "{ \"title\": \"success\", \"response\": \"Deleted address\" }");
                else
                    out.println(
                            "{ \"title\": \"error\", \"response\": \"Address already deleted\" }");
            } catch (Exception ex) {
                country = request.getParameter("country");
                province = request.getParameter("province");
                city = request.getParameter("city");
                zip = request.getParameter("zip");
                addressLine = request.getParameter("addressLine");
                consignee = request.getParameter("consignee");
                phoneNumber = request.getParameter("phoneNumber");

                try {
                    id = Short.parseShort(request.getParameter("update"));
                    if (model.doUpdate(check.getIdUser(), id, country, province,
                            city, zip, addressLine, consignee, phoneNumber))
                        out.println(
                                "{ \"title\": \"success\", \"response\": \"Updated address\" }");
                    else
                        out.println(
                                "{ \"title\": \"error\", \"response\": \"Unable to update address.\nAll fields must be filled in correctly\" }");

                } catch (Exception ex1) {
                    try {

                        id = Short.parseShort(request.getParameter("insert"));
                        id = (short)model.doSave(check.getIdUser(), country,
                                province, city, zip, addressLine, consignee,
                                phoneNumber);
                        if (id != 0)
                            out.println(
                                    "{ \"title\": \"success\", \"response\": \"Added address\", \"id\": \""
                                            + id + "\" }");
                        else
                            out.println(
                                    "{ \"title\": \"error\", \"response\": \"Unable to add address.\nYou must fullfill all the fields\" }");

                    } catch (Exception e) {
                        throw e;
                    }
                }
            }

        }

        catch (Exception ex) {
            ex.printStackTrace();
            out.println(
                    "{ \"title\": \"invalid\", \"response\": \"Internal error\" }");
            return;
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
