<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/global_head.jsp" %>


 <body>
 	
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				
				
				<div class="idpw_box">				
					<form action="./common/idFind.jsp" method="post">
					<div class="id_box">
						<ul>
							<li><input type="text" name="user_name" value="" class="login_input01" /></li>
							<!-- 주민번호 대신 이메일주소를 사용 -->
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						<input type="image" src="../images/member/id_btn01.gif" name="submit" class="id_btn"/>
						
						<a href="join01.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					</form>
					<form action="./common/pwFind.jsp" method="post">
					<div class="pw_box">
						<ul>
							<li><input type="text" name="user_id" value="" class="login_input01" /></li>
							<li><input type="text" name="user_name" value="" class="login_input01" /></li>
							<!-- 주민번호 대신 이메일주소를 사용 -->
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						<input type="image" src="../images/member/id_btn01.gif" name="submit" class="pw_btn" />
					</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
