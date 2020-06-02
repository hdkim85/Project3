<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<%


if(request.getParameterValues("agreement1")==null){	
	
	response.sendRedirect("join01.jsp");
}

%>


<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr += extraAddr;            
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.                       
            
            document.getElementsByName("zip")[0].value = data.zonecode;
            document.getElementsByName("addr1")[0].value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementsByName("addr2")[0].focus();
        }
    }).open();
}
	
	
	
	
	
	

	function checkValidate(fn) {

		if (fn.name.value == "") {
			alert("이름을 입력하세요");
			fn.name.focus();
			return false;
		}

		if (fn.idchecked.value == "0") {
			alert("아이디를 입력하고 중복확인하세요");
			fn.id.focus();
			return false;
		}
		
		if (fn.pass.value == "") {
			alert("비밀번호를 입력하세요");
			fn.pass.focus();
			return false;
		}
		if (fn.pass2.value == "") {
			alert("비밀번호를 입력하세요");
			fn.pass2.focus();
			return false;
		}
		if (fn.pass.value != fn.pass2.value) {
			alert("비밀번호가 일치하지 않습니다.")
			fn.pass2.focus();
			return false;
		}

		if (fn.tel1.value == "") {
			alert("전화번호를 입력하세요");
			fn.tel1.focus();
			return false;
		}
		if (fn.tel2.value == "") {
			alert("전화번호를 입력하세요");
			fn.tel2.focus();
			return false;
		}
		if (fn.tel3.value == "") {
			alert("전화번호를 입력하세요");
			fn.tel3.focus();
			return false;
		}		
		for(i=0 ; i<fn.tel1.length; i++){
        	if(!(fn.tel1.value.charCodeAt(i)>=48 && fn.tel1.value.charCodeAt(i)<=71)){
        		alert("전화번호는 숫자만 입력 가능합니다.");
        		break;
        	}        	
        }
		for(i=0 ; i<fn.tel2.length; i++){
        	if(!(fn.tel1.value.charCodeAt(i)>=48 && fn.tel1.value.charCodeAt(i)<=71)){
        		alert("전화번호는 숫자만 입력 가능합니다.");
        		break;
        	}        	
        }
		for(i=0 ; i<fn.tel3.length; i++){
        	if(!(fn.tel1.value.charCodeAt(i)>=48 && fn.tel1.value.charCodeAt(i)<=71)){
        		alert("전화번호는 숫자만 입력 가능합니다.");
        		break;
        	}        	
        }
		
		
		if (fn.mobile1.value == "") {
			alert("전화번호를 입력하세요");
			fn.tel1.focus();
			return false;
		}
		if (fn.mobile2.value == "") {
			alert("전화번호를 입력하세요");
			fn.tel2.focus();
			return false;
		}
		if (fn.mobile3.value == "") {
			alert("전화번호를 입력하세요");
			fn.tel3.focus();
			return false;
		}		
		for(i=0 ; i<fn.mobile1.length; i++){
        	if(!(fn.mobile1.value.charCodeAt(i)>=48 && fn.mobile1.value.charCodeAt(i)<=71)){
        		alert("전화번호는 숫자만 입력 가능합니다.");
        		break;
        	}        	
        }
		for(i=0 ; i<fn.mobile2.length; i++){
        	if(!(fn.mobile2.value.charCodeAt(i)>=48 && fn.mobile2.value.charCodeAt(i)<=71)){
        		alert("전화번호는 숫자만 입력 가능합니다.");
        		break;
        	}        	
        }
		for(i=0 ; i<fn.mobile3.length; i++){
        	if(!(fn.tel3.value.charCodeAt(i)>=48 && fn.mobile3.value.charCodeAt(i)<=71)){
        		alert("전화번호는 숫자만 입력 가능합니다.");
        		break;
        	}        	
        }
		
		

		if (fn.email1.value == "") {
			alert("이메일주소를 입력하세요");
			fn.email1.focus();
			return false;
		}
				
		if (fn.zip.value == "") {
			alert("우편번호를 입력하세요");
			return false;
		}
		if (fn.addr1.value == "") {
			alert("주소를 입력하세요");
			return false;
		}
		if (fn.addr2.value == "") {
			alert("상세주소를 입력하세요");
			return false;
		}

		return true;

	}
	
	
	$(function(){
		$('#dupCheck1').click(function(){
			var id = $('#id')
			console.log(id.val())
		    for(i=0 ; i<id.val().length; i++){
		    	if(!((id.val().charCodeAt(i)>=48 
		    			&& id.val().charCodeAt(i)<=71) 
		    			|| (id.val().charCodeAt(i)>=97 
		    					&& id.val().charCodeAt(i)<=122))){
		    		alert("아이디는 4자 이상 12자 이내의 영문/숫자 조합만 가능합니다.");
		    		return;
		    	}        	
		    }
		    
		    if (id.val() == "") {
		        alert("아이디를 입력후 중복확인을 눌러주세요");
		        id.focus();
		    }
		    else if(id.val().length<4 || id.val().length>12){
		    	alert("아이디는 4자 이상 12자 이내의 영문/숫자 조합만 가능합니다.");
		    }         
		    else {
				$.ajax({
					url : "./common/id_check.jsp",
					dataType : "html",
					type : "post",
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					data : {
						user_id : $('#id').val()
					},
					success : sucDup,
					error : errFunc
				});		
	    	}
		});
		/* on을 이용하면 동적태그에서 동작하도록 할 수 있을것(안되면 동적 버튼 작동법 찾아보기) */
				
		$('#mo-cont').on('click', '#dupCheck2', 
				function(){
			var id = $('#recheck_id')
			console.log(id.val())
		    for(i=0 ; i<id.val().length; i++){
		    	if(!((id.val().charCodeAt(i)>=48 
		    			&& id.val().charCodeAt(i)<=71) 
		    			|| (id.val().charCodeAt(i)>=97 
		    					&& id.val().charCodeAt(i)<=122))){
		    		alert("아이디는 4자 이상 12자 이내의 영문/숫자 조합만 가능합니다.");
		    		return;
		    	}        	
		    }
		    
		    if (id.val() == "") {
		        alert("아이디를 입력후 중복확인을 눌러주세요");
		        id.focus();
		    }
		    else if(id.val().length<4 || id.val().length>12){
		    	alert("아이디는 4자 이상 12자 이내의 영문/숫자 조합만 가능합니다.");
		    }         
		    else {
				$.ajax({
					url : "./common/id_check.jsp",
					dataType : "html",
					type : "post",
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					data : {
						user_id : id.val()
					},
					success : sucFunc,
					error : errFunc
				});		
	    	}
		});
		
		$('#mo-cont').on('click', '#idUse', function(){
			$('#id').val($('#retype_id').val());			
			$('#idchecked').val("1");
			console.log($('#idchecked').val());
			$('#idCheck').modal("hide");
			
		});
	
	});
		

	
	function sucDup(resData){
		console.log(resData);
		$('#mo-cont').html(resData);
		$('#idCheck').modal('show');				
	}
	
	function sucFunc(resData){
		console.log(resData);
		$('#mo-cont').html(resData);
	}

	function errFunc(){
		alert("에러발생. 디버깅하세욤.");
	}
	
	
	
	
	
	
	
	function email_input(obj){
		
		var sel = $('#last_email_check2 option:selected').val();
		
		console.log(sel);
		
		if(obj.value==''){
			$('#email2').val('');
			$('#email2').attr('readonly', false);			
		}
		else if (obj.value== '1'){
			
			$('#email2').attr('readonly', false);
			$('#email2').val('');
			$('#email2').focus();
		}		
		else{
			$('#email2').attr('readonly', true);
			$('#email2').val(sel);
		}		
	}
	

	
	
</script>

<!-- <link rel="stylesheet" href="../common/bootstrap4.4.1/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 <body>
	<div class="justify-content-center">
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>
				
				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<!-- 회원정보 테이블 -->
				<form action="../member/join"  name="joinFrm" method="post" onsubmit="return checkValidate(this);">
				<input type="hidden" name="idchecked" id="idchecked" value="0"/>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr>
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit002.gif" /></th>						
											
						
						<td>
						
						<!-- 중복확인창 -->						
						<input type="text" id="id" name="id" value="" class="join_input" />&nbsp;
						<!-- <a href="#"  id="dupCheck1" style="cursor:hand;"> -->
						중복
						<img src="../images/btn_idcheck.gif" alt="중복확인" id="dupCheck1" style="cursor:hand;"/>
						<!-- </a> -->
		
					
					
					&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합하여 공백
										없이 기입</span>


								</td>

									
					</tr>
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass" value="" class="join_input" />&nbsp;&nbsp;<span>* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" value="" class="join_input" /></td>
					</tr>
					

					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel3" value="" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" value="" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile2" value="" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile3" value="" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
						<input type="text" name="email1" style="width:100px;height:20px;border:solid 1px #dadada;" value="" /> @ 
						<input type="text" name="email2" id = "email2" style="width:150px;height:20px;border:solid 1px #dadada;" value="" />
						
						<select name="last_email_check2" onChange="email_input(this);" class="pass" id="last_email_check2" >
							<option selected="" value="">선택해주세요</option>
							<option value="1" >직접입력</option>
							<option value="gmail.com" >gmail.com</option>
							<option value="naver.com" >naver.com</option>
							<option value="hanmail.net" >hanmail.net</option>
							<option value="nate.com" >nate.com</option>
						</select>
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr>
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="zip" value=""  class="join_input" style="width:100px;" />
						<a href="javascript:;" title="새 창으로 열림" onclick="DaumPostcode();">[우편번호검색]</a>
						<br/>
						
						<input type="text" name="addr1" value=""  class="join_input" style="width:550px; margin-top:5px;" /><br>
						<input type="text" name="addr2" value=""  class="join_input" style="width:550px; margin-top:5px;" />
						
						</td>
					</tr>
				</table>
				
				<p style="text-align:center; margin-bottom:20px">
				<input type="image" src="../images/btn01.gif" name="submit" />
				&nbsp;&nbsp;
				<a href="javascript:history.back();"><img src="../images/btn02.gif" /></a></p>
				
			</div>
			</form>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</div>
	
	

<!-- modal id중복 -->
		<div class="modal fade" id="idCheck" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
		
						<!-- Change class .modal-sm to change the size of the modal -->
			<div class="modal-dialog modal-sm" role="document">
		
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title w-100" id="myModalLabel">중복아이디
							체크</h4>
		
		
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="mo-cont">
							
						</div>
		
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal">Close</button>
		
					</div>
				</div>
			</div>
		</div>




</body>
</html>
