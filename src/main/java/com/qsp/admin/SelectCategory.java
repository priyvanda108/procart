package com.qsp.admin;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/selectcategory")
public class SelectCategory extends HttpServlet{
				@Override
				protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					Connection c =null;
					try {
						FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
						Properties p = new Properties();
						p.load(f);
						String URL = p.getProperty("URL");
						Class.forName(p.getProperty("driverManagerPath"));
						c =DriverManager.getConnection(URL, p);
						PreparedStatement pre =c.prepareStatement("select cid , cname from category");
						ResultSet r =pre.executeQuery();
						
						List<String[]> list = new ArrayList<>();

						while(r.next()){
				  String[] arr = new String[2];
				 arr[0] = r.getString("cid");
				   arr[1] = r.getString("cname");
				 list.add(arr);
						}
						HttpSession s = req.getSession();
						s.setAttribute("l", list);
				RequestDispatcher rd = req.getRequestDispatcher("AddProduct.jsp");
						rd.forward(req, resp);

						
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
}
