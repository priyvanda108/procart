package com.qsp.admin;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/addpro")
public class AddProduct extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String name = req.getParameter("productname");
			     double price = Double.parseDouble(req.getParameter("productprice"));
			     int cid = Integer.parseInt(req.getParameter("categoryid"));
			     Part  part   = req.getPart("photo");
			     InputStream inputStream = part.getInputStream();
			     try {
					FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
					Properties p = new Properties();
					p.load(f);
					Class.forName(p.getProperty("driverManagerPath"));
			Connection c=DriverManager.getConnection(p.getProperty("URL"), p);
				PreparedStatement pre=c.prepareStatement("insert into product (name,price,image,cid) values (?,?,?,?)");
					pre.setString(1, name);
					pre.setDouble(2, price);
					pre.setBinaryStream(3, inputStream,part.getSize());
					pre.setInt(4, cid);
					
				int a =	pre.executeUpdate();
				if(a>0) {
					req.getSession().setAttribute("productmsg", "Product Added Successfully!");
					RequestDispatcher rd= req.getRequestDispatcher("AddProduct.jsp");
					rd.forward(req, resp);
				}
				else {
					req.getSession().setAttribute("productmsg", "Product failed to add!");
					resp.sendRedirect("AddProduct.jsp");
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
}
