package com.qsp.payment;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/paymentmode")
public class PaymentMode extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    
		   HttpSession  s = req.getSession();
		        String name =(String)s.getAttribute("name");
		         String email =(String) s.getAttribute("email");
		    if(name!=null && email!=null) {
		    	
//		    	resp.getWriter().write("<html><body><h1>This is payment page </h1></body></html>");
		    	
		    	int pid = Integer.parseInt(req.getParameter("pid"));
		    	double price = Double.parseDouble(req.getParameter("price"));
		    	String pname = req.getParameter("pname");
		  	    int userid = (int) s.getAttribute("userid");
		  	    
		  	    
		  	    req.setAttribute("pid", pid);
		  	    req.setAttribute("price", price);
		  	    req.setAttribute("pname", pname);
		  	    
		  	    
		  	   RequestDispatcher rd= req.getRequestDispatcher("PaymentMode.jsp");
		  	      rd.forward(req, resp);
		    } else {
		    	  RequestDispatcher rd=  req.getRequestDispatcher("LogIn.jsp");
		    	   rd.forward(req, resp);
		    }
	}

}
