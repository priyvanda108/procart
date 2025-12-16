package com.qsp.admin;

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

@WebServlet("/addcategory")
public class AddCategory extends HttpServlet{
				@Override
				protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					  String cname = req.getParameter("category");
					Connection c =null;
					try {
						FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
						Properties properties = new Properties();
						properties.load(f);
						String URL = properties.getProperty("URL");
						Class.forName(properties.getProperty("driverManagerPath"));
						c = DriverManager.getConnection(URL, properties);
						PreparedStatement p= c.prepareStatement("insert into category (cname) values(?)");
						p.setString(1, cname); 
						int a =p.executeUpdate();
						if(a>0) {
							req.setAttribute("categorymsg", "Category Added Successful!");
							RequestDispatcher rd=req.getRequestDispatcher("AddCategory.jsp");
							rd.forward(req, resp);
						}
						else {
							req.setAttribute("categorymsg", "Something went wrong");
							RequestDispatcher rd=req.getRequestDispatcher("AddCategory.jsp");
							rd.include(req, resp);
						}
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}
}
