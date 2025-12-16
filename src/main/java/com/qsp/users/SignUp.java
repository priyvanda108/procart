package com.qsp.users;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signup")
public class SignUp extends HttpServlet{
				@Override
				protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					String name = req.getParameter("name");
					String email = req.getParameter("email");
					String password = req.getParameter("password");
					
					Connection c =null;
					try {
						FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
						Properties properties = new Properties();
						properties.load(f);
						String driverClassPath = properties.getProperty("driverManagerPath");
						
						Class.forName(driverClassPath);
						String url = properties.getProperty("URL");
						c=DriverManager.getConnection(url, properties);
						 
					PreparedStatement p1 =	c.prepareStatement("select email from customers where email=?");
					                 p1.setString(1, email);	
					              ResultSet r=   p1.executeQuery();
					           
					              if(r.next()) {
					            	  req.setAttribute("sameuser", "You have already Registered! Please go for LogIn");
					            	  RequestDispatcher rd = req.getRequestDispatcher("SignUp.jsp");
					            	     rd.include(req, resp);
					              }
					              else {
					PreparedStatement p=	c.prepareStatement("insert into customers (name,email,password) values (?,?,?)");
					  p.setString(1, name);
					  p.setString(2, email);
					  p.setString(3, password);
					 int a =  p.executeUpdate();
					 if(a>0) {
						         HttpSession s= req.getSession();
						         s.setAttribute("name", name);
						         s.setAttribute("email", email);
						         s.setAttribute("password", password);
						         req.setAttribute("signupmsg", "Sign up successful!");
						        RequestDispatcher rd = req.getRequestDispatcher("LogIn.jsp");
						        rd.forward(req, resp);
					 }
					 else {
						 resp.getWriter().write("<html><body><h1>Something went wrong</h1></body></html>");
					 }
					 }
					} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
					}
					
				}
}
