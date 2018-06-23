package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CategoryModel;
import model.GenderModel;
import model.ProductModel;
import model.VariantModel;
import model.bean.GenderBean;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class Search extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Read Parameters
        String q=request.getParameter("q");
        Integer category;
        try {
            category=Integer.parseInt(request.getParameter("category"));
        }
        catch(NumberFormatException exception)
        {
            category=0;
        }
        char gender='0';
        String genStr=request.getParameter("gender");
        if(genStr!=null && genStr.length()>0)
            gender=genStr.charAt(0);

        String[] size=request.getParameterValues("size");
        String[] color=request.getParameterValues("color");

        ProductModel prod=new ProductModel();
        CategoryModel cat= new CategoryModel();
        VariantModel variant= new VariantModel();
        GenderModel gend=new GenderModel();
        if(size!=null)
        request.setAttribute("sizeList", Arrays.asList(size));
        if(color!=null)
        request.setAttribute("colorList", Arrays.asList(color));

        try {
            request.setAttribute("products", prod.doSearch(q, category , gender , size, color, 0));
            request.setAttribute("categories", cat.doSearch(q, gender, size, color));
            request.setAttribute("colors", variant.doSearchColor(q, category , gender , size));
            request.setAttribute("sizes", variant.doSearchSize(q, category , gender , color));

            request.setAttribute("genders", gend.doSearch(q, category , size,color));

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/search.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}


