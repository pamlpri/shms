<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
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
			<li class="breadcrumb-item active" aria-current="page">내정보보기</li>
		</ol>
	</nav>
	<section class="section">
		<div class="card">
			<div class="card-body">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="profile-tab" data-bs-toggle="tab"
						href="#profile" role="tab" aria-controls="profile"
						aria-selected="false">학적정보</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="trans-tab" data-bs-toggle="tab" href="#trans" role="tab"
						aria-controls="trans" aria-selected="true">학적변동</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="row">
							<div class="col-lg-3 profileImg">
								<img src="${cPath }/resources/lms/assets/images/faces/1.jpg" />
							</div>
							<div class="col-12 col-lg-9">
								<div class="card-content">
									<!-- table striped -->
									<form class="table-responsive">
										<table class="table .thead-light mb-0"
											style="border-top: 2px solid #95a3d6;">
											<tbody">
												<tr>
													<th class="text-bold-500 text-center align-middle">학번</th>
													<td><input id="stdnt_no" class="form-control" disabled type="text"
														value="${student.stdnt_no }"></td>
													<th class="text-bold-500 text-center align-middle">이름</th>
													<td><input class="form-control" disabled type="text"
														value="${student.name }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">주민번호</th>
													<td><input class="form-control" disabled type="text"
														value="${student.regno1 } - ${student.regno2}"></td>
													<th class="text-bold-500 text-center align-middle">성별</th>
													<td>
														<c:choose>
															<c:when test="${student.gen eq 'F' }">
																<input class="form-control" disabled type="text"
																	value="여자">													
															</c:when>
															<c:otherwise>
																<input class="form-control" disabled type="text"
																	value="남자">
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">전공</th>
													<td><input class="form-control" disabled type="text"
														value="${subject.sub_name }"></td>
													<th class="text-bold-500 text-center align-middle">년제</th>
													<td><input class="form-control" disabled type="text"
														value="4년제"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">입학구분</th>
													<td><input class="form-control" disabled type="text"
														value="신입학"></td>
													<th class="text-bold-500 text-center align-middle">입학일자</th>
													<td><input class="form-control" disabled type="date"
														value="${student.entsch_de }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">학년</th>
													<td><input class="form-control" disabled type="text"
														value="${student.grade }"></td>
													<th class="text-bold-500 text-center align-middle">학기</th>
													<td><input class="form-control" disabled type="text"
														value="${student.semstr }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">학적상태</th>
													<td><input class="form-control" disabled type="text"
														value="재학"></td>
													<th class="text-bold-500 text-center align-middle">최종변동</th>
													<td><input class="form-control" disabled type="text"
														value="신입학"></td>
												</tr>
											</tbody>
										</table>
										<table class="table .thead-light mb-0"
											style="border-top: 2px solid #95a3d6">
											<tbody>
												<tr>
													<th class="text-bold-500 text-center align-middle">졸업상태</th>
													<td><input class="form-control" disabled type="text"
														value="재학중"></td>
													<th class="text-bold-500 text-center align-middle">졸업년도</th>
													<td><input class="form-control" disabled type="text"
														value=""></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">졸업일자</th>
													<td><input class="form-control" disabled type="text"
														value=${student.grdtn_de }></td>
													<th class="text-bold-500 text-center align-middle">학위명</th>
													<td><input class="form-control" disabled type="text"
														value=""></td>
												</tr>
											</tbody>
										</table>
										<table class="table .thead-light mb-0"
											style="border-top: 2px solid #95a3d6; border-bottom: 2px solid #95a3d6;">
											<tbody>
												<tr>
													<th class="text-bold-500 text-center align-middle">계좌은행</th>
													<td><input class="form-control" type="text" value="${student.bank_name }"></td>
													<th class="text-bold-500 text-center align-middle">계좌변호</th>
													<td><input class="form-control" type="text"
														value="${student.account }"></td>
												</tr>
											</tbody>
										</table>
										<table class="table .thead-light mb-0">
											<tbody>
												<tr>
													<th class="text-bold-500 text-center align-middle">&nbsp;&nbsp;&nbsp;&nbsp;웹메일&nbsp;&nbsp;&nbsp;</th>
													<td colspan="3" id="webMailBox">
														<c:choose>
															<c:when test="${not empty student.webmail }">
																<input class='form-control' disabled type='text' value='${student.webmail }'>
															</c:when>
															<c:otherwise>
																<button type="button"
																	class="btn btn-primary" data-bs-toggle="modal"
																	data-bs-target="#primary" >웹메일 발급</button>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">전화번호</th>
													<td><input class="form-control" type="text"
														value="${student.tel_no }"></td>
													<th class="text-bold-500 text-center align-middle">&nbsp;&nbsp;Email&nbsp;&nbsp;&nbsp;</th>
													<td><input class="form-control" type="text"
														value="${student.email }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">우편번호</th>
													<td colspan="3">
														<div class="input-group">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-search"></i></span> <input type="text"
																class="form-control" aria-label="Recipient's username"
																aria-describedby="button-addon2" id="sample6_postcode"
																value="${student.zipcode }">
															<button onclick="sample6_execDaumPostcode()"
																class="btn btn-outline-secondary" type="button"
																id="button-addon2" style="border: 1px solid #dfdfdf;">검색</button>
														</div>
													</td>
												</tr>
												<tr style="border-bottom: 2px solid #95a3d6;">
													<th class="text-bold-500 text-center align-middle">기본주소</th>
													<td><input class="form-control" type="text"
														value="${student.addr1 }" id="sample6_address"></td>
													<th class="text-bold-500 text-center align-middle">상세주소</th>
													<td><input class="form-control" type="text"
														value="${student.addr2 }" id="sample6_detailAddress"></td>
												</tr>
											</tbody>
										</table>
										<div class="float-right" style="margin-top: 2%;">
											<a href="myPage.html" class="btn btn-primary">저장</a>
										</div>
									</form>
								</div>
							</div>
						</div>

						<!--primary theme Modal -->
						<div class="modal fade text-left" id="primary" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel160"
							aria-hidden="true">
							<div
								class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
								role="document">
								<div class="modal-content">
									<div class="modal-header bg-primary">
										<h5 class="modal-title white" id="myModalLabel160">인재대학교
											웹메일</h5>
										<button id="" type="button" class="close"
											data-bs-dismiss="modal" aria-label="Close">
											<i data-feather="x"></i>
										</button>
									</div>
									<div class="modal-body">
										<br /> 학교 웹메일 발급이 완료되었습니다.<br /> 웹메일은 통합정보시스템 웹메일 메뉴에서 사용할 수
										있습니다. <br /> <br />
									</div>
									<div class="modal-footer">
										<button id="webMail" type="button" class="btn btn btn-primary"
											data-bs-dismiss="modal">
											<i class="bx bx-x d-block d-sm-none"></i> <span
												class="d-none d-sm-block">닫기</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="trans" role="tabpanel"
						aria-labelledby="trans-tab">
						<div class="table-responsive">
							<table class="table table-striped mb-0">
								<thead>
									<tr>
										<th class="text-center">No.</th>
										<th class="text-center">학적변동</th>
										<th class="text-center">변동상세</th>
										<th class="text-center">변동일</th>
										<th class="text-center">복학예정년도</th>
										<th class="text-center">복학예정학기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="text-center">1</td>
										<td class="text-center">휴학</td>
										<td class="text-center">일반휴학</td>
										<td class="text-center">2020.03.04</td>
										<td class="text-center">2021년</td>
										<td class="text-center">1학기</td>
									</tr>
									<tr>
										<td class="text-center">2</td>
										<td class="text-center">복학</td>
										<td class="text-center">일반복학</td>
										<td class="text-center">2021.03.04</td>
										<td class="text-center"></td>
										<td class="text-center"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- contents end -->
</div>
<script src="${cPath }/resources/lms/assets/js/postcode.v2.js"></script>
<script>
	$("#webMail").on("click",function() {
		var stdnt_no = $("#stdnt_no").val();
		$.ajax({
			url: "${cPath}/lms/webMail.do"
			, data: {"stdnt_no" : stdnt_no}
			, success: function(res) {
				$("#webMailBox").children("button").css("display","none");
				$("#webMailBox").append("<input class='form-control' disabled type='text' value='"+ res.webMail +"'>");
			}
			, error: function(error, xhr, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
	});

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						if (data.userSelectedType === 'R') {
							addr = data.roadAddress;
						} else {
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
						}

						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>