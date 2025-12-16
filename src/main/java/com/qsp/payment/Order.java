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

@WebServlet("/order")
public class Order extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    
		   HttpSession  s = req.getSession();
		        String name =(String)s.getAttribute("name");
		         String email =(String) s.getAttribute("email");
		    if(name!=null && email!=null) {
//		    	resp.getWriter().write("<html><body><h1>This is payment page </h1></body></html>");
		    	
		    	String paymentmode =  req.getParameter("method");
		    	
		    	int pid = Integer.parseInt(req.getParameter("pid"));
		    	double price = Double.parseDouble(req.getParameter("price"));
		    	String pname = req.getParameter("pname");
		  	    int userid = (int) s.getAttribute("userid");
		  	   
		        Connection c =null;
				try {
			 
			  
					FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
					Properties p = new Properties();
					p.load(f);
					String URL = p.getProperty("URL");
					Class.forName(p.getProperty("driverManagerPath"));
					c =DriverManager.getConnection(URL, p);
					PreparedStatement pre =c.prepareStatement("insert into payment (pid,name,price,order_status,userid,paymentmode)  values(?,?,?,?,?,?)");
					pre.setInt(1, pid);
					pre.setString(2, pname);
					pre.setDouble(3, price);
					pre.setString(4, "Order Success");
					pre.setInt(5, userid);
					pre.setString(6, paymentmode);
			     	int r =pre.executeUpdate();
			     	if(r>0) {
			     		req.setAttribute("ordermsg", "Order Successfully!");
				RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
							rd.forward(req, resp);
			     	}
			     	else {
			     		req.setAttribute("ordermsg", "Something went wrong");
						RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
									rd.forward(req, resp);
			     	}
			    
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
		    	
		    }
		    else {
		    	  RequestDispatcher rd=  req.getRequestDispatcher("LogIn.jsp");
		    	   rd.forward(req, resp);
		    }
	}

}
