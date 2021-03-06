<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	갬석후 파라미터 처리를 위한 추가부분
		: 리스트에서 검색 후 상세보기, 그리고 다시 리스트보기를
		눌렀을 때 검색이 유지되도록 처리하기위한 코드삽입
*/
String queryStr = "";
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null){
	queryStr = "searchColumn=" + searchColumn + "&searchWord" + searchWord + "&";
}

//3페이지에서 상세보기 했다면 리스트로 돌아갈때도 3페이지로 가야한다.
String nowPage = request.getParameter("nowPage");
queryStr += "&nowPage=" + nowPage;

//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);



//게시물의 조회수 +1 증가
dao.updateVisitCount(num);

BbsDTO dto = dao.selectView(num);

dao.close();
%>    



<%@include file="./include/head.jsp"  %>


<body id="page-top">

	
	<%@ include file="./include/top.jsp" %>	

	<div id="wrapper">

		<%@ include file="./include/left.jsp" %>

		<div id="content-wrapper">

			<div class="container-fluid">				

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Data Table Example
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성시간</th>
										<th>조회수</th>
									</tr>
								</thead>
								
								<tbody>
									
									
									<tr>
						<th class="text-center table-active align-middle">아이디</th>
						<td><%=dto.getId() %></td>
						<th class="text-center table-active align-middle">작성일</th>
						<td><%=dto.getPostDate() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td><%=dto.getName() %></td>
						<th class="text-center table-active align-middle">조회수</th>
						<td><%=dto.getVisitcount() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							<%=dto.getTitle() %>
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							<%-- 
							textarea에서 엔터키로 줄바꿈을 한 후 DB에 저장하면 \r\n으로
							저장되므로, HTML 페이지에서 출력할 때는 <br/>태그로 문자열을
							변경해야 한다.
							 --%>
							<%=dto.getContent().replace("\r\n", "<br/>") %>
						</td>
					</tr>
					<!-- <tr>
						<th class="text-center table-active align-middle">첨부파일</th>
						<td colspan="3">
							파일명.jpg <a href="">[다운로드]</a>
						</td>
					</tr> -->
									
									
									
								</tbody>
							</table>
							
							<div class="row mb-3">
				<div class="col-6">
				
					<!-- 수정, 삭제의 경우 특정게시물에 대해 수행하는 작업이므로 반드시
					게시물의 일련번호(PK)가 파라미터로 전달되어야 한다. -->
					<button type="button" class="btn btn-secondary" 
					onclick="location.href='BoardEdit.jsp?num=<%=dto.getNum()%>'">수정하기</button>
					<!-- 회원제게시판에서 삭제처리는 별도의 폼이 필요없이, 사용자에 대한
					인증처리만 되면 즉시 삭제처리한다. -->
					<button type="button" class="btn btn-success"
					onclick="isDelete();">삭제하기</button>

				</div>
				<div class="col-6 text-right pr-5">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn btn-warning" onclick="location.href='tablesList.jsp?<%=queryStr%>';">리스트보기</button>
				</div>
				<form name="deleteFrm">
					<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
				
				</form>
				
			</div>
				
				<script>
   
					function isDelete() {
						var c = confirm("삭제할까요?");
						
						if(c){
							var f = document.deleteFrm;
							f.method = "post";
							f.action = "DeleteProc.jsp";
							f.submit();
						}
					}
				</script>	
							
							
							
							
							
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>

			</div>
			<!-- /.container-fluid -->

<%@ include file="./include/footer.jsp" %>



