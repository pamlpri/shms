<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
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
			<div class="table-responsive">
				<table class="table table-bordered table-md"
					style="border-color: #dfdfdf;">
					<tr>
						<th rowspan="2" class="align-middle text-center">상담대상</th>
						<th class="align-middle text-center">학번</th>
						<td>${consulting.stdnt_no }</td>
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
						<td colspan="2">${consltDiary.consult_date }</td>
						<th class="align-middle text-center">작성자</th>
						<td>${userName }</td>
					</tr>
					<tr>
						<th class="align-middle text-center">상담주제</th>
						<td colspan="2">${consltDiary.thema }</td>
						<th class="align-middle text-center">상담분류</th>
						<td>${consulting.consult_cl_nm }</td>
					</tr>
					<tr>
						<th class="align-middle text-center">상담내용</th>
						<td colspan="4">${consltDiary.contents }</td>
					</tr>
				</table>
				<div class="text-center">
					<c:choose>
						<c:when test="${'PR' eq userSection }">
						<form action="${cPath}/lms/consultingUpdate.do" method="post">
							<input type="hidden" name="req_no" value="${consltDiary.req_no }" />
							<a href="${cPath }/lms/consultingAdmin.do" class="btn btn-primary">목록으로</a>	
							<button type="submit" class="btn btn-primary">수정</button>
						</form>
						</c:when>
						<c:otherwise>
							<a href="${cPath }/lms/consultingList.do" class="btn btn-primary">목록으로</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- contents end -->
</div>
<script src="assets/vendors/summernote/summernote-lite.min.js"></script>