<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 24.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main Content -->
<div class="main-content">
	<section class="section">
		<div class="section-header">
			<h1>${lecture.lec_name}</h1>
		</div>

		<div class="row" id="lectureIcon">
			<div class="col-lg-3 col-md-6 col-sm-6 col-12">
				<a href="${cPath }/lecture/notice.do" class="card card-statistic-1"
					style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
					<div class="card-icon bg-danger">
						<i class="fas fa-bell"></i>
					</div>
					<div class="card-wrap">
						<div class="card-header">
							<h4>공지사항</h4>
						</div>
						<div class="card-body">42</div>
					</div>
				</a>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12">
				<a href="qnaLecture.html" class="card card-statistic-1"
					style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
					<div class="card-icon bg-primary">
						<i class="fas fa-chalkboard-teacher"></i>
					</div>
					<div class="card-wrap">
						<div class="card-header">
							<h4>강의 Q&A</h4>
						</div>
						<div class="card-body">10</div>
					</div>
				</a>
			</div>
		</div>

		<h2 class="section-title">강의개요</h2>
		<div class="section-body">
			<div class="card" style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
				<div class="card-header" style="border-bottom-color: #dfdfdf;">
					<h4>
						<i class="fas fa-university"></i> 학습목표
					</h4>
				</div>
				<div class="card-body">
					<p>${lecture.summary}<p>
				</div>
			</div>
			<div class="card" style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
				<div class="card-header" style="border-bottom-color: #dfdfdf;">
					<h4>
						<i class="far fa-check-square"></i> 평가방법
					</h4>
				</div>
				<div class="card-body">
					<p>중간고사(${lecture.midterm }), 기말고사(${lecture.finals }), 출석(${lecture.attend })</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section">
		<h2 class="section-title">이번주강의</h2>
	</section>
	
	<c:if test="${not empty lecture.lec_week }">
		<div class="card" id="curWeek"
			style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
			<div class="card-body p-0">
				<h6>${lecture.lec_week }주차 [${lecture.week_bgnde} - ${lecture.week_endde}] :  ${lecture.diary_title }</h6>
				<a class="text-color text-deco-none" href="lecture.html"> ${lecture.diary_cont }</a>
			</div>
		</div>
	</c:if>
</div>
