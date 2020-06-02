<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
String id_save = request.getParameter("id_save");

String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

Map<String, String> memberInfo= dao.getMemberMap(id, pw);
if(memberInfo.get("id")!=null){
	
	session.setAttribute("USER_ID", memberInfo.get("id"));
	session.setAttribute("USER_PW", memberInfo.get("pass"));
	session.setAttribute("USER_NAME", memberInfo.get("name"));
		
	if(id_save == null){
		Cookie ck = new Cookie("USER_ID", "");
		ck.setPath(request.getContextPath());
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
	else{
		Cookie ck = new Cookie("USER_ID", id);
		System.out.println(request.getContextPath());
		ck.setPath(request.getContextPath());
		ck.setMaxAge(60*60*24*100);
		response.addCookie(ck);
	}
	
	response.sendRedirect("../main/main.do");
}
else{
	request.setAttribute("ERROR_MSG", "넌 회원이 아니시군-_-;");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}
 





 
 
 
 
 
 
 
%>

