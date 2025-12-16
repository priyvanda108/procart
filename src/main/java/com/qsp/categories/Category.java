package com.qsp.categories;

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

@WebServlet("/category")
public class Category extends HttpServlet{
				@Override
				protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					int cid = Integer.parseInt(req.getParameter("cid"));
					Connection c =null;
					try {
						FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
						Properties p = new Properties();
						p.load(f);
						String URL = p.getProperty("URL");
						Class.forName(p.getProperty("driverManagerPath"));
						c =DriverManager.getConnection(URL, p);
						PreparedStatement pre =c.prepareStatement("select pid, name,price,cname from product inner join category on product.cid=category.cid where category.cid =?");
						pre.setInt(1, cid);
						ResultSet r =pre.executeQuery();
						List<String[]> list = new ArrayList<>();
                        String cname = "";
						while(r.next()){
				  String[] arr = new String[3];
				 arr[0] = r.getString("name");
				 arr[1] = r.getString("price");
				 arr[2] = r.getString("pid");
				  cname= r.getString("cname");
				 list.add(arr);
						}
						req.setAttribute("cid", cid);
						 req.setAttribute("cname", cname);
						req.setAttribute("l", list);
				RequestDispatcher rd = req.getRequestDispatcher("Category.jsp");
						rd.forward(req, resp);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}

				}
}
