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

@WebServlet("/login")
public class LogIn extends HttpServlet{
				@Override
				protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
				  PreparedStatement p=     c.prepareStatement("select userid ,name , password from customers where email=?");
				          p.setString(1, email);
				          
				          ResultSet r = p.executeQuery();
				          if(r.next()) {
				        	  String pass = r.getString("password");
				                String name = r.getString("name");
				                int userid = r.getInt("userid");
				          if (!pass.equals(password)) {
				            req.setAttribute("passwordmsg", "Incorrect password. Please try again.");
				                    req.getRequestDispatcher("LogIn.jsp").include(req, resp);
				                } 
				                else {
				             HttpSession session = req.getSession();
				                 session.setAttribute("userid",userid );
				                session.setAttribute("name", name);
	                     session.setAttribute("email", email);
                       req.setAttribute("loginmsg", "Login successful!");
				      req.getRequestDispatcher("index.jsp").forward(req, resp);
				                }
				          } 
				          else {
				        	  req.setAttribute("emailmsg", "Email not found! Please go for SignIn");
				                req.getRequestDispatcher("LogIn.jsp").include(req, resp);
				        
				          }
						
					} catch (ClassNotFoundException | SQLException e) {
						e.printStackTrace();
					} 

				}
}
