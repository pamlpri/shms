<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Main Content -->
<div class="main-content">
	<section class="section">
		<div class="section-header">
			<!-- 강의명 -->
			<h1>대학생활의 이해</h1>
		</div>
	</section>

	<div class="row" id="lectureIcon">
		<div class="col-lg-3 col-md-6 col-sm-6 col-12">
			<a href="qrCheck.html" class="card card-statistic-1"
				style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
				<div class="card-icon bg-warning">
					<i class="far fa-calendar-check"></i>
				</div>
				<div class="card-wrap">
					<div class="card-header">
						<h4>QR체크</h4>
					</div>
					<div class="card-body">출석하기</div>
				</div>
			</a>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6 col-12">
			<a href="noticeLecture.html" class="card card-statistic-1"
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

	<section class="section">
		<h2 class="section-title">강의개요</h2>
	</section>
	<div class="section-body">
		<div class="card" style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
			<div class="card-header" style="border-bottom-color: #dfdfdf;">
				<h4>
					<i class="fas fa-university"></i> 학습목표
				</h4>
			</div>
			<div class="card-body">
				<p>학습 데이터를 활용하기 위한 수집, 분석, 처리 과정을 설계하고 실행할 수 있다.</p>
			</div>
		</div>
		<div class="card" style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
			<div class="card-header" style="border-bottom-color: #dfdfdf;">
				<h4>
					<i class="far fa-check-square"></i> 평가방법
				</h4>
			</div>
			<div class="card-body">
				<p>성적(60%), 과제(30%), 출석(20%)</p>
			</div>
		</div>
	</div>

	<section class="section">
		<h2 class="section-title">이번주강의</h2>
	</section>

	<div class="card" id="curWeek"
		style="box-shadow: 0 4px 8px rgb(0 0 0/ 12%);">
		<div class="card-body p-0">
			<h6>2주차 [3월11일 - 3월17일] : 학습 데이터</h6>
			<a class="text-color text-deco-none" href="lecture.html"> 2주차
				데이터베이스 이론 1차 : 2021년 05월 3일 ~ 2021년 05월 10일 </a>
		</div>
	</div>
</div>
</div>