package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mariadb.jdbc.MariaDbConnection;

import com.sun.net.httpserver.HttpContext;

import model.MemberDAO;
import model.MemberDTO;

public class joinCtrl extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		String drv = getServletContext().getInitParameter("MariaJDBCDriver");
		String url = getServletContext().getInitParameter("MariaConnectURL");
		
		MemberDAO dao = new MemberDAO(drv, url);
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String tel1 = req.getParameter("tel1");
		String tel2 = req.getParameter("tel2");
		String tel3 = req.getParameter("tel3");
		String mobile1 = req.getParameter("mobile1");
		String mobile2 = req.getParameter("mobile2");
		String mobile3 = req.getParameter("mobile3");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String postalCode = req.getParameter("zip");
		String address1 = req.getParameter("addr1");
		String address2 = req.getParameter("addr2");
		String[] openemail = req.getParameterValues("open_email");
		System.out.println(req.getParameterValues("open_email"));
		//openemail 문제 해결해야함
//		System.out.println(openemail[0]);
		
		
		String phone = tel1 + tel2 + tel3;
		String hp = mobile1 + mobile2 + mobile3;
		String email = email1 + email2;
		
		MemberDTO dto = new MemberDTO();
		
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setHp(hp);
		dto.setEmail(email);
		dto.setPostalCode(postalCode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);		
		if(openemail==null) {
			dto.setOpenemail("0");
		}else {
			
			dto.setOpenemail("1");
		}
		
		int affected = dao.genMemberRegist(dto);
		
		System.out.println("회원가입 성공:" + affected);
		
		if (affected>0) {
			resp.sendRedirect("../main/main.do");
			
		}
		else {
			resp.sendRedirect("join02.jsp");
			
		}
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
		
	}
}
