<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 11.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">취업지원</a></li>
			<li class="breadcrumb-item active" aria-current="page">이력서/자기소개서</li>
		</ol>
	</nav>

	<section class="section">
		<div class="card">
			<div class="card inputTable">
				<div class="card-body">
					<p>※ 첨삭을 원하는 이력서 또는 자기소개서를 첨부하여 신청해주시기 바랍니다.</p>
					<form method="post" enctype="multipart/form-data" id="submitForm">
						<input type="hidden" name="stdnt_no" value="${mypage.stdnt_no }" />
						<input type="hidden" name="edit_req_no"
							value="${editReq.edit_req_no }" /> <input type="hidden"
							name="atch_file_no" value="${editReq.atch_file_no }" />
						<table class="table table-bordered table-md"
							style="border-color: #dfdfdf;">
							<tr>
								<th class="align-middle text-center">학번</th>
								<td class="align-middle">${mypage.stdnt_no }</td>
								<th class="align-middle text-center">이름</th>
								<td class="align-middle">${mypage.name }</td>
							</tr>
							<tr>
								<th class="align-middle text-center">학과</th>
								<td class="align-middle">${subject.sub_name }</td>
								<th class="align-middle text-center">학년</th>
								<td class="align-middle">${mypage.grade }학년</td>
							</tr>
							<tr>
								<th class="align-middle text-center">제목</th>
								<td colspan="3"><input type="text" class="form-control"
									name="req_title" value="${editReq.req_title }"></td>
							</tr>
							<tr>
								<th class="align-middle text-center">내용</th>
								<td colspan="3"><textarea class="form-control" rows="5"
										cols="5000" name="req_cont" id="cont">${editReq.req_cont }</textarea>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">이력서/자기소개서<br />원본파일
								</th>
								<td colspan="3" class="text-left"><c:forEach
										items="${editReq.attachList }" var="attach">
										<div class="ml-2 fileArea">
											<c:url value="/lms/resumeDownload.do" var="downloadURL">
												<c:param name="atch_file_no" value="${attach.atch_file_no }" />
												<c:param name="atch_file_seq"
													value="${attach.atch_file_seq }" />
											</c:url>
											<p class="fileBox col-lg-6">
												<a href="${downloadURL }" class="text-color"
													data-attno="${attach.atch_file_seq }">${attach.file_nm}</a>
												<span class="delBtn btn btn-danger">-</span>
											</p>
										</div>
									</c:forEach></td>
							</tr>
						</table>
						<h6 class="m-b-20">
							<i class="fa fa-paperclip m-r-5 f-s-18"></i> 이력서 / 자기소개서
						</h6>

						<div class="form-inline fileArea row">
							<p class="fileBox col-lg-6">
								<input class="form-control" type="file" name="common_files">
								<span class="plusBtn btn btn-secondary">+</span>
							</p>
						</div>
						<div class="text-center mt-3">
							<a href="${cPath }/lms/resume.do" class="btn btn-light-secondary">취소</a>
							<button id="saveBtn" type="button" class="btn btn-primary">저장</button>
							<!-- update 시에만 나타나는 버튼 -->
							<c:if test="${not empty bo_no }">
								<input type="hidden" name="state" value="update" />
								<button type="button" class="btn btn-danger block"
									data-bs-toggle="modal" data-bs-target="#default">삭제</button>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!--Basic Modal -->
	<div class="modal fade text-left" id="default" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel1">게시글 삭제</h5>
					<button type="button" class="close rounded-pill"
						data-bs-dismiss="modal" aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<form id="deleteForm" action="${cPath}/lms/resumeDelete.do"
						method="post">
						<input type="hidden" name="edit_req_no" value="${editReq.edit_req_no }">
						<c:if test="${not empty editReq.attachList }">
							<input type="hidden" name="atch_file_no" value="${editReq.atch_file_no}">
							<c:forEach items="${editReq.attachList }" var="attach">
								<input type="hidden" name="delAttNos" value="${attach.atch_file_seq }">
							</c:forEach>
						</c:if>
						<p>
							삭제한 게시글은 복원이 불가합니다.<br /> 삭제하시겠습니까?
						</p>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  btn-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
					<button id="realDelBtn" type="button" class="btn btn-primary ml-1"
						data-bs-dismiss="modal">
						<i class="bx bx-check d-block d-sm-none"></i> <span
							class="d-none d-sm-block">삭제</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- contents end -->
</div>
<script type="text/javascript"
	src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace("cont", {
		filebrowserUploadUrl : '${cPath}/lms/mailFiles.do',
		height : 400
	});
</script>
<script>
	var source = '<p class="fileBox col-lg-6">'
			+ '<input class="form-control" type="file" name="common_files">'
			+ '<span class="plusBtn btn btn-secondary">+</span>'
			+ '<span class="delBtn btn btn-danger">-</span>' + '</p>';

	$(".fileArea").on("click", ".plusBtn", function() {
		$(this).parents(".fileArea:first").append(source);
	});

	$(".fileArea").on("click", ".delBtn", function() {
		$(this).parent("p").remove();
	});

	let submitForm = $("#submitForm");
	$(".delBtn").on("click", function() {
		let fileSpan = $(this).prev("a");
		let delAttNo = fileSpan.data("attno");
		console.log("delAttNo : " + delAttNo);
		let newInput = $("<input>").attr({
			"type" : "hidden",
			"name" : "delAttNos"
		}).val(delAttNo);

		submitForm.append(newInput);
		fileSpan.hide();
	});

	$("#saveBtn").on("click", function() {
		let submitForm = $("#submitForm");
		let state = $("input[name='state']").val();
		if (state == 'update') {
			let action = "${cPath}/lms/resumeUpdate.do";
			submitForm.attr("action", action);
			submitForm.attr("method", "post");
			submitForm.submit();
		} else {
			let action = "${cPath}/lms/resumeInsert.do";
			submitForm.attr("action", action);
			submitForm.attr("method", "post");
			submitForm.submit();
		}
	});

	$("#realDelBtn").on("click", function() {
		let submitForm = $("#deleteForm");
		submitForm.submit();
	});
</script>