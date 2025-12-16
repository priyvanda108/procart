package com.qsp.payment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/goback")
public class GoBack extends HttpServlet{
				@Override
				protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					 HttpSession s= req.getSession();
					s.setAttribute("gobackmsg", "Order not placed.");
					RequestDispatcher rd = req.getRequestDispatcher("displaycart");
					rd.forward(req, resp);
				}
}
