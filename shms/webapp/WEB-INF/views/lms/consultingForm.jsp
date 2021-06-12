<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 9.	   박초원        ckeditor 적용
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<div class="page-content">
	<!-- contents start -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">HOME</a></li>
			<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">지도교수상담</li>
		</ol>
	</nav>


	<div class="card inputTable">
		<div class="card-body">
			<c:if test="${isUpdate ne 'update' or empty isUpdate}">
				<iframe src="https://192.168.0.171:3000" allow='camera *; microphone *' width="100%" height="500"
					id="videoView">
				</iframe>			
			</c:if>
			
			<c:choose>
				<c:when test="${'PR' eq section}">
					<!-- 교수만 보이는 폼 -->
					<form id="consultingDiary" action="${cPath }/lms/consultingView.do" class="table-responsive" method="post">
						<input type="hidden" name="req_no" value="${consulting.req_no }" />
						<input type="hidden" name="isUpdate" value="${isUpdate }" />
						<table class="table table-bordered table-md">
							<tr>
								<th rowspan="2" class="align-middle text-center">상담대상</th>
								<th class="align-middle text-center">학번</th>
								<td>${student.stdnt_no }</td>
								<th class="align-middle text-center">이름</th>
								<td>${student.name }</td>
							</tr>
							<tr>
								<th class="align-middle text-center">전화번호</th>
								<td>${student.tel_no }</td>
								<th class="align-middle text-center">웹메일</th>
								<td>${student.webmail }</td>
							</tr>
							<tr>
								<th class="align-middle text-center">상담일자</th>
								<td colspan="2">${consulting.hope_date }</td>
								<th class="align-middle text-center">작성자</th>
								<td>${userName }</td>
							</tr>
							<tr>
								<th class="align-middle text-center">상담주제</th>
								<td colspan="2">
								<textarea class="form-control" id="floatingTextarea" name="thema">${consltDiary.thema }</textarea></td>
								<th class="align-middle text-center">상담분류</th>
								<td>${consulting.consult_cl_nm }</td>
							</tr>
							<tr>
								<th class="align-middle text-center">내용</th>
								<td colspan="4">
									<textarea class="form-control" rows="5" cols="700" name="contents" id="contents">${consltDiary.contents }</textarea>
								</td>
							</tr>
						</table>
						<div class="text-center">
							<a href="${cPath }/lms/consultingAdmin.do" class="btn btn-secondary">취소</a>
							<button id="sendBtn" type="submit" class="btn btn-primary">저장</button>
						</div>
					</form>
				</c:when>
				<c:when test="${'PR' ne section }">
					<div class="text-center">
						<a href="${cPath }/lms/consultingList.do" class="btn btn-primary">목록으로</a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<!-- contents end -->
</div>
<script type="text/javascript" src="${cPath }/resources/main/js/ckeditor/ckeditor.js"></script>
<script>
    CKEDITOR.replace("contents", {
		filebrowserUploadUrl : '${cPath}/lms/consultingFiles.do'
	});
</script>