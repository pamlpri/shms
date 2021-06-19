<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 2.      최희수        정보 조회, 변동사항 조회
* 2021. 6. 9	   박초원 		 비밀번호 변경 탭 추가
* 2021. 6.  10.  박초원          비밀번호 변경 기능 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="password-tab" data-bs-toggle="tab" href="#password" role="tab"
						aria-controls="password" aria-selected="true">비밀번호 변경</a></li>
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
									<form class="table-responsive" action="${cPath }/lms/myPage.do" method="post">
										<table class="table .thead-light mb-0"
											style="border-top: 2px solid #95a3d6;">
											<tbody>
												<tr>
													<th class="text-bold-500 text-center align-middle">학번</th>
													<td><input id="stdnt_no" class="form-control" disabled type="text"
														value="${mypage.stdnt_no }"></td>
													<th class="text-bold-500 text-center align-middle">이름</th>
													<td><input class="form-control" disabled type="text"
														value="${mypage.name }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">주민번호</th>
													<td><input class="form-control" disabled type="text"
														value="${mypage.regno1 } - ${mypage.regno2}"></td>
													<th class="text-bold-500 text-center align-middle">성별</th>
													<td>
														<c:choose>
															<c:when test="${mypage.gen eq 'F' }">
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
														value="${mypage.entsch_de }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">학년</th>
													<td><input class="form-control" disabled type="text"
														value="${mypage.grade }"></td>
													<th class="text-bold-500 text-center align-middle">학기</th>
													<td><input class="form-control" disabled type="text"
														value="${mypage.semstr }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">학적상태</th>
													<td><input class="form-control" disabled type="text"
														value="${mypage.reginfo_stat }"></td>
													<th class="text-bold-500 text-center align-middle">최종변동</th>
													<td><input class="form-control" disabled type="text"
														value="${req_resn_code_name }"></td>
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
														value=${mypage.grdtn_de }></td>
													<th class="text-bold-500 text-center align-middle">학위명</th>
													<td><input class="form-control" disabled type="text"
														value="석사"></td>
												</tr>
											</tbody>
										</table>
										<table class="table .thead-light mb-0"
											style="border-top: 2px solid #95a3d6; border-bottom: 2px solid #95a3d6;">
											<tbody>
												<tr>
													<th class="text-bold-500 text-center align-middle">계좌은행</th>
													<td><input class="form-control" type="text" name="bank_name" value="${mypage.bank_name }"></td>
													<th class="text-bold-500 text-center align-middle">계좌변호</th>
													<td><input class="form-control" type="text" name="account"
														value="${mypage.account }"></td>
												</tr>
											</tbody>
										</table>
										<table class="table .thead-light mb-0">
											<tbody>
												<tr>
													<th class="text-bold-500 text-center align-middle">웹메일</th>
													<td colspan="3" id="webMailBox">
														<c:choose>
															<c:when test="${not empty mypage.webmail }">
																<input class='form-control' disabled type='text' value='${mypage.webmail }'>
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
													<td><input class="form-control" type="text" name="tel_no"
														value="${mypage.tel_no }"></td>
													<th class="text-bold-500 text-center align-middle">Email</th>
													<td><input class="form-control" type="text" name="email"
														value="${mypage.email }"></td>
												</tr>
												<tr>
													<th class="text-bold-500 text-center align-middle">우편번호</th>
													<td>
														<div class="input-group">
															<span class="input-group-text" id="basic-addon1"><i
																class="bi bi-search"></i></span> <input type="text"
																class="form-control" aria-label="Recipient's username"
																aria-describedby="button-addon2" id="sample6_postcode" name="zipcode"
																value="${mypage.zipcode }">
															<button onclick="sample6_execDaumPostcode()"
																class="btn btn-outline-secondary" type="button"
																id="button-addon2" style="border: 1px solid #dfdfdf;">검색</button>
														</div>
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr style="border-bottom: 2px solid #95a3d6;">
													<th class="text-bold-500 text-center align-middle">기본주소</th>
													<td><input class="form-control" type="text" name="addr1"
														value="${mypage.addr1 }" id="sample6_address"></td>
													<th class="text-bold-500 text-center align-middle">상세주소</th>
													<td><input class="form-control" type="text" name="addr2"
														value="${mypage.addr2 }" id="sample6_detailAddress"></td>
												</tr>
											</tbody>
										</table>
										<div class="float-right" style="margin-top: 2%;">
											<input type="submit" class="btn btn-primary" value="저장">
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
									<c:set var="today" value="<%=new java.util.Date()%>" />
									<c:if test="${not empty regInfoCngList }">
										<c:forEach items="${regInfoCngList }" var="reginfo" varStatus="status">
										<c:set var="year">
											<fmt:formatDate value="${today }" pattern="yyyy"/>
										</c:set>
											<tr>
												<td class="text-center">${status.index+1  }</td>
												<td class="text-center">${reginfo.req_cl_name }</td>
												<td class="text-center">${reginfo.req_resn_code_name }</td>
												<td class="text-center">${reginfo.cng_bgnde }</td>
												<c:choose>
													<c:when test="${reginfo.req_cl_code eq 'BH' or reginfo.req_cl_code eq 'JT' }">
														<td class="text-center"></td>
														<td class="text-center"></td>																		
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${not empty reginfo.cng_endde }">
																<td class="text-center">${fn:substring(reginfo.cng_endde, 0, 4) }년</td>
															</c:when>
															<c:otherwise>
																<td class="text-center">${year }년</td>
															</c:otherwise>
														</c:choose>
														<td class="text-center">${mypage.semstr }학기</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>									
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="password" role="tabpanel"
						aria-labelledby="password-tab">
						<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center mb-4">
							<div class="container">
								<div class="row align-items-center">
									<div class="col-md-6 pwImg">
										<img src="${cPath }/resources/lms/assets/images/password.png" alt="">
									</div>
									<div class="col-md-6">
										<div class="login-box bg-white box-shadow border-radius-10">
											<div class="login-title">
												<h2 class="text-center text-primary mb-4">Reset Password</h2>
											</div>
											<form action="${cPath }/lms/newPassword.do" method="post" id="newForm">
												<div class="form-group has-icon-left">
                                                    <div class="position-relative">
                                                        <input type="password" class="form-control" placeholder="현재 비밀번호" name="cur_password">
                                                        <div class="form-control-icon">
                                                            <i class="bi bi-key-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
												<div class="form-group has-icon-left">
                                                    <div class="position-relative">
                                                        <input type="password" class="form-control" placeholder="새 비밀번호" name="user_password">
                                                        <div class="form-control-icon">
                                                            <i class="bi bi-unlock-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
												<div class="form-group has-icon-left">
                                                    <div class="position-relative">
                                                        <input type="password" class="form-control" placeholder="비밀번호 확인" name="confirm_password">
                                                        <div class="form-control-icon">
                                                            <i class="bi bi-lock-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text-center mt-4">
                                                	<button type="button" onclick="location.href='${cPath}/lms/myPage.do'" class="btn btn-light-secondary">취소</button>
                                                	<button type="button" class="btn btn-primary" id="newBtn" >저장</button>
                                                </div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:if test="${not empty message }">
			<script>
				$(function(){
					$("#default").find(".modal-title").empty().text("비밀번호 오류");
					$("#default").find(".modal-body p").empty().text("사용중인 비밀번호가 아닙니다. ");
					$("#default").addClass("show").css("display","block");
					$("input[name='cur_password']").addClass("is-invalid");
					$("#profile-tab").removeClass("active").attr("aria-selected", false);
					$("#profile").removeClass("active show");
					$("#password-tab").addClass("active").attr("aria-selected", true);
					$("#password").addClass("active show");
				});
			</script>
		</c:if>
		<!--Basic Modal -->
		<div class="modal fade text-left" id="default" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel1"></h5>
						<button type="button" class="close rounded-pill"
							data-bs-dismiss="modal" aria-label="Close">
							<i data-feather="x"></i>
						</button>
					</div>
					<div class="modal-body">
						<p>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" id="close"
 							data-bs-dismiss="modal">
							<i class="bx bx-x d-block d-sm-none"></i> <span
								class="d-none d-sm-block">닫기</span>
						</button>
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
	
	$("#newBtn").on("click", function(){
		let user_password = $("input[name='user_password']").val();
		let confirm_password = $("input[name='confirm_password']").val();
		console.log(user_password);
		console.log(confirm_password);
		
		var regExpPw = /(?=.*\d{1,16})(?=.*[~`!@#$%\^&*()-+=]{1,16})(?=.*[a-zA-Z]{2,50})$/;
		
		if(user_password != confirm_password){
			$("#default").find(".modal-title").empty().text("비밀번호 오류");
			$("#default").find(".modal-body p").empty().text("새 비밀번호가 일치하지 않습니다. ");
			$("#default").addClass("show").css("display","block");
			$("input[name='confirm_password'], input[name='user_password']").addClass("is-invalid");
		}else if(!regExpPw.test(user_password)){
			$("#default").find(".modal-title").empty().text("비밀번호 형식 오류");
			$("#default").find(".modal-body p").empty().text("비밀번호는 영문 2자리 이상, 숫자, 특수문자 1자리 이상 사용하여 총 8자리 입니다.");
			$("#default").addClass("show").css("display","block");
			$("input[name='confirm_password'], input[name='user_password']").addClass("is-invalid");
		}else {
			$("#newForm").submit();
		}
	});
	
	$("#close, .modal").on("click", function(){
		$("#default").removeClass("show").css("display","none");
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