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

@WebServlet("/adminpayment")
public class AdminPayment extends HttpServlet {
			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			Connection c =null;
			try {
				FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
				Properties properties = new Properties();
				properties.load(f);
				String URL = properties.getProperty("URL");
				Class.forName(properties.getProperty("driverManagerPath"));
				c = DriverManager.getConnection(URL, properties);
				PreparedStatement p= c.prepareStatement("select p.userid, c.name , p.pid , p.name,p.price,p.order_status, p.paymentmode from customers c inner join payment p on c.userid=p.userid");
				ResultSet r = p.executeQuery();
				List<String[]> list = new ArrayList<String[]>();
				while (r.next()) {
				  String[] arr = new String[7];
				  arr[0] = r.getString(1);
				  arr[1] = r.getString(2);
				  arr[2] = r.getString(3);
				  arr[3] = r.getString(4);
				  arr[4] = r.getString(5);
				  arr[5] = r.getString(6);
				  arr[6] = r.getString(7);
				
				  list.add(arr);
				}
				req.setAttribute("list", list);
				RequestDispatcher rd =    req.getRequestDispatcher("Payments.jsp");
				rd.forward(req, resp);
			 
			 if(list.isEmpty()) {
				 req.setAttribute("usernot", "User not found");
				 RequestDispatcher rd1=	req.getRequestDispatcher("Customers.jsp");
				 rd1.forward(req, resp);
			 }
			 
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}

}
