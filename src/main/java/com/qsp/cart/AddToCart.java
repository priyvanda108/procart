package com.qsp.cart;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addtocart")
public class AddToCart extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			       String pid = req.getParameter("pid");
			       String pname = req.getParameter("pname");
			       String price = req.getParameter("price");
			       int cid = Integer.parseInt(req.getParameter("cid"));
			       
			       HttpSession  s = req.getSession();
			        String name =(String)s.getAttribute("name");
			         String email =(String) s.getAttribute("email");
			    if(name!=null && email!=null) {
			    	  int userid = (int) s.getAttribute("userid");
//			       resp.getWriter().write("<html><body><h1>"+pid+""+name+""+price+"</h1></body></html>");
			       
			       Connection c =null;
					try {
						FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
						Properties p = new Properties();
						p.load(f);
						String URL = p.getProperty("URL");
						Class.forName(p.getProperty("driverManagerPath"));
						c =DriverManager.getConnection(URL, p);
						PreparedStatement pre =c.prepareStatement("insert into cart (pid,name,price,userid) values (?,?,?,?)");
						pre.setInt(1, Integer.parseInt(pid));
						pre.setString(2, pname);
						pre.setDouble(3, Double.parseDouble(price));
						pre.setInt(4, userid);
						int r =pre.executeUpdate();
						
						 req.setAttribute("cartmsg", "Product added to cart successfully.");
						 
						 RequestDispatcher rd= req.getRequestDispatcher("category");
						   rd.include(req, resp);

					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}}
			       else {
					RequestDispatcher rd = req.getRequestDispatcher("LogIn.jsp");
					rd.forward(req, resp);
				}

		}
}
