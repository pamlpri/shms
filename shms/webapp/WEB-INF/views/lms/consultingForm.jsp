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
			<iframe src="https://192.168.0.140:3000" allow='camera *; microphone *' width="100%" height="500"
				id="videoView"></iframe>
			
			<c:choose>
				<c:when test="${not empty staff}">
					<!-- 교수만 보이는 폼 -->
					<form class="table-responsive">
						<table class="table table-bordered table-md">
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
								<td colspan="2"><textarea class="form-control"
										id="floatingTextarea"></textarea></td>
								<th class="align-middle text-center">상담분류</th>
								<td>진로</td>
							</tr>
							<tr>
								<th class="align-middle text-center">내용</th>
								<td colspan="4">
									<div id="summernote"></div>
								</td>
							</tr>
						</table>
						<div class="text-center">
							<a href="consultingAdmin.html" class="btn btn-secondary">취소</a>
							<a href="consultingAdmin.html" class="btn btn-primary">저장</a>
						</div>
					</form>
				</c:when>
				<c:when test="${empty staff }">
					<div class="text-center">
						<a href="${cPath }/lms/consultingList.do" class="btn btn-primary">목록으로</a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/vendors/summernote/summernote-lite.min.js"></script>
    <script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 800,
        })
        $("#hint").summernote({
            height: 100,
            toolbar: false,
            placeholder: 'type with apple, orange, watermelon and lemon',
            hint: {
                words: ['apple', 'orange', 'watermelon', 'lemon'],
                match: /\b(\w{1,})$/,
                search: function (keyword, callback) {
                    callback($.grep(this.words, function (item) {
                        return item.indexOf(keyword) === 0;
                    }));
                }
            }
        });

    </script>