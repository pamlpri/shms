<%--
* [[개정이력(Modification Information)]]
* 수정일           수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 2.      박초원        최초작성
* 2021. 6. 3.      송수미        수강신청 조회 기능 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cPath }/resources/lms/assets/css/pages/email.css">
<style>
    body {
        overflow-x: hidden;
    }
    .content-right{width:100%!important;}
</style>	
<div class="page-content">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${cPath }/lms/index.do">HOME</a></li>
			<li class="breadcrumb-item"><a href="${cPath }/lms/classRegistrationInfo.do">수강신청</a></li>
			<li class="breadcrumb-item active" aria-current="page">수강신청</li>
		</ol>
	</nav>

	<form id="searchForm">
		<div class="row">
			<div class="radioBox col-md-4 mb-4">
				<div class="form-check float-left">
					<input class="form-check-input" type="radio" name="classification"
						id="flexRadioDefault1"> <label class="form-check-label"
						for="flexRadioDefault1"> 장바구니 </label>
				</div>
				<div class="form-check float-left">
					<input class="form-check-input" type="radio" name="classification"
						id="flexRadioDefault2"> <label class="form-check-label"
						for="flexRadioDefault2"> 전공 </label>
				</div>
				<div class="form-check float-left">
					<input class="form-check-input" type="radio" name="classification"
						id="flexRadioDefault3"> <label class="form-check-label"
						for="flexRadioDefault3"> 교양 </label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-md-3 mb-2">
						<h6>단과대선택</h6>
						<fieldset class="form-group">
							<select class="form-select" name="col_code">
								<option>전체</option>
								<option>인문대학</option>
								<option>경상대학</option>
								<option>공과대학</option>
								<option>보건대학</option>
								<option>사회과학대학</option>
							</select>
						</fieldset>
					</div>
					<div class="col-md-3 mb-2">
						<h6>학과선택</h6>
						<fieldset class="form-group">
							<select class="form-select" name="sub_code">
								<option>전체</option>
								<option>러시아학과</option>
								<option>국어국문학과</option>
								<option>독일어문학과</option>
								<option>영문학과</option>
								<option>항공학과</option>
								<option>행정학과</option>
								<option>경영학과</option>
								<option>간호학과</option>
								<option>안경광학과</option>
								<option>러시아학과</option>
								<option>국어국문학과</option>
								<option>독일어문학과</option>
								<option>영문학과</option>
								<option>항공학과</option>
								<option>행정학과</option>
								<option>경영학과</option>
								<option>간호학과</option>
								<option>안경광학과</option>
							</select>
						</fieldset>
					</div>
					<div class="col-md-3 mb-2">
						<h6>학년</h6>
						<fieldset class="form-group">
							<select class="form-select">
								<option>전학년</option>
								<option>1학년</option>
								<option>2학년</option>
								<option>3학년</option>
								<option>4학년</option>
							</select>
						</fieldset>
					</div>
					<div class="col-md-3 mb-2">
						<h6>강의검색</h6>
						<fieldset class="form-group">
							<select class="form-select">
								<option>전체</option>
								<option>강의명</option>
								<option>강의코드</option>
								<option>강의교수</option>
							</select>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="searchWord" value="" />
	</form>
	<div class="page-heading email-application lectureHeader">
		<h5>
			<i class="fas fa-bookmark"></i> 수강신청과목
		</h5>
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-body">
						<!-- email app overlay -->
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<div class="email-app-list">
									<div class="email-action">
										<!-- action right start here -->
										<div
											class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
											<!-- search bar  -->
											<div class="email-fixed-search flex-grow-1">
												<div class="sidebar-toggle d-block d-lg-none">
													<i class="bx bx-menu"></i>
												</div>

												<div
													class="form-group position-relative  mb-0 has-icon-left">
													<input type="text" class="form-control" placeholder=""
														name="searchWord" value="">
													<div class="form-control-icon">
														<svg class="bi" width="1.5em" height="1.5em"
															fill="currentColor">
                                                                        <use
																xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#search" />
                                                                    </svg>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- / action right -->

									<form class="email-user-list list-group lectureList"
										id="lectureForm">
										<table class="table table-bordered mb-0">
											<thead>
												<tr>
													<th class="text-center">강의코드</th>
													<th class="text-center">이수구분</th>
													<th class="text-center">교과목명</th>
													<th class="text-center">담당교수</th>
													<th class="text-center">학년</th>
													<th class="text-center">학점</th>
													<th class="text-center">강의시간</th>
													<th class="text-center">수강인원</th>
													<th class="text-center">제한인원</th>
													<th class="text-center">신청</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
												<tr>
													<td class="text-center">212345</td>
													<td class="text-center">전필</td>
													<td class="text-center">시광학이론2222222</td>
													<td class="text-center">이현</td>
													<td class="text-center">1</td>
													<td class="text-center">3</td>
													<td class="text-center">월 1 2</td>
													<td class="text-center">50</td>
													<td class="text-center">100</td>
													<td class="text-center">
														<button type="button"
															class="btn btn-primary btn-sm saveBtn"
															data-bs-toggle="modal" data-bs-target="#success">신청</button>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- lecture list end -->
									</form>
								</div>
							</div>
							<!--/ lecture list Area -->
						</div>
					</div>
				</div>
		</section>
	</div>

	<div class="page-heading email-application lectureHeader">
		<h5>
			<i class="fas fa-bookmark"></i> 나의 수강신청현황
		</h5>
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-body">
						<!-- email app overlay -->
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<form class="email-user-list list-group lectureList"
									id="completionForm">
									<table class="table table-bordered mb-0">
										<thead>
											<tr>
												<th class="text-center">강의코드</th>
												<th class="text-center">이수구분</th>
												<th class="text-center">교과목명</th>
												<th class="text-center">담당교수</th>
												<th class="text-center">학년</th>
												<th class="text-center">학점</th>
												<th class="text-center">강의시간</th>
												<th class="text-center">수강인원</th>
												<th class="text-center">제한인원</th>
												<th class="text-center">신청</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">교필</td>
												<td class="text-center">시광학이론</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">교필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">교필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">전필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">전필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">전필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">전필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">212345</td>
												<td class="text-center">전필</td>
												<td class="text-center">시광학이론2222222</td>
												<td class="text-center">이현</td>
												<td class="text-center">1</td>
												<td class="text-center">3</td>
												<td class="text-center">월 1 2</td>
												<td class="text-center">50</td>
												<td class="text-center">100</td>
												<td class="text-center">
													<button type="button"
														class="btn btn-primary btn-sm deleteBtn">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
									<!-- lecture list end -->
								</form>
							</div>
						</div>
						<!--/ lecture list Area -->

					</div>
				</div>
			</div>
		</section>
	</div>

	<div class="page-heading email-application">
		<section class="section content-area-wrapper">
			<div class="content-right">
				<div class="content-wrapper">
					<div class="content-body">
						<!-- email app overlay -->
						<div class="email-app-area">
							<!-- Email list Area -->
							<div class="email-app-list-wrapper">
								<div class="email-user-list list-group lectureList">
									<table class="table table-bordered mb-0">
										<tr>
											<th class="text-center text-middle">신청교과목수</th>
											<td class="text-center text-middle">${sugangReqIndexInfo.sugang_lec_cnt }과목</td>
											<th class="text-center text-middle">신청학점</th>
											<td class="text-center text-middle">${sugangReqIndexInfo.sugang_at_pnt }학점</td>
											<th class="text-center text-middle">수강 가능 학점</th>
											<td class="text-center text-middle">${sugangReqIndexInfo.lec_able_pnt }학점</td>
										</tr>
									</table>
									<!-- lecture list end -->
								</div>
							</div>
						</div>
						<!--/ lecture list Area -->
					</div>
				</div>
			</div>
		</section>
	</div>
</div>