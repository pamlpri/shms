<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20.      박초원        최초작성
* 2021. 5. 27.      송수미        학과 메인 페이지 구현
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--================ Start Home Banner Area =================-->
<section class="home_banner_area">
	<div class="banner_inner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner_content text-center">
						<h2 class="text-uppercase mt-4 mb-5">${subject.sub_name }</h2>
						<div>
							<a href="aboutSubject.html" class="primary-btn2 mb-3 mb-sm-0">학과소개</a>
							<a href="curriculum.html" class="primary-btn ml-sm-3 ml-0">교육과정</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================ End Home Banner Area =================-->

<!--================ Start Feature Area =================-->
<section class="feature_area section_gap_top">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<div class="main_title">
					<h2 class="mb-3">Awesome Feature</h2>
					<p>${subject.sub_name }를 소개합니다.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="single_feature">
					<div class="icon">
						<span class="flaticon-student"></span>
					</div>
					<a href="aboutSubject.html" class="desc">
						<h4 class="mt-3 mb-2">학과소개</h4>
						<p style="color: #7b838a;">${subject.sub_name } 방문해주신 분들 감사드립니다. ${subject.sub_name }를
							소개합니다.</p>
					</a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6">
				<div class="single_feature">
					<div class="icon">
						<span class="flaticon-book"></span>
					</div>
					<a href="curriculum.html" class="desc">
						<h4 class="mt-3 mb-2">교육과정</h4>
						<p style="color: #7b838a;">${subject.sub_name }의 창의적이고 혁신적인 교육과정을 소개합니다.</p>
					</a>
				</div>
			</div>

			<div class="col-lg-4 col-md-6">
				<div class="single_feature">
					<div class="icon">
						<span class="flaticon-earth"></span>
					</div>
					<a href="noticeSubject.html" class="desc">
						<h4 class="mt-3 mb-2">정보마당</h4>
						<p style="color: #7b838a;">${subject.sub_name }의 정보를 확인하세요. 언제든 문의에 답변해드립니다.
						</p>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!--================ End Feature Area =================-->

<!-- /# row -->
<section id="main-content">
	<div class="row" id="boardArea">
		<div class="col-lg-6">
			<div class="card board">
				<div class="card-title">
					<h4>
						학과공지<a href="noticeSubject.html" class="text-navy-color"
							style="float: right; padding-right: 20px;"><i
							class="fas fa-plus"></i></a>
					</h4>
				</div>
				<div class="card-body board-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">제목</th>
									<th class="text-center">작성일</th>
									<th class="text-center">조회수</th>
								</tr>
							</thead>
							<tbody>
	                          <c:choose>
	                          	<c:when test="${not empty hgList }">
	                          		<c:forEach items="${hgList }" var="hgBoard">
		                              <tr>
		                                <th scope="row" class="text-center">${hgBoard.p_bo_no }</th>
		                                <td class="text-center"><a href="${cPath }/subject/subjectNotice.do?bo_no=${hgBoard.bo_no}">${hgBoard.bo_title }</a></td>
		                                <td class="text-center">${hgBoard.bo_write_de }</td>
		                                <td class="text-center">${hgBoard.bo_hit }</td>
		                              </tr>
	                          		</c:forEach>
	                          	</c:when>
	                          	<c:otherwise>
	                          		<tr>
	                          			<td colspan="4" class="text-center">등록된 글이 존재하지 않습니다.</td>
	                          		</tr>
	                          	</c:otherwise>
	                          </c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /# column -->
		<div class="col-lg-6">
			<div class="card board">
				<div class="card-title">
					<h4>
						학과문의<a href="qnaSubject.html" class="text-navy-color"
							style="float: right; padding-right: 20px;"><i
							class="fas fa-plus"></i></a>
					</h4>
				</div>
				<div class="card-body board-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">제목</th>
									<th class="text-center">작성일</th>
									<th class="text-center">작성자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${not empty hmList }">
										<c:forEach items="${hmList }" var="hmBoard">
								     <tr>
								       <th scope="row" class="text-center">${hmBoard.p_bo_no }</th>
								       <td class="text-center"><a href="${cPath }/subject/subjectQna.do?bo_no=${hmBoard.bo_no}">${hmBoard.bo_title }</a></td>
								       <td class="text-center">${hmBoard.bo_write_de }</td>
								       <td class="text-center">${hmBoard.bo_hit }</td>
								     </tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="text-center">등록된 글이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /# column -->
	</div>

	<!-- /# row -->
</section>

<!--================ Start Trainers Area =================-->
<section class="trainer_area section_gap_top">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<div class="main_title">
					<h2 class="mb-3">학과 교수진</h2>
					<p>${subject.sub_name }의 교수진을 소개합니다.</p>
				</div>
			</div>
		</div>
		<div class="row justify-content-center d-flex align-items-center">
			<c:choose>
				<c:when test="${not empty profList }">
					<c:forEach items="${profList }" var="prof">
						<div class="col-lg-3 col-md-6 col-sm-12 single-trainer">
							<div class="thumb d-flex justify-content-sm-center">
								<img class="img-fluid" src="${cPath }/resources/subject/img/trainer/t4.jpg" alt="" />
							</div>
							<div class="meta-text text-sm-center">
								<h4>${prof.name }</h4>
								<p class="designation">${prof.tel_no }</p>
								<div class="align-items-center justify-content-center d-flex">
									<p>${prof.webmail }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					등록된 교수 정보가 없습니다.
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>
<!--================ End Trainers Area =================-->
