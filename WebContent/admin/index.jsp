<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%@ include file="./include/head.jsp" %>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<!-- 아이콘 -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<body id="page-top">

	
	<%@ include file="./include/top.jsp" %>

	<div id="wrapper">

		<%@ include file="./include/left.jsp" %>
									
		<%@ include file="./adminBoard/tables.jsp" %>


		<%@ include file="./include/footer.jsp" %>

	</div>
</body>