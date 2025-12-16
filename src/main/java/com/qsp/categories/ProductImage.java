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
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/proimg")
public class ProductImage extends HttpServlet{
			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			  int cid = Integer.parseInt(req.getParameter("cid"));
//			  System.out.println(cid);
			  
				Connection c =null;
				try {
					FileInputStream f = new FileInputStream("D:\\Jdbc\\ProCart\\db.properties");
					Properties p = new Properties();
					p.load(f);
					String URL = p.getProperty("URL");
					Class.forName(p.getProperty("driverManagerPath"));
					c =DriverManager.getConnection(URL, p);
					PreparedStatement pre =c.prepareStatement("select image from product where pid=?");
					pre.setInt(1, cid);
					
					 ResultSet executeQuery= pre.executeQuery();
				     if(executeQuery.next()) {
				    	   byte[] bytes= executeQuery.getBytes("image");
				    	   
				    	   resp.setContentType("image/jpeg");
				    	   resp.setContentLength(bytes.length);
				    	   
				    	        ServletOutputStream outputStream =  resp.getOutputStream();
				    	        outputStream.write(bytes);
				    	        outputStream.flush();
				    	        outputStream.close();
				     }
				
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}


			}
}
