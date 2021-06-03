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
						<td>S1401001</td>
						<th class="align-middle text-center">이름</th>
						<td>강미나</td>
					</tr>
					<tr>
						<th class="align-middle text-center">전화번호</th>
						<td>010-2344-1234</td>
						<th class="align-middle text-center">웹메일</th>
						<td>asdgasdg@shms.ac</td>
					</tr>
					<tr>
						<th class="align-middle text-center">상담일자</th>
						<td colspan="2">2020.05.01</td>
						<th class="align-middle text-center">작성자</th>
						<td>하재관</td>
					</tr>
					<tr>
						<th class="align-middle text-center">상담주제</th>
						<td colspan="2">진로방향 설정</td>
						<th class="align-middle text-center">상담분류</th>
						<td>진로</td>
					</tr>
					<tr>
						<th class="align-middle text-center">상담내용</th>
						<td colspan="4">Lorem Ipsum is simply dummy text of the
							printing and typesetting industry. Lorem Ipsum has been the
							industry's standard dummy text ever since the 1500s, when an
							unknown printer took a galley of type and scrambled it to make a
							type specimen book. It has survived not only five centuries, but
							also the leap into electronic typesetting, remaining essentially
							unchanged. It was popularised in the 1960s with the release of
							Letraset sheets containing Lorem Ipsum passages, and more
							recently with desktop publishing software like Aldus PageMaker
							including versions of Lorem Ipsum.</td>
					</tr>
				</table>
				<div class="text-center">
					<a href="consulting.html" class="btn btn-primary">목록으로</a>
					<!-- 교수만 보이는 버튼 -->
					<button onclick="location.href='${cPath}/lms/consultingUpdate.do'"
						class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger block"
						data-bs-toggle="modal" data-bs-target="#default">삭제</button>
				</div>
			</div>
		</div>
	</div>

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
					<p>
						삭제한 게시글은 복원이 불가합니다.<br /> 삭제하시겠습니까?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  btn-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">닫기</span>
					</button>
					<button type="button" class="btn btn-primary ml-1"
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
<script src="assets/vendors/summernote/summernote-lite.min.js"></script>