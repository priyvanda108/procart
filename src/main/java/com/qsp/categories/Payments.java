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
import javax.servlet.http.HttpSession;

@WebServlet("/myorder")
public class Payments extends HttpServlet{
				
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		       
		List<String[]> list = new ArrayList<>();
		       Connection c =null;
				try {
					HttpSession  s = req.getSession();
			        String name =(String)s.getAttribute("name");
			         String email =(String) s.getAttribute("email");
			       
			    if(name!=null && email!=null) {
			       int userid = (int) s.getAttribute("userid");
					FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
					Properties p = new Properties();
					p.load(f);
					String URL = p.getProperty("URL");
					Class.forName(p.getProperty("driverManagerPath"));
					c =DriverManager.getConnection(URL, p);
					PreparedStatement pre =c.prepareStatement("select pid,name, price,order_status from payment where userid =?");
				    pre.setInt(1, userid);
					ResultSet r =pre.executeQuery();
					
					
              
					while(r.next()){
						String[] arr = new String[4];
						arr[0] = r.getString("pid");
						arr[1] =  r.getString("name");
							arr[2] = r.getString("price");
							arr[3] = r.getString("order_status");
							list.add(arr);
						}
			    }
					if(list.isEmpty()) {
						
						RequestDispatcher rd = req.getRequestDispatcher("EmptyPayment.jsp");
								rd.forward(req, resp);
					}
					else {
						req.setAttribute("orders", list);
					RequestDispatcher rd = req.getRequestDispatcher("MyOrders.jsp");
							rd.forward(req, resp);
					}		
                
               
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

	}

}
