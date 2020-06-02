<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String name = (String)request.getParameter("user_name");
String email = (String)request.getParameter("email");

System.out.println(name);

String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

String id = dao.idFind(name, email);

System.out.println("afterDAO: "+id);

if(id==null || id.equals("")){

%>

<script>
	alert("일치하는 아이디가 없습니다.");
	history.go(-1);
</script>
<%} else{%>
<script>
	alert("아이디는'" + <%= id%> + "'입니다.");
	history.go(-1);
</script>
<%} %>






