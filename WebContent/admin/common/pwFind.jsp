<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("user_id");
String name = request.getParameter("user_name");
String email = request.getParameter("email");

System.out.print(email);


String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

String pw = dao.pwFind(id, name, email);

System.out.print(pw);

if(pw==null || pw.equals("")){ %>

	<script>
		alert("일치하는 회원정보가 없습니다.");
		history.go(-1);
	</script>

<% } else{


		SMTPAuth smtp = new SMTPAuth();
		
		
		Map<String, String> emailContent = new HashMap<String, String>();
		emailContent.put("from", "likeasun77@naver.com");
		emailContent.put("to", email);
		emailContent.put("subject", "요청하신 비밀번호를 전송하여 드립니다.");
		emailContent.put("content", id + "님의 비밀번호는" + pw + "입니다.");

		boolean emailResult = smtp.emailSending(emailContent);
		if(emailResult==true){%>
			<script>
				alert("입력하신 이메일로 비밀번호가 발송되었습니다.");				
			</script>
<%
			System.out.print("비밀번호메일발송성공");
			}
		else{
			System.out.print("비밀번호메일발송실패");
			}
		
		response.sendRedirect("../id_pw.jsp");			
		}
		
		

%>

