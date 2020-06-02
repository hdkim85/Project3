<%@page import="model.MemberDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String id = request.getParameter("user_id");
System.out.println(id);

String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

//방법3 : Map 컬렉션에 회원정보 저장 후 반환받기

boolean ismember = dao.isMember(id);

System.out.println(ismember);
System.out.println(id);

//Map의 id키값에 저장된 값이 있는지 확인
if(ismember==false){
	
	out.println("<h6>아이디를 사용할 수 있습니다.<h6>");
	out.println("<input type='text' id='retype_id' size='15' value=" + id + " readonly/>");
	out.println("<input type='button' value='아이디 사용' class='btn btn-danger' id='idUse'/>");
	
}
else{
	out.println("<h6>중복되는 아이디가 있습니다.<h6>");
}

out.println("<h6>중복아이디 확인<h6>");
out.println("<input type='text' id='recheck_id' size='15' value=''>");
out.println("<input type='button' value='중복확인' class='btn btn-danger' id='dupCheck2'/>");


%>