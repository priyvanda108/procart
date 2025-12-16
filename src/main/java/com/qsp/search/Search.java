package com.qsp.search;

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

@WebServlet("/search")
public class Search extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		       String search = req.getParameter("search");
		         search = search.toLowerCase();
		        Connection c =null;
				try {
					FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
					Properties p = new Properties();
					p.load(f);
					String URL = p.getProperty("URL");
					Class.forName(p.getProperty("driverManagerPath"));
					c =DriverManager.getConnection(URL, p);
					PreparedStatement pre =c.prepareStatement("select name , price, pid from product where name like ?");
					pre.setString(1, "%"+search+"%");
			     
			     	ResultSet r =pre.executeQuery();
				
			   if(r.next()) {  	
					List<String[]> list = new ArrayList<>();

					while(r.next()){
			          String[] arr = new String[3];
			          arr[0] = r.getString("name");
			           arr[1] = r.getString("price");
			           arr[2] = r.getString("pid");
			          list.add(arr);
					}
			       		req.setAttribute("searchname", search);
				 	req.setAttribute("search", list);
			RequestDispatcher rd = req.getRequestDispatcher("Search.jsp");
					rd.forward(req, resp);
			   }
			   else {
		       		req.setAttribute("searchname", search);
				     req.setAttribute("invalid", "Sorry, Products not found.");
					RequestDispatcher rd = req.getRequestDispatcher("Search.jsp");
							rd.forward(req, resp);
			   }
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

	}

}
