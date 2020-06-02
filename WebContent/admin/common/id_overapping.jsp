<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

boolean idCheck = (boolean)request.getAttribute("id_check");
String user_id = (String)request.getAttribute("USER_ID");

%>    


<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>id_overapping.jsp</title>
</head>
<script>
	/* 
	자식창에서 opener속성으로 부모창으로 데이터를 전송한다.
	부모창의 아이디 입력필드가 readonly로 변경되었으므로 JS를 통해
	값을 변경해야 한다.
	*/
	function idUse() {
		opener.document.joinFrm.id.value =
			document.overlapFrm.retype_id.value;
		
		opener.document.joinFrm.idchecked.value = '1';
		self.close();
	}
	
	function id_check_person() {
        //중복체크시 입력된 아이디가 없다면
        var id = document.getElementById("id");
        
        for(i=0 ; i<id.lenth; i++){
        	if(!((id.charCodeAt(i)>=48 && id.charCodeAt(i)<=71) || (id.charCodeAt(i)>=97 && id.charCodeAt(i)<=122))){
        		alert("아이디는 4자 이상 12자 이내의 영문/숫자 조합만 가능합니다.");
        		break;
        	}        	
        }  
        
        if (id.value == "") {
            alert("아이디를 입력후 중복확인을 눌러주세요");
            id.focus();
        }
        else if(id.value.length<4 || id.value.length>12){
        	alert("아이디는 4자 이상 12자 이내의 영문/숫자 조합만 가능합니다.");
        }         
        else {
            location.href="id_check.jsp?id="+id.value
            
        }
    }
	
	
</script>

<body>
	<h2>아이디 중복확인</h2>
	<!-- 
		파라미터로 전달된 아이디를 브라우저에 출력한다.
		차후 JDBC연동을 통해 회원테이블을 확인하게 된다.
	 -->
	 <%
	 if(idCheck==true){	 
	 %>	 
	 
	 <h3>중복되는 아이디가 있습니다. 다른 아이디를 입력하세요.</h3>	 
	 
	 <%
	 }
	 else{		 
	 %>
	 
	<h3>입력한 아이디: <%= user_id %></h3>
	<h3>아이디를 사용할 수 있습니다. 사용하시겠습니까?</h3>
	<form name="overlapFrm" action="">
		아이디 사용하기
		<input type="text" name="retype_id" size="20" value="<%= user_id%>" readonly>
		<input type="button" value="아이디사용하기" onclick="idUse();">
		<br /><br />
	</form>
	
	<h3>다른 아이디 사용하기</h3>
	
	<%
	 }
	%>
	
	
	<form name="checkFrm" action="id_check.jsp" method="post">
	중복체크하기
	<input type="text" id="id" size="20" value="">
	<input type="button" value="중복체크하기" onclick="id_check_person();">	 
	</form>
	
	
	
</body>

</html>