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

@WebServlet("/remove")
public class Remove extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		       String cartid = req.getParameter("cartid");
		        Connection c =null;
				try {
					FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
					Properties p = new Properties();
					p.load(f);
					String URL = p.getProperty("URL");
					Class.forName(p.getProperty("driverManagerPath"));
					c =DriverManager.getConnection(URL, p);
					PreparedStatement pre =c.prepareStatement("delete from cart where cartid=?");
					pre.setInt(1, Integer.parseInt(cartid));
			     	int r =pre.executeUpdate();
				RequestDispatcher rd = req.getRequestDispatcher("displaycart");
							rd.forward(req, resp);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

	}
}
