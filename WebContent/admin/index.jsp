<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

String grade = (String)session.getAttribute("GRADE");

System.out.println(grade);


if(grade==null || grade.equals("1")){
	request.getRequestDispatcher("login.jsp").forward(request, response);
}


%>


<%@ include file="./include/head.jsp" %>



<body id="page-top">

	
	<%@ include file="./include/top.jsp" %>

	<div id="wrapper">

		<%@ include file="./include/left.jsp" %>
									
		<%@ include file="./adminBoard/tablesList.jsp" %>


		<%@ include file="./include/footer.jsp" %>

	</div>
</body>