<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//폼값 받기 - 파라미터로 전달된 게시물의 일련번호
	String num = request.getParameter("num");
	BbsDAO dao = new BbsDAO(application);

	BbsDTO dto = dao.selectView(num);

	dao.close();
%>



<%@include file="./include/head.jsp"%>


<body id="page-top">


	<%@ include file="./include/top.jsp"%>

	<div id="wrapper">

		<%@ include file="./include/left.jsp"%>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Data Table Example
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<h3>
								게시판 - <small>Edit(수정)</small>
							</h3>
							<script>
								//유기명함수
								function checkValidate(frm) {

									if (frm.title.value == "") {
										alert("제목을 입력하세요");//경고창 띄움
										frm.title.focus();//입력란으로 포커스 이동
										return false;//전송되지 않도록 이벤트 리스너로 false반환
									}
									if (frm.content.value == "") {
										alert("내용을 입력하세요");
										frm.content.focus();
										return false;
									}
									return true;
								}

								//무기명함수
								var checkValidate2 = function(frm) {
									//실행부는 유기명함수와 동일함
								}
							</script>
							<div class="row mt-3 mr-1">
								<table class="table table-bordered table-striped">
									<form action="EditProc.jsp" name="writeFrm" method="post"
										onsubmit="return checkValidate(this);">


										<input type="hidden" name="num" value="<%=dto.getNum()%>" />

										<colgroup>
											<col width="20%" />
											<col width="*" />
										</colgroup>
										<tbody>

											<tr>
												<th class="text-center" style="vertical-align: middle;">제목</th>
												<td><input type="text" class="form-control"
													name="title" value="<%=dto.getTitle()%>" /></td>
											</tr>
											<tr>
												<th class="text-center" style="vertical-align: middle;">내용</th>
												<td><textarea rows="10" name="content"
														class="form-control"><%=dto.getContent()%></textarea></td>
											</tr>

										</tbody>
								</table>
							</div>
							<div class="row mb-3">
								<div class="col text-right">

									<button type="submit" class="btn btn-danger">전송하기</button>
									<button type="reset" class="btn btn-dark">Reset</button>
									<button type="button" class="btn btn-warning"
										onclick="location.href='tablesList.jsp?nowPage=${param.nowPage }';">
										리스트보기</button>
								</div>
								</form>
							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="card-footer small text-muted">Updated yesterday at
				11:59 PM</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	<%@ include file="./include/footer.jsp"%>