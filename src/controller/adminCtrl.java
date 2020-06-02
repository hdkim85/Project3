package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class adminCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("grade")=="0") {
			req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
		}
		
		
		
	}

}
